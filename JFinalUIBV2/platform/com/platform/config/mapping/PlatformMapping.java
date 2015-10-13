package com.platform.config.mapping;

import org.apache.log4j.Logger;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallConfig;
import com.alibaba.druid.wall.WallFilter;
import com.jfinal.config.Plugins;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.platform.constant.ConstantInit;
import com.platform.mvc.dept.Department;
import com.platform.mvc.dict.Dict;
import com.platform.mvc.group.Group;
import com.platform.mvc.menu.Menu;
import com.platform.mvc.module.Module;
import com.platform.mvc.operator.Operator;
import com.platform.mvc.param.Param;
import com.platform.mvc.resources.Resources;
import com.platform.mvc.role.Role;
import com.platform.mvc.station.Station;
import com.platform.mvc.syslog.Syslog;
import com.platform.mvc.systems.Systems;
import com.platform.mvc.upload.Upload;
import com.platform.mvc.user.User;
import com.platform.mvc.user.UserInfo;
import com.platform.plugin.PropertiesPlugin;
import com.test.mvc.blog.Blog;
import com.weixin.mvc.article.Article;
import com.weixin.mvc.keyword.Keyword;
import com.weixin.mvc.location.Location;
import com.weixin.mvc.message.Message;

public class PlatformMapping extends BaseMapping{

	private static Logger log = Logger.getLogger(PlatformMapping.class);
	
	public PlatformMapping(Plugins plugins){
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
		
		log.info("configPlugin 配置ActiveRecordPlugin插件");
		configName = ConstantInit.db_dataSource_main;
		arp = new ActiveRecordPlugin(configName, druidPlugin);
		//arp.setTransactionLevel(4);//事务隔离级别
		boolean devMode = Boolean.parseBoolean((String) PropertiesPlugin.getParamMapValue(ConstantInit.config_devMode));
		arp.setDevMode(devMode); // 设置开发模式
		arp.setShowSql(devMode); // 是否显示SQL
		arp.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 大小写不敏感
		
		log.info("configPlugin 数据库类型判断");
		String db_type = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_type_key);
		if(db_type.equals(ConstantInit.db_type_postgresql)){
			log.info("configPlugin 使用数据库类型是 postgresql");
			arp.setDialect(new PostgreSqlDialect());
			
		}else if(db_type.equals(ConstantInit.db_type_mysql)){
			log.info("configPlugin 使用数据库类型是 mysql");
			arp.setDialect(new MysqlDialect());
			
		}else if(db_type.equals(ConstantInit.db_type_oracle)){
			log.info("configPlugin 使用数据库类型是 oracle");
			druidPlugin.setValidationQuery("select 1 FROM DUAL"); //连接验证语句
			arp.setDialect(new OracleDialect());
		}

		log.info("configPlugin 添加druidPlugin插件");
		plugins.add(druidPlugin); // 多数据源继续添加

		log.info("configPlugin 表自动扫描注册");
		scan();

		log.info("configPlugin 表手工注册");
		arp.addMapping("pt_department", "ids", Department.class);
		arp.addMapping("pt_dict", "ids", Dict.class);
		arp.addMapping("pt_group", "ids", Group.class);
		arp.addMapping("pt_menu", "ids", Menu.class);
		arp.addMapping("pt_module", "ids", Module.class);
		arp.addMapping("pt_operator", "ids", Operator.class);
		arp.addMapping("pt_param", "ids", Param.class);
		arp.addMapping("pt_resources", "ids", Resources.class);
		arp.addMapping("pt_role", "ids", Role.class);
		arp.addMapping("pt_station", "ids", Station.class);
		arp.addMapping("pt_syslog", "ids", Syslog.class);
		arp.addMapping("pt_systems", "ids", Systems.class);
		arp.addMapping("pt_upload", "ids", Upload.class);
		arp.addMapping("pt_user", "ids", User.class);
		arp.addMapping("pt_userinfo", "ids", UserInfo.class);
		
		arp.addMapping("wx_article", "ids", Article.class);
		arp.addMapping("wx_group", "ids", com.weixin.mvc.group.Group.class);
		arp.addMapping("wx_keyword", "ids", Keyword.class);
		arp.addMapping("wx_location", "ids", Location.class);
		arp.addMapping("wx_message", "ids", Message.class);
		arp.addMapping("wx_user", "ids", com.weixin.mvc.user.User.class);

		arp.addMapping("test_blog", "ids", Blog.class);

		log.info("configPlugin 注册ActiveRecordPlugin插件");
		plugins.add(arp);
	}
	
}
