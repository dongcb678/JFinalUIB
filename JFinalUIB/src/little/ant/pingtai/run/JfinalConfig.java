package little.ant.pingtai.run;

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
import com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;

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
		me.setDevMode(getPropertyToBoolean("config.devMode", false));
		//me.setViewType(ViewType.JSP);//设置视图类型为Jsp，否则默认为FreeMarker

		log.info("configConstant 视图Beetl设置");
		me.setMainRenderFactory(new MyBeetlRenderFactory());
		GroupTemplate groupTemplate = MyBeetlRenderFactory.groupTemplate;
		groupTemplate.registerFunction("hasPrivilegeUrl", new HasPrivilegeUrl());
		groupTemplate.registerFunction("orderBy", new OrderBy());
		groupTemplate.registerFunction("escapeXml", new EscapeXml());
		groupTemplate.registerTag("dict", DictTag.class);
		groupTemplate.registerTag("param", ParamTag.class);
		
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
		log.info("configRoute 表扫描注册开始");
		new ControllerPlugin(me).start();
		log.info("configRoute 表扫描注册结束");
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		log.info("configPlugin 配置Druid数据库连接池插件");
		DruidPlugin druidPlugin = new DruidPlugin(
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_jdbcUrl), 
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_userName), 
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_passWord), 
				(String)PropertiesPlugin.getParamMapValue(DictKeys.db_connection_driverClass));
		druidPlugin.set(
				(int)PropertiesPlugin.getParamMapValue(DictKeys.db_initialSize), 
				(int)PropertiesPlugin.getParamMapValue(DictKeys.db_minIdle), 
				(int)PropertiesPlugin.getParamMapValue(DictKeys.db_maxActive));
		me.add(druidPlugin);
		
		log.info("configPlugin 配置ActiveRecord插件");
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		//arp.setTransactionLevel(4);//事务隔离级别
		arp.setDevMode(getPropertyToBoolean("config.devMode", false)); // 设置开发模式
		arp.setShowSql(getPropertyToBoolean("config.devMode", false)); // 是否显示SQL
		
		log.info("configPlugin 数据库类型判断");
		String db_type = (String) PropertiesPlugin.getParamMapValue(DictKeys.db_type_key);
		if(db_type.equals(DictKeys.db_type_postgresql)){
			log.info("configPlugin 使用数据库类型是 postgresql");
			arp.setDialect(new PostgreSqlDialect());
			
		}else if(db_type.equals(DictKeys.db_type_mysql)){
			log.info("configPlugin 使用数据库类型是 mysql");
			arp.setDialect(new MysqlDialect());
			arp.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 小写
		}
		
		log.info("configPlugin 表扫描注册");
		new TablePlugin(arp).start();
		me.add(arp);

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

		log.info("afterJFinalStart 创建自动回复lucene索引");
		new DocKeyword().run(); 

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
	 * 建议使用 JFinal 手册推荐的方式启动项目
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebContent", 89, "/", 5);
	}
}
