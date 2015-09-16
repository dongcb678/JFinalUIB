package com.platform.run;

import org.apache.log4j.Logger;
import org.beetl.core.GroupTemplate;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.i18n.I18nInterceptor;
import com.jfinal.plugin.activerecord.tx.TxByActionKeys;
import com.jfinal.plugin.activerecord.tx.TxByMethods;
import com.jfinal.plugin.activerecord.tx.TxByRegex;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.platform.beetl.format.DateFormat;
import com.platform.beetl.func.AuthUrl;
import com.platform.beetl.func.EscapeXml;
import com.platform.beetl.func.I18nFormat;
import com.platform.beetl.func.OrderBy;
import com.platform.beetl.render.MyBeetlRenderFactory;
import com.platform.beetl.tag.DictTag;
import com.platform.beetl.tag.ParamTag;
import com.platform.constant.ConstantInit;
import com.platform.handler.GlobalHandler;
import com.platform.interceptor.AuthInterceptor;
import com.platform.interceptor.ParamPkgInterceptor;
import com.platform.plugin.ControllerPlugin;
import com.platform.plugin.FileRenamePlugin;
import com.platform.plugin.I18NPlugin;
import com.platform.plugin.ParamInitPlugin;
import com.platform.plugin.PropertiesPlugin;
import com.platform.plugin.SqlXmlPlugin;
import com.platform.thread.DataClear;
import com.platform.thread.ThreadSysLog;
import com.platform.thread.TimerResources;
import com.platform.tools.ToolString;
import com.weixin.lucene.DocKeyword;

/**
 * Jfinal API 引导式配置
 */
public class JfinalConfig extends JFinalConfig {
	
	private static Logger log = Logger.getLogger(JfinalConfig.class);
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants constants) {
		log.info("configConstant 缓存 properties");
		new PropertiesPlugin(loadPropertyFile("init.properties")).start();

		log.info("configConstant 设置字符集");
		constants.setEncoding(ToolString.encoding); 

		log.info("configConstant 设置是否开发模式");
		constants.setDevMode(getPropertyToBoolean(ConstantInit.config_devMode, false));

		log.info("configConstant 视图Beetl设置");
		constants.setMainRenderFactory(new MyBeetlRenderFactory());
		GroupTemplate groupTemplate = MyBeetlRenderFactory.groupTemplate;
		groupTemplate.registerFunction("authUrl", new AuthUrl());
		groupTemplate.registerFunction("orderBy", new OrderBy());
		groupTemplate.registerFunction("escapeXml", new EscapeXml());
		groupTemplate.registerFunction("i18nFormat", new I18nFormat());
		groupTemplate.registerTag("dict", DictTag.class);
		groupTemplate.registerTag("param", ParamTag.class);
		groupTemplate.registerFormat("dateFormat", new DateFormat());
		
		log.info("configConstant 视图error page设置");
		constants.setError404View("/common/404.html");
		constants.setError500View("/common/500.html");

		log.info("configConstant i18n文件前缀设置设置");
		constants.setI18nDefaultBaseName("message");
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes routes) { 
		log.info("configRoute 注解注册路由");
		new ControllerPlugin(routes).start(); // 注解路由扫描
		
		log.info("configRoute 手动注册路由");
		routes.add(new PlatformRoutes());
		routes.add(new WeiXinRoutes());
		routes.add(new TestRoutes());
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins plugins) {
		log.info("注册paltform ActiveRecordPlugin");
		new PlatformMapping(plugins);
		
		log.info("I18NPlugin 国际化键值对加载");
		plugins.add(new I18NPlugin());
		
		log.info("EhCachePlugin EhCache缓存");
		plugins.add(new EhCachePlugin());

		log.info("SqlXmlPlugin 解析并缓存 xml sql");
		plugins.add(new SqlXmlPlugin());
		
		log.info("afterJFinalStart 缓存参数");
		plugins.add(new ParamInitPlugin());
		
		log.info("afterJFinalStart 配置文件上传命名策略插件");
		plugins.add(new FileRenamePlugin());
	}

	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors interceptors) {
		//log.info("configInterceptor 支持使用session");
		//me.add(new SessionInViewInterceptor());
		
		log.info("configInterceptor 权限认证拦截器");
		interceptors.add(new AuthInterceptor());
		
		log.info("configInterceptor 参数封装拦截器");
		interceptors.add(new ParamPkgInterceptor());
		
		log.info("configInterceptor 配置开启事物规则");
		interceptors.add(new TxByMethods("save", "update", "delete"));
		interceptors.add(new TxByRegex(".*save.*"));
		interceptors.add(new TxByRegex(".*update.*"));
		interceptors.add(new TxByRegex(".*delete.*"));
		interceptors.add(new TxByActionKeys("/jf/wx/message", "/jf/wx/message/index"));

		log.info("configInterceptor i18n拦截器");
		interceptors.add(new I18nInterceptor());
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers handlers) {
		log.info("configHandler 全局配置处理器，主要是记录日志和request域值处理");
		handlers.add(new GlobalHandler());
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
	 * 2. idea 中运行webAppDir路径可能需要适当调整，可以设置为WebContent的绝对路径
	 */
	public static void main(String[] args) {
		JFinal.start("WebContent", 99, "/", 5);
		//JFinal.start("D:\\DevelopmentTool\\IntelliJIDEA14.1.4" +
		//		"\\IdeaProjects\\JFinalUIBV2\\JFinalUIBV2\\WebContent", 99, "/", 5);
	}
}
