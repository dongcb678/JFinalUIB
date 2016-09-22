package com.platform.run;

import org.apache.log4j.Logger;
import org.beetl.ext.jfinal.BeetlRenderFactory;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallConfig;
import com.alibaba.druid.wall.WallFilter;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.i18n.I18nInterceptor;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect;
import com.jfinal.plugin.activerecord.dialect.SqlServerDialect;
import com.jfinal.plugin.activerecord.tx.TxByActionKeyRegex;
import com.jfinal.plugin.activerecord.tx.TxByActionKeys;
import com.jfinal.plugin.activerecord.tx.TxByMethodRegex;
import com.jfinal.plugin.activerecord.tx.TxByMethods;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.druid.DruidStatViewHandler;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.plugin.redis.RedisPlugin;
import com.platform.constant.ConstantCache;
import com.platform.constant.ConstantInit;
import com.platform.dto.DataBase;
import com.platform.handler.GlobalHandler;
import com.platform.interceptor.AuthInterceptor;
import com.platform.interceptor.ParamPkgInterceptor;
import com.platform.plugin.ControllerPlugin;
import com.platform.plugin.FileRenamePlugin;
import com.platform.plugin.I18NPlugin;
import com.platform.plugin.ParamInitPlugin;
import com.platform.plugin.ServicePlugin;
import com.platform.plugin.SqlXmlPlugin;
import com.platform.plugin.TableScan;
import com.platform.thread.DataClear;
import com.platform.thread.ThreadSysLog;
import com.platform.thread.TimerResources;
import com.platform.tools.ToolBeetl;
import com.platform.tools.ToolCache;
import com.platform.tools.ToolDataBase;
import com.platform.tools.ToolString;

/**
 * JFinal API 引导式配置，系统的核心配置，负责生产、加载所有核心组件
 */
public class JFinalConfig extends com.jfinal.config.JFinalConfig {
	
	private static Logger log = Logger.getLogger(JFinalConfig.class);
	
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

		//log.info("configConstant 设置json工厂类");
		//constants.setJsonFactory(JFinalJsonFactory.me()); // 默认无需设置
		//constants.setJsonFactory(FastJsonFactory.me()); // FastJson
		//constants.setJsonFactory(JacksonFactory.me()); // Jackson

		log.info("configConstant 设置path相关");
		constants.setBaseUploadPath(PathKit.getWebRootPath()); // 上传公共路径 + File.separator + "files"
		constants.setBaseDownloadPath(PathKit.getWebRootPath()); // 下载公共路径 + File.separator + "files"
		//constants.setBaseViewPath("/jf"); //设置路由公共路径
		
		log.info("configConstant 视图Beetl设置");
		constants.setMainRenderFactory(new BeetlRenderFactory());
		ToolBeetl.regiseter();
		
