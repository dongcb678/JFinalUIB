package little.ant.pingtai.run;

import little.ant.pingtai.beetl.format.DateFormat;
import little.ant.pingtai.beetl.func.EscapeXml;
import little.ant.pingtai.beetl.func.HasPrivilegeUrl;
import little.ant.pingtai.beetl.func.OrderBy;
import little.ant.pingtai.beetl.render.MyBeetlRenderFactory;
import little.ant.pingtai.beetl.tag.DictTag;
import little.ant.pingtai.beetl.tag.ParamTag;
import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.handler.GlobalHandler;
import little.ant.pingtai.interceptor.AuthenticationInterceptor;
import little.ant.pingtai.interceptor.ParamPkgInterceptor;
import little.ant.pingtai.plugin.ControllerPlugin;
import little.ant.pingtai.plugin.I18NPlugin;
import little.ant.pingtai.plugin.PropertiesPlugin;
import little.ant.pingtai.plugin.SqlXmlPlugin;
import little.ant.pingtai.plugin.TablePlugin;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.thread.ThreadSysLog;
import little.ant.pingtai.thread.TimerResources;
import little.ant.pingtai.tools.ToolString;
import little.ant.weixin.lucene.DocKeyword;

import org.apache.log4j.Logger;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Configuration;
import org.beetl.core.resource.WebAppResourceLoader;

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
import com.jfinal.plugin.activerecord.tx.TxByActionMethods;
import com.jfinal.plugin.activerecord.tx.TxByRegex;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.kit.PathKit;

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
		me.setDevMode(getPropertyToBoolean(DictKeys.config_devMode, false));
		//me.setViewType(ViewType.JSP);//设置视图类型为Jsp，否则默认为FreeMarker

		log.info("configConstant 视图Beetl设置");
		me.setMainRenderFactory(new MyBeetlRenderFactory());
		
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
		
		groupTemplate.registerTag("dict", DictTag.class);
		groupTemplate.registerTag("param", ParamTag.class);

		groupTemplate.registerFormat("dateFormat", new DateFormat());
		
		log.info("configConstant 视图error page设置");
		me.setError401View("/common/401.html");
		me.setError403View("/common/403.html");
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
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_jdbcUrl), 
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_userName), 
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_passWord), 
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_driverClass));

		log.info("configPlugin 配置Druid数据库连接池大小");
		druidPlugin.set(
				(int)PropertiesPlugin.getParamMapValue(DictKeys.db_initialSize), 
				(int)PropertiesPlugin.getParamMapValue(DictKeys.db_minIdle), 
				(int)PropertiesPlugin.getParamMapValue(DictKeys.db_maxActive));
		
		log.info("configPlugin 配置ActiveRecord插件");
		ActiveRecordPlugin arpMain = new ActiveRecordPlugin(DictKeys.db_dataSource_main, druidPlugin);
		//arp.setTransactionLevel(4);//事务隔离级别
		arpMain.setDevMode(getPropertyToBoolean(DictKeys.config_devMode, false)); // 设置开发模式
		arpMain.setShowSql(getPropertyToBoolean(DictKeys.config_devMode, false)); // 是否显示SQL

		log.info("configPlugin 数据库类型判断");
		String db_type = (String) PropertiesPlugin.getParamMapValue(DictKeys.db_type_key);
		if(db_type.equals(DictKeys.db_type_postgresql)){
			log.info("configPlugin 使用数据库类型是 postgresql");
			arpMain.setDialect(new PostgreSqlDialect());
			
		}else if(db_type.equals(DictKeys.db_type_mysql)){
			log.info("configPlugin 使用数据库类型是 mysql");
			arpMain.setDialect(new MysqlDialect());
			arpMain.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 小写
		
		}else if(db_type.equals(DictKeys.db_type_oracle)){
			log.info("configPlugin 使用数据库类型是 oracle");
			druidPlugin.setValidationQuery("select 1 FROM DUAL"); //指定连接验证语句(用于保存数据库连接池), 这里不加会报错误:invalid oracle validationQuery. select 1, may should be : select 1 FROM DUAL 
			arpMain.setDialect(new OracleDialect());
			arpMain.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 配置属性名(字段名)大小写不敏感容器工厂
		}

		log.info("configPlugin 添加druidPlugin插件");
		me.add(druidPlugin); // 多数据源继续添加
		
		log.info("configPlugin 表扫描注册");
		Map<String, ActiveRecordPlugin> arpMap = new HashMap<String, ActiveRecordPlugin>();
		arpMap.put(DictKeys.db_dataSource_main, arpMain); // 多数据源继续添加
		new TablePlugin(arpMap).start();
		me.add(arpMain); // 多数据源继续添加

		log.info("I18NPlugin 国际化键值对加载");
		me.add(new I18NPlugin());
		
		log.info("EhCachePlugin EhCache缓存");
		me.add(new EhCachePlugin());

		log.info("SqlXmlPlugin 解析并缓存 xml sql");
		me.add(new SqlXmlPlugin());
	}

	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		//log.info("configInterceptor 支持使用session");
		//me.add(new SessionInViewInterceptor());
		
		log.info("configInterceptor 权限认证拦截器");
		me.add(new AuthenticationInterceptor());
		
		log.info("configInterceptor 参数封装拦截器");
		me.add(new ParamPkgInterceptor());
		
		// 配置开启事物规则
		me.add(new TxByActionMethods("save", "update", "delete"));
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
		log.info("afterJFinalStart 缓存参数");
		new ThreadParamInit().start();

		log.info("afterJFinalStart 启动操作日志入库线程");
		ThreadSysLog.startSaveDBThread();

		boolean luceneIndex = getPropertyToBoolean(DictKeys.config_luceneIndex, false);
		if(luceneIndex){
			log.info("afterJFinalStart 创建自动回复lucene索引");
			new DocKeyword().run(); 
		}
		
		log.info("afterJFinalStart 系统负载");
		TimerResources.start();
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
	}
	
	/**
	 * 运行此 main 方法可以启动项目
	 * 说明：
	 * 1. linux 下非root账户运行端口要>1024
	 * 2. idea 中运行记得加上当前的module名称
	 */
	public static void main(String[] args) {
		JFinal.start("WebContent", 89, "/", 5); // 
		// JFinal.start("JfinalUIB/WebContent", 89, "/", 5); // idea 中运行记得加上当前的module名称
	}
}
