package little.ant.pingtai.run;

import java.util.HashMap;
import java.util.Map;

import little.ant.pingtai.beetl.EscapeXml;
import little.ant.pingtai.beetl.HasPrivilegeUrl;
import little.ant.pingtai.beetl.MyBeetlRenderFactory;
import little.ant.pingtai.beetl.OrderBy;
import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.controller.DepartmentController;
import little.ant.pingtai.controller.DictController;
import little.ant.pingtai.controller.GroupController;
import little.ant.pingtai.controller.IndexController;
import little.ant.pingtai.controller.LoginController;
import little.ant.pingtai.controller.MenuController;
import little.ant.pingtai.controller.ModuleController;
import little.ant.pingtai.controller.OperatorController;
import little.ant.pingtai.controller.RoleController;
import little.ant.pingtai.controller.StationController;
import little.ant.pingtai.controller.SysLogController;
import little.ant.pingtai.controller.SystemsController;
import little.ant.pingtai.controller.UserController;
import little.ant.pingtai.handler.GlobalHandler;
import little.ant.pingtai.interceptor.AuthenticationInterceptor;
import little.ant.pingtai.interceptor.ParamPkgInterceptor;
import little.ant.pingtai.model.Department;
import little.ant.pingtai.model.Dict;
import little.ant.pingtai.model.Group;
import little.ant.pingtai.model.Menu;
import little.ant.pingtai.model.Module;
import little.ant.pingtai.model.Operator;
import little.ant.pingtai.model.Role;
import little.ant.pingtai.model.Station;
import little.ant.pingtai.model.Syslog;
import little.ant.pingtai.model.Systems;
import little.ant.pingtai.model.User;
import little.ant.pingtai.model.UserInfo;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.thread.ThreadSysLog;
import little.ant.pingtai.thread.TimerSystemInfo;
import little.ant.pingtai.tools.ToolString;
import little.ant.weixin.controller.KeywordController;
import little.ant.weixin.controller.LocationController;
import little.ant.weixin.controller.MessageController;
import little.ant.weixin.lucene.DocKeyword;
import little.ant.weixin.model.Article;
import little.ant.weixin.model.Keyword;
import little.ant.weixin.model.Location;
import little.ant.weixin.model.Message;

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

	@SuppressWarnings("unused")
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
		// 系统路由
		me.add("/jf/", IndexController.class); // 系统管理主页
		me.add("/jf/index", IndexController.class); // 系统管理主页
		me.add("/jf/login", LoginController.class); // 登陆管理
		me.add("/jf/dept", DepartmentController.class); // 部门管理
		me.add("/jf/dict", DictController.class); // 字典管理
		me.add("/jf/group", GroupController.class); // 分组管理
		me.add("/jf/menu", MenuController.class); // 菜单管理
		me.add("/jf/module", ModuleController.class); // 模块管理
		me.add("/jf/operator", OperatorController.class); // 功能管理
		me.add("/jf/role", RoleController.class); // 角色管理
		me.add("/jf/station", StationController.class); // 岗位管理
		me.add("/jf/sysLog", SysLogController.class); // 日志管理
		me.add("/jf/systems", SystemsController.class); // 系统管理
		me.add("/jf/user", UserController.class); // 用户管理
		
		// 微信路由
		me.add("/jf/wx/index", little.ant.weixin.controller.IndexController.class); // 微信管理首页
		me.add("/jf/wx/message", MessageController.class); // 接收消息处理和管理
		me.add("/jf/wx/user", little.ant.weixin.controller.UserController.class); // 微信用户管理
		me.add("/jf/wx/group", little.ant.weixin.controller.GroupController.class); // 微信用户分组管理
		me.add("/jf/wx/location", LocationController.class); // 微信用户位置
		me.add("/jf/wx/keyword", KeywordController.class); // 自动回复关键字维护
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		ActiveRecordPlugin arp = null;
		// 1.数据库类型判断
		String db_type = (String) getParamMapValue(DictKeys.db_type_key);
		if(db_type.equals(DictKeys.db_type_postgresql)){ // pg
			// 1.1 配置Druid数据库连接池插件
			String postgresql_driverClass = getProperty("postgresql.driverClass").trim();
			String postgresql_jdbcUrl = getProperty("postgresql.jdbcUrl").trim();
			String postgresql_userName = getProperty("postgresql.userName").trim();
			String postgresql_passWord = getProperty("postgresql.passWord").trim();
			DruidPlugin druidPlugin = new DruidPlugin(postgresql_jdbcUrl, postgresql_userName, postgresql_passWord, postgresql_driverClass);
			me.add(druidPlugin);

			// 1.2 配置ActiveRecord插件
			arp = new ActiveRecordPlugin(druidPlugin);
			arp.setDialect(new PostgreSqlDialect()); // 数据库方言
			
		}else if(db_type.equals(DictKeys.db_type_mysql)){ // mysql
			// 1.1 配置Druid数据库连接池插件
			String mysql_jdbcUrl = getProperty("mysql.jdbcUrl").trim();
			String mysql_userName = getProperty("mysql.userName").trim();
			String mysql_passWord = getProperty("mysql.passWord").trim();
			DruidPlugin druidPlugin = new DruidPlugin(mysql_jdbcUrl, mysql_userName, mysql_passWord);
			me.add(druidPlugin);

			// 1.2 配置ActiveRecord插件
			arp = new ActiveRecordPlugin(druidPlugin);
			arp.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 小写
			arp.setDialect(new MysqlDialect()); // 数据库方言
		}

		// 2. 缓存
		me.add(new EhCachePlugin()); // EhCache缓存
		
		// 3.1 系统表
		arp.addMapping("pt_department", "ids", Department.class); // 部门表
		arp.addMapping("pt_dict", "ids", Dict.class); // 字典表
		arp.addMapping("pt_group", "ids", Group.class); // 用户分组表
		arp.addMapping("pt_menu", "ids", Menu.class); // 菜单表
		arp.addMapping("pt_module", "ids", Module.class); // 模块表
		arp.addMapping("pt_operator", "ids", Operator.class); // 功能表
		arp.addMapping("pt_role", "ids", Role.class); // 角色表
		arp.addMapping("pt_station", "ids", Station.class); // 岗位表
		arp.addMapping("pt_syslog", "ids", Syslog.class); // 系统日志表
		arp.addMapping("pt_systems", "ids", Systems.class); // 系统表
		arp.addMapping("pt_user", "ids", User.class); // 用户表
		arp.addMapping("pt_userinfo", "ids", UserInfo.class); // 用户明细表
		
		// 3.2 微信表
		arp.addMapping("wx_message", "ids", Message.class); // 消息表
		arp.addMapping("wx_article", "ids", Article.class); // 消息图文表
		arp.addMapping("wx_user", "ids", little.ant.weixin.model.User.class); // 用户表
		arp.addMapping("wx_group", "ids", little.ant.weixin.model.Group.class); // 用户分组表
		arp.addMapping("wx_location", "ids", Location.class); // 用户地理位置表
		arp.addMapping("wx_keyword", "ids", Keyword.class); // 自动回复配置
		me.add(arp);
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
		
		TimerSystemInfo.start(); // 系统负载
	}
	
	/**
	 * 系统关闭前调用
	 */
	public void beforeJFinalStop() {
		new DocKeyword().close();// 释放lucene索引资源
		
		ThreadSysLog.setThreadRun(false);// 释放日志入库线程
		
		TimerSystemInfo.stop(); // 系统负载
	}
	
	/**
	 * 建议使用 JFinal 手册推荐的方式启动项目
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebContent", 89, "/", 5);
	}
}