		log.info("configConstant 视图error page设置");
		constants.setError404View("/platform/common/404.html");
		constants.setError500View("/platform/common/500.html");

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
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins plugins) {
		log.info("注册paltform ActiveRecordPlugin");
		log.info("configPlugin 配置Druid数据库连接池连接属性");
		DataBase db = ToolDataBase.getDbInfo();
		String driverClass = db.getDriverClass();
		String jdbcUrl = db.getJdbcUrl();
		String username = db.getUserName();
		String password = db.getPassWord();
		DruidPlugin druidPlugin = new DruidPlugin(jdbcUrl, username, password, driverClass);

		log.info("configPlugin 配置Druid数据库连接池大小");
		druidPlugin.set(
				PropKit.getInt(ConstantInit.db_initialSize), 
				PropKit.getInt(ConstantInit.db_minIdle), 
				PropKit.getInt(ConstantInit.db_maxActive));
		
		log.info("configPlugin 配置Druid数据库连接池过滤器配制");
		druidPlugin.addFilter(new StatFilter());
		WallFilter wall = new WallFilter();
		wall.setDbType(PropKit.get(ConstantInit.db_type_key));
		WallConfig config = new WallConfig();
		config.setFunctionCheck(false); // 支持数据库函数
		wall.setConfig(config);
		druidPlugin.addFilter(wall);
		
		log.info("configPlugin 配置ActiveRecordPlugin插件");
		ActiveRecordPlugin arpMain = new ActiveRecordPlugin(ConstantInit.db_dataSource_main, druidPlugin);
		//arpMain.setTransactionLevel(4);//事务隔离级别
		boolean devMode = Boolean.parseBoolean(PropKit.get(ConstantInit.config_devMode));
		arpMain.setDevMode(devMode); // 设置开发模式
		arpMain.setShowSql(devMode); // 是否显示SQL
		arpMain.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 大小写不敏感
		
		log.info("configPlugin 数据库类型判断");
		String db_type = PropKit.get(ConstantInit.db_type_key);
		if(db_type.equals(ConstantInit.db_type_postgresql)){
			log.info("configPlugin 使用数据库类型是 postgresql");
			arpMain.setDialect(new PostgreSqlDialect());
			
		}else if(db_type.equals(ConstantInit.db_type_mysql)){
			log.info("configPlugin 使用数据库类型是 mysql");
			arpMain.setDialect(new MysqlDialect());
			
		}else if(db_type.equals(ConstantInit.db_type_oracle)){
			log.info("configPlugin 使用数据库类型是 oracle");
			druidPlugin.setValidationQuery("select 1 FROM DUAL"); //连接验证语句
			arpMain.setDialect(new OracleDialect());
			
		}else if(db_type.equals(ConstantInit.db_type_sqlserver)){
			log.info("configPlugin 使用数据库类型是 sqlserver");
			arpMain.setDialect(new SqlServerDialect());
			
		}else if(db_type.equals(ConstantInit.db_type_db2)){
			log.info("configPlugin 使用数据库类型是 db2");
			druidPlugin.setValidationQuery("select 1 from sysibm.sysdummy1"); //连接验证语句
			arpMain.setDialect(new AnsiSqlDialect());
		}

		log.info("configPlugin 添加druidPlugin插件");
		plugins.add(druidPlugin); // 多数据源继续添加

		log.info("configPlugin 表自动扫描注册");
		new TableScan(ConstantInit.db_dataSource_main, arpMain).start();

		log.info("configPlugin 注册ActiveRecordPlugin插件");
		plugins.add(arpMain);

		log.info("ServicePlugin Service注解实例化加载");
		plugins.add(new ServicePlugin());
		
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
		//me.add(new SessionInViewInterceptor(true));
		
		log.info("configInterceptor 权限认证拦截器");
		interceptors.add(new AuthInterceptor());
		
		log.info("configInterceptor 参数封装拦截器");
		interceptors.add(new ParamPkgInterceptor());
		
		log.info("configInterceptor 配置开启事物规则");
		interceptors.add(new TxByMethods("save", "update", "delete"));
		interceptors.add(new TxByMethodRegex("(.*save.*|.*update.*|.*delete.*)")); // 2.1只支持单实例添加，多方法名匹配使用一个正则匹配
		interceptors.add(new TxByActionKeys("/wx/message", "/wx/message/index"));
		interceptors.add(new TxByActionKeyRegex("/wx/message.*"));

		log.info("configInterceptor i18n拦截器");
		interceptors.add(new I18nInterceptor());
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers handlers) {
		log.info("configHandler 全局配置处理器，主要是druid监控页面展示");
		handlers.add(new DruidStatViewHandler("/platform/druid"));
		
		log.info("configHandler 全局配置处理器，主要是记录日志和request域值处理");
		handlers.add(new GlobalHandler());
	}
	
	/**
	 * 系统启动完成后执行
	 */
	public void afterJFinalStart() {
		log.info("afterJFinalStart 启动操作日志入库线程");
		ThreadSysLog.startSaveDBThread();

		log.info("afterJFinalStart 系统负载");
		TimerResources.start();
		
		log.info("afterJFinalStart 数据清理");
		DataClear.start();
	}
	
	/**
	 * 系统关闭前调用
	 */
	public void beforeJFinalStop() {
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
		JFinal.start("WebContent", 8899, "/", 5);
		//JFinal.start("D:\\DevelopmentTool\\IntelliJIDEA14.1.4\\IdeaProjects\\JFinalUIBV2\\JFinalUIBV2\\WebContent", 99, "/", 5);
	}
}
