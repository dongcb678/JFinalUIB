package little.ant.pingtai.run;

import little.ant.pingtai.beetl.HasPrivilegeUrl;
import little.ant.pingtai.beetl.MyBeetlRenderFactory;
import little.ant.pingtai.beetl.StringEquals;
import little.ant.pingtai.common.ParamInit;
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
import little.ant.pingtai.thread.ThreadSysLog;

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
import com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;

/**
 * API引导式配置
 */
public class JfinalConfig extends JFinalConfig {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(JfinalConfig.class);
			
	public static String driverClass;
	public static String jdbcUrl;
	public static String userName;
	public static String passWord;
	
	public static boolean devMode;
	
	public static String securityKey;
	
	public static int passErrorCount;
	public static int passErrorHour;
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		loadPropertyFile("init.properties");

		driverClass = getProperty("driverClass").trim();
		jdbcUrl = getProperty("jdbcUrl").trim();
		userName = getProperty("userName").trim();
		passWord = getProperty("passWord").trim();
		
		devMode = getPropertyToBoolean("devMode", false);
		
		securityKey = getProperty("securityKey").trim();
		
		passErrorCount = getPropertyToInt("passErrorCount", 3);
		passErrorHour = getPropertyToInt("passErrorHour", 3);
		
		me.setEncoding("UTF-8"); 
		me.setDevMode(devMode);
		me.setViewType(ViewType.JSP);//设置视图类型为Jsp，否则默认为FreeMarker
		
		//me.setMainRenderFactory(new MyJspRenderFactory());
		me.setMainRenderFactory(new MyBeetlRenderFactory());
		GroupTemplate groupTemplate = MyBeetlRenderFactory.groupTemplate;
		groupTemplate.registerFunction("hasPrivilegeUrl", new HasPrivilegeUrl());
		groupTemplate.registerFunction("stringEquals", new StringEquals());
		
		me.setError401View("/common/401.html");
		me.setError403View("/common/403.html");
		me.setError404View("/common/404.html");
		me.setError500View("/common/500.html");
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		me.add("/jf/", IndexController.class);
		me.add("/jf/index", IndexController.class);
		me.add("/jf/login", LoginController.class);
		me.add("/jf/dept", DepartmentController.class);
		me.add("/jf/dict", DictController.class);
		me.add("/jf/group", GroupController.class);
		me.add("/jf/menu", MenuController.class);
		me.add("/jf/module", ModuleController.class);
		me.add("/jf/operator", OperatorController.class);
		me.add("/jf/role", RoleController.class);
		me.add("/jf/station", StationController.class);
		me.add("/jf/sysLog", SysLogController.class);
		me.add("/jf/systems", SystemsController.class);
		me.add("/jf/user", UserController.class);
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		// 1.配置Druid数据库连接池插件
		DruidPlugin druidPlugin = new DruidPlugin(jdbcUrl, userName, passWord, driverClass);
		me.add(druidPlugin);

		// 2.缓存
		me.add(new EhCachePlugin());
		
		// 3.配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		arp.setDialect(new PostgreSqlDialect());// 数据库方言
		arp.addMapping("pt_department", "ids", Department.class);
		arp.addMapping("pt_dict", "ids", Dict.class);
		arp.addMapping("pt_group", "ids", Group.class);
		arp.addMapping("pt_menu", "ids", Menu.class);
		arp.addMapping("pt_module", "ids", Module.class);
		arp.addMapping("pt_operator", "ids", Operator.class);
		arp.addMapping("pt_role", "ids", Role.class);
		arp.addMapping("pt_station", "ids", Station.class);
		arp.addMapping("pt_syslog", "ids", Syslog.class);
		arp.addMapping("pt_systems", "ids", Systems.class);
		arp.addMapping("pt_user", "ids", User.class);
		arp.addMapping("pt_userinfo", "ids", UserInfo.class);
		me.add(arp);
	}
	
	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		//me.add(new SessionInViewInterceptor()); // 支持在使用session
		me.add(new AuthenticationInterceptor());
		me.add(new ParamPkgInterceptor());
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
		me.add(new GlobalHandler());
	}
	
	/**
	 * 系统启动完成后执行
	 */
	public void afterJFinalStart() {
		// 缓存参数
		new ParamInit().start();
		// 启动操作日志入库线程
		ThreadSysLog.startSaveDBThread();
	}
	
	/**
	 * 系统关闭前调用
	 */
	public void beforeJFinalStop() {
		
	}

	/**
	 * 建议使用 JFinal 手册推荐的方式启动项目
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebContent", 89, "/", 5);
	}
}
