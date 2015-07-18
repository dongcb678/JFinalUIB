package little.ant.platform.run;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.beetl.core.GroupTemplate;
import org.snaker.jfinal.plugin.SnakerPlugin;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallConfig;
import com.alibaba.druid.wall.WallFilter;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect;
import com.jfinal.plugin.activerecord.tx.TxByActionKeys;
import com.jfinal.plugin.activerecord.tx.TxByRegex;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;

import little.ant.platform.beetl.format.DateFormat;
import little.ant.platform.beetl.func.EscapeXml;
import little.ant.platform.beetl.func.HasPrivilegeUrl;
import little.ant.platform.beetl.func.I18nFormat;
import little.ant.platform.beetl.func.OrderBy;
import little.ant.platform.beetl.render.MyBeetlRenderFactory;
import little.ant.platform.beetl.tag.DictTag;
import little.ant.platform.beetl.tag.ParamTag;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.handler.GlobalHandler;
import little.ant.platform.interceptor.AuthInterceptor;
import little.ant.platform.interceptor.ParamPkgInterceptor;
import little.ant.platform.plugin.ControllerPlugin;
import little.ant.platform.plugin.FileRenamePlugin;
import little.ant.platform.plugin.I18NPlugin;
import little.ant.platform.plugin.ParamInitPlugin;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.plugin.SqlXmlPlugin;
import little.ant.platform.plugin.TablePlugin;
import little.ant.platform.thread.DataClear;
import little.ant.platform.thread.ThreadSysLog;
import little.ant.platform.thread.TimerResources;
import little.ant.platform.tools.ToolString;
import little.ant.weixin.lucene.DocKeyword;

/**
 * Jfinal API 引导式配置
 */
public class JfinalConfig extends JFinalConfig {
	
	private static Logger log = Logger.getLogger(JfinalConfig.class);
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		log.info("configConstant 缓存 properties");
		new PropertiesPlugin(loadPropertyFile("init.properties")).start();

		log.info("configConstant 设置字符集");
		me.setEncoding(ToolString.encoding); 

		log.info("configConstant 设置是否开发模式");
		me.setDevMode(getPropertyToBoolean(ConstantInit.config_devMode, false));
		//me.setViewType(ViewType.JSP);//设置视图类型为Jsp，否则默认为FreeMarker

		log.info("configConstant 视图Beetl设置");
		me.setMainRenderFactory(new MyBeetlRenderFactory()); // BeetlRenderFactory( new WebAppResourceLoader(PathKit.getWebRootPath() + "") )
		
		// 修正Weblogic 11g下beetl web路径获取不正确的bug，Configuration.defaultConfiguration() 会抛出IO异常
//		try {
//			MyBeetlRenderFactory.groupTemplate.setConf(Configuration.defaultConfiguration());
//			MyBeetlRenderFactory.groupTemplate.setResourceLoader(new WebAppResourceLoader(PathKit.getWebRootPath()+"/WEB-INF/view/"));
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		GroupTemplate groupTemplate = MyBeetlRenderFactory.groupTemplate;
		
		groupTemplate.registerFunction("hasPrivilegeUrl", new HasPrivilegeUrl());
		groupTemplate.registerFunction("orderBy", new OrderBy());
		groupTemplate.registerFunction("escapeXml", new EscapeXml());
		groupTemplate.registerFunction("i18nFormat", new I18nFormat());
		
		groupTemplate.registerTag("dict", DictTag.class);
		groupTemplate.registerTag("param", ParamTag.class);

		groupTemplate.registerFormat("dateFormat", new DateFormat());
		
