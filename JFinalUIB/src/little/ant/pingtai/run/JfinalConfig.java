package little.ant.pingtai.run;

import java.util.HashMap;
import java.util.Map;

import little.ant.pingtai.beetl.EscapeXml;
import little.ant.pingtai.beetl.HasPrivilegeUrl;
import little.ant.pingtai.beetl.MyBeetlRenderFactory;
import little.ant.pingtai.beetl.OrderBy;
import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.handler.GlobalHandler;
import little.ant.pingtai.interceptor.AuthenticationInterceptor;
import little.ant.pingtai.interceptor.ParamPkgInterceptor;
import little.ant.pingtai.plugin.RouterPlugin;
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
	 * 保存系统配置参数值
	 */
	private static Map<String, Object> paramMap = new HashMap<String, Object>();
	
	/**
	 * 获取系统配置参数值
	 * @param key
	 * @return
	 */
	public static Object getParamMapValue(String key){
		return paramMap.get(key);
	}
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		loadPropertyFile("init.properties");

		paramMap.put(DictKeys.db_type_key, getProperty(DictKeys.db_type_key).trim());
		
		String jdbcUrl = null;
		String database = null;
		
		// 判断数据库类型
		String db_type = (String) getParamMapValue(DictKeys.db_type_key);
		if(db_type.equals(DictKeys.db_type_postgresql)){ // pg 数据库连接信息
			// 读取当前配置数据库连接信息
			paramMap.put(DictKeys.db_connection_driverClass, getProperty("postgresql.driverClass").trim());
			paramMap.put(DictKeys.db_connection_jdbcUrl, getProperty("postgresql.jdbcUrl").trim());
			paramMap.put(DictKeys.db_connection_userName, getProperty("postgresql.userName").trim());
			paramMap.put(DictKeys.db_connection_passWord, getProperty("postgresql.passWord").trim());
			
			// 解析数据库连接URL，获取数据库名称
			jdbcUrl = (String) getParamMapValue(DictKeys.db_connection_jdbcUrl);
			database = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			database = database.substring(database.indexOf("/") + 1);
			
		}else if(db_type.equals(DictKeys.db_type_mysql)){ // mysql 数据库连接信息
			// 读取当前配置数据库连接信息
			paramMap.put(DictKeys.db_connection_driverClass, "com.mysql.jdbc.Driver");
			paramMap.put(DictKeys.db_connection_jdbcUrl, getProperty("mysql.jdbcUrl").trim());
			paramMap.put(DictKeys.db_connection_userName, getProperty("mysql.userName").trim());
			paramMap.put(DictKeys.db_connection_passWord, getProperty("mysql.passWord").trim());

			// 解析数据库连接URL，获取数据库名称
			jdbcUrl = (String) getParamMapValue(DictKeys.db_connection_jdbcUrl);
			database = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			database = database.substring(database.indexOf("/") + 1, database.indexOf("?"));
		}
		
		// 解析数据库连接URL，获取数据库地址IP
		String ip = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
		ip = ip.substring(0, ip.indexOf(":"));

		// 解析数据库连接URL，获取数据库地址端口
		String port = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
		port = port.substring(port.indexOf(":") + 1, port.indexOf("/"));
		
		// 把数据库连接信息写入常用map
		paramMap.put(DictKeys.db_connection_ip, ip);
		paramMap.put(DictKeys.db_connection_port, port);
		paramMap.put(DictKeys.db_connection_dbName, database);
		
		// 把常用配置信息写入map
		paramMap.put(DictKeys.config_securityKey_key, getProperty(DictKeys.config_securityKey_key).trim());
		paramMap.put(DictKeys.config_passErrorCount_key, getPropertyToInt(DictKeys.config_passErrorCount_key, 3));
		paramMap.put(DictKeys.config_passErrorHour_key, getPropertyToInt(DictKeys.config_passErrorHour_key, 3));
		
		me.setEncoding(ToolString.encoding); 
		me.setDevMode(getPropertyToBoolean("config.devMode", false));
		//me.setViewType(ViewType.JSP);//设置视图类型为Jsp，否则默认为FreeMarker
		
		me.setMainRenderFactory(new MyBeetlRenderFactory());
		GroupTemplate groupTemplate = MyBeetlRenderFactory.groupTemplate;
		groupTemplate.registerFunction("hasPrivilegeUrl", new HasPrivilegeUrl());
		groupTemplate.registerFunction("orderBy", new OrderBy());
		groupTemplate.registerFunction("escapeXml", new EscapeXml());
		
		me.setError401View("/common/401.html");
		me.setError403View("/common/403.html");
		me.setError404View("/common/404.html");
		me.setError500View("/common/500.html");
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) { 
		log.debug("configRoute表扫描注册开始");
		new RouterPlugin(me).start();
		log.debug("configRoute表扫描注册结束");
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		// 1. 配置Druid数据库连接池插件
		DruidPlugin druidPlugin = new DruidPlugin(
				(String)getParamMapValue(DictKeys.db_connection_jdbcUrl), (String)getParamMapValue(DictKeys.db_connection_userName), 
				(String)getParamMapValue(DictKeys.db_connection_passWord), (String)getParamMapValue(DictKeys.db_connection_driverClass));
		me.add(druidPlugin);

		// 2. 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		
		// 2.1. 数据库类型判断
		String db_type = (String) getParamMapValue(DictKeys.db_type_key);
		if(db_type.equals(DictKeys.db_type_postgresql)){ // pg
			arp.setDialect(new PostgreSqlDialect()); // 数据库方言
			
		}else if(db_type.equals(DictKeys.db_type_mysql)){ // mysql
			arp.setDialect(new MysqlDialect()); // 数据库方言
			arp.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 小写
		}
		
		// 2.2. 注册数据集插件
		log.debug("configPlugin表扫描注册");
		new TablePlugin(arp).start();
		log.debug("configPlugin表扫描注册");
		me.add(arp);
		
		// 4. 缓存
		me.add(new EhCachePlugin()); // EhCache缓存
	}

	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		//me.add(new SessionInViewInterceptor()); // 支持在使用session
		me.add(new AuthenticationInterceptor()); // 权限认证拦截器
		me.add(new ParamPkgInterceptor()); // 参数封装拦截器
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
		me.add(new GlobalHandler()); // 全局配置处理器，主要是记录日志
	}
	
	/**
	 * 系统启动完成后执行
	 */
	public void afterJFinalStart() {
		new ThreadParamInit().start(); // 缓存参数
		
		ThreadSysLog.startSaveDBThread(); // 启动操作日志入库线程
		
		new DocKeyword().run(); // 创建自动回复lucene索引
		
		TimerResources.start(); // 系统负载
	}
	
	/**
	 * 系统关闭前调用
	 */
	public void beforeJFinalStop() {
		new DocKeyword().close();// 释放lucene索引资源
		
		ThreadSysLog.setThreadRun(false);// 释放日志入库线程
		
		TimerResources.stop(); // 系统负载
	}
	
	/**
	 * 建议使用 JFinal 手册推荐的方式启动项目
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebContent", 89, "/", 5);
	}
}
