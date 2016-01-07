package com.platform.config.run;

import org.apache.log4j.Logger;
import org.beetl.ext.jfinal.BeetlRenderFactory;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.i18n.I18nInterceptor;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.tx.TxByActionKeyRegex;
import com.jfinal.plugin.activerecord.tx.TxByActionKeys;
import com.jfinal.plugin.activerecord.tx.TxByMethodRegex;
import com.jfinal.plugin.activerecord.tx.TxByMethods;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.plugin.redis.RedisPlugin;
import com.platform.config.mapping.PlatformMapping;
import com.platform.config.routes.PlatformRoutes;
import com.platform.config.routes.TestRoutes;
import com.platform.config.routes.WeiXinRoutes;
import com.platform.constant.ConstantCache;
import com.platform.constant.ConstantInit;
import com.platform.handler.GlobalHandler;
import com.platform.interceptor.AuthInterceptor;
import com.platform.interceptor.ParamPkgInterceptor;
import com.platform.plugin.ControllerPlugin;
import com.platform.plugin.FileRenamePlugin;
import com.platform.plugin.I18NPlugin;
import com.platform.plugin.ParamInitPlugin;
import com.platform.plugin.SqlXmlPlugin;
import com.platform.thread.DataClear;
import com.platform.thread.ThreadSysLog;
import com.platform.thread.TimerResources;
import com.platform.tools.ToolBeetl;
import com.platform.tools.ToolCache;
import com.platform.tools.ToolString;
import com.weixin.lucene.DocKeyword;

/**
 * Jfinal API 引导式配置，系统的核心配置，负责生产、加载所有核心组件
 */
public class JfinalConfig extends JFinalConfig {
	
	private static Logger log = Logger.getLogger(JfinalConfig.class);
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants constants) {
		log.info("configConstant 缓存 properties");
    	PropKit.use("init.properties");

		log.info("configConstant 设置字符集");
		constants.setEncoding(ToolString.encoding); 

		log.info("configConstant 设置是否开发模式");
		constants.setDevMode(PropKit.getBoolean(ConstantInit.config_devMode, false));

		log.info("configConstant 设置json工厂类");
		//constants.setJsonFactory(new FastJsonFactory()); // new JacksonFactory()

		log.info("configConstant 设置path相关");
		//constants.setBaseUploadPath(PathKit.getWebRootPath() + "/WEB-INF/files/upload"); // 上传公共路径
		//constants.setBaseDownloadPath(PathKit.getWebRootPath() + "/WEB-INF/files/upload"); // 下载公共路径
		//constants.setBaseViewPath("/jf"); //设置路由公共路径
		
		log.info("configConstant 视图Beetl设置");
		constants.setMainRenderFactory(new BeetlRenderFactory());
		ToolBeetl.regiseter();
		
		log.info("configConstant 视图error page设置");
		constants.setError404View("/common/404.html");
		constants.setError500View("/common/500.html");

		log.info("configConstant i18n文件前缀设置设置");
		constants.setI18nDefaultBaseName(PropKit.get(ConstantInit.config_i18n_filePrefix));
		//constants.setI18nDefaultLocale("zh_CN");
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
		
		if(ToolCache.getCacheType().equals(ConstantCache.cache_type_ehcache)){
			log.info("EhCachePlugin EhCache缓存");
			plugins.add(new EhCachePlugin());
			
		}else if(ToolCache.getCacheType().equals(ConstantCache.cache_type_redis)){
			log.info("RedisPlugin Redis缓存");
			String redisIp = PropKit.get(ConstantInit.config_redis_ip);
			Integer redisPort = PropKit.getInt(ConstantInit.config_redis_port);
			RedisPlugin systemRedis = new RedisPlugin(ConstantCache.cache_name_redis_system, redisIp, redisPort);
			plugins.add(systemRedis);
		}
		
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
		interceptors.add(new TxByMethodRegex("(.*save.*|.*update.*|.*delete.*)")); // 2.1只支持单实例添加，多方法名匹配使用一个正则匹配
		interceptors.add(new TxByActionKeys("/jf/wx/message", "/jf/wx/message/index"));
		interceptors.add(new TxByActionKeyRegex("/jf/wx/message.*"));

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

		boolean luceneIndex = PropKit.getBoolean(ConstantInit.config_luceneIndex, false);
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
		//JFinal.start("D:\\DevelopmentTool\\IntelliJIDEA14.1.4\\IdeaProjects\\JFinalUIBV2\\JFinalUIBV2\\WebContent", 99, "/", 5);
	}
}