		log.info("configConstant 视图error page设置");
		me.setError404View("/common/404.html");
		me.setError500View("/common/500.html");
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) { 
		log.info("configRoute 路由扫描注册");
		new ControllerPlugin(me).start();
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		log.info("configPlugin 配置Druid数据库连接池连接属性");
		DruidPlugin druidPlugin = new DruidPlugin(
				(String)PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_jdbcUrl), 
				(String)PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_userName), 
				(String)PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_passWord), 
				(String)PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_driverClass));

		log.info("configPlugin 配置Druid数据库连接池大小");
		druidPlugin.set(
				(Integer)PropertiesPlugin.getParamMapValue(ConstantInit.db_initialSize), 
				(Integer)PropertiesPlugin.getParamMapValue(ConstantInit.db_minIdle), 
				(Integer)PropertiesPlugin.getParamMapValue(ConstantInit.db_maxActive));
		
		log.info("configPlugin 配置Druid数据库连接池过滤器配制");
		druidPlugin.addFilter(new StatFilter());
		WallFilter wall = new WallFilter();
		wall.setDbType((String) PropertiesPlugin.getParamMapValue(ConstantInit.db_type_key));
		WallConfig config = new WallConfig();
		config.setFunctionCheck(false); // 支持数据库函数
		wall.setConfig(config);
		druidPlugin.addFilter(wall);
		
		log.info("configPlugin 配置ActiveRecord插件");
		ActiveRecordPlugin arpMain = new ActiveRecordPlugin(ConstantInit.db_dataSource_main, druidPlugin);
		//arp.setTransactionLevel(4);//事务隔离级别
		arpMain.setDevMode(getPropertyToBoolean(ConstantInit.config_devMode, false)); // 设置开发模式
		arpMain.setShowSql(getPropertyToBoolean(ConstantInit.config_devMode, false)); // 是否显示SQL

		log.info("configPlugin 数据库类型判断");
		String db_type = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_type_key);
		if(db_type.equals(ConstantInit.db_type_postgresql)){
			log.info("configPlugin 使用数据库类型是 postgresql");
			arpMain.setDialect(new PostgreSqlDialect());
			arpMain.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 配置属性名(字段名)大小写不敏感容器工厂
			
		}else if(db_type.equals(ConstantInit.db_type_mysql)){
			log.info("configPlugin 使用数据库类型是 mysql");
			arpMain.setDialect(new MysqlDialect());
			arpMain.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 配置属性名(字段名)大小写不敏感容器工厂
		
		}else if(db_type.equals(ConstantInit.db_type_oracle)){
			log.info("configPlugin 使用数据库类型是 oracle");
			druidPlugin.setValidationQuery("select 1 FROM DUAL"); //指定连接验证语句(用于保存数据库连接池), 这里不加会报错误:invalid oracle validationQuery. select 1, may should be : select 1 FROM DUAL 
			arpMain.setDialect(new OracleDialect());
			arpMain.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 配置属性名(字段名)大小写不敏感容器工厂
		}

		log.info("configPlugin 添加druidPlugin插件");
		me.add(druidPlugin); // 多数据源继续添加
		
		log.info("configPlugin 表扫描注册");
		Map<String, ActiveRecordPlugin> arpMap = new HashMap<String, ActiveRecordPlugin>();
		arpMap.put(ConstantInit.db_dataSource_main, arpMain); // 多数据源继续添加
		new TablePlugin(arpMap).start();
		me.add(arpMain); // 多数据源继续添加

		log.info("I18NPlugin 国际化键值对加载");
		me.add(new I18NPlugin());
		
		log.info("EhCachePlugin EhCache缓存");
		me.add(new EhCachePlugin());

		log.info("SqlXmlPlugin 解析并缓存 xml sql");
		me.add(new SqlXmlPlugin());
		
		log.info("afterJFinalStart 缓存参数");
		me.add(new ParamInitPlugin());
		
		log.info("afterJFinalStart 配置Snaker插件");
		SnakerPlugin snakerPlugin = new SnakerPlugin(druidPlugin, this.prop.getProperties());
	    me.add(snakerPlugin);

		log.info("afterJFinalStart 配置文件上传命名策略插件");
		me.add(new FileRenamePlugin());
		
	}

	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		//log.info("configInterceptor 支持使用session");
		//me.add(new SessionInViewInterceptor());
		
		log.info("configInterceptor 权限认证拦截器");
		me.add(new AuthInterceptor());
		
		log.info("configInterceptor 参数封装拦截器");
		me.add(new ParamPkgInterceptor());
		
		// 配置开启事物规则
		me.add(new TxByRegex(".*save.*"));
		me.add(new TxByRegex(".*update.*"));
		me.add(new TxByRegex(".*delete.*"));
		me.add(new TxByActionKeys("/jf/wx/message", "/jf/wx/message/index"));
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
		log.info("configHandler 全局配置处理器，主要是记录日志和request域值处理");
		me.add(new GlobalHandler());
	}
	
	/**
	 * 系统启动完成后执行
	 */
	public void afterJFinalStart() {
		log.info("afterJFinalStart 启动操作日志入库线程");
		ThreadSysLog.startSaveDBThread();

		boolean luceneIndex = getPropertyToBoolean(ConstantInit.config_luceneIndex, false);
		if(luceneIndex){
			log.info("afterJFinalStart 创建自动回复lucene索引");
			new DocKeyword().run(); 
		}
		
		log.info("afterJFinalStart 系统负载");
		TimerResources.start();
		
		log.info("afterJFinalStart 数据清理");
		DataClear.start();
	}
	
	/**
	 * 系统关闭前调用
	 */
	public void beforeJFinalStop() {
		log.info("beforeJFinalStop 释放lucene索引资源");
		new DocKeyword().close();

		log.info("beforeJFinalStop 释放日志入库线程");
		ThreadSysLog.setThreadRun(false);

		log.info("beforeJFinalStop 释放系统负载抓取线程");
		TimerResources.stop();

		log.info("beforeJFinalStop 数据清理");
		DataClear.stop();
	}
	
	/**
	 * 运行此 main 方法可以启动项目
	 * 说明：
	 * 1. linux 下非root账户运行端口要>1024
	 * 2. idea 中运行记得加上当前的module名称
	 */
	public static void main(String[] args) {
		JFinal.start("WebContent", 99, "/", 5); // 
		// JFinal.start("JfinalUIB/WebContent", 89, "/", 5); // idea 中运行记得加上当前的module名称
	}
}
