package com.platform.run;

import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect;
import com.jfinal.plugin.activerecord.dialect.SqlServerDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.plugin.redis.RedisPlugin;
import com.platform.constant.ConstantCache;
import com.platform.constant.ConstantInit;
import com.platform.dto.DataBase;
import com.platform.plugin.I18NPlugin;
import com.platform.plugin.ParamInitPlugin;
import com.platform.plugin.ServicePlugin;
import com.platform.plugin.SqlXmlPlugin;
import com.platform.plugin.TableScan;
import com.platform.tools.ToolBeetl;
import com.platform.tools.ToolCache;
import com.platform.tools.ToolDataBase;

/**
 * 独立启动JFinal中的插件，不依赖web容器调用插件
 * @author 董华健  dongcb678@163.com
 * 描述：独立启用核心组件主要给单元测试、代码生成器使用
 */
public class ConfigCore {

	private static final Log log = Log.getLog(ConfigCore.class);

	private static volatile ConfigCore configCore;
	
	public static ConfigCore getSingleton(){
		if(configCore == null){
			synchronized (ConfigCore.class) {
				if(configCore == null){
					configCore = new ConfigCore();
				}
			}
		}
		return configCore;
	}
	
    private ConfigCore() {
    	PropKit.use("init.properties");

		log.info("Beetl设置");
    	ToolBeetl.regiseter();
    	
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
		
		log.info("configPlugin 配置ActiveRecord插件");
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
			druidPlugin.setValidationQuery("select 1 FROM DUAL"); //指定连接验证语句
			arpMain.setDialect(new OracleDialect());
			
		}else if(db_type.equals(ConstantInit.db_type_sqlserver)){
			log.info("configPlugin 使用数据库类型是 sqlserver");
			arpMain.setDialect(new SqlServerDialect());
			
		}else if(db_type.equals(ConstantInit.db_type_db2)){
			log.info("configPlugin 使用数据库类型是 db2");
			druidPlugin.setValidationQuery("select 1 from sysibm.sysdummy1"); //连接验证语句
			arpMain.setDialect(new AnsiSqlDialect());
		}
		
		druidPlugin.start();
		
		log.info("configPlugin 表扫描注册");
		new TableScan(ConstantInit.db_dataSource_main, arpMain).start();

		arpMain.start();

		log.info("ServicePlugin Service注解实例化加载");
		new ServicePlugin().start();
		
		log.info("I18NPlugin 国际化键值对加载");
		new I18NPlugin().start();
		
		if(ToolCache.getCacheType().equals(ConstantCache.cache_type_ehcache)){
			log.info("EhCachePlugin EhCache缓存");
			new EhCachePlugin().start();
			
		}else if(ToolCache.getCacheType().equals(ConstantCache.cache_type_redis)){
			log.info("RedisPlugin Redis缓存");
			String redisIp = PropKit.get(ConstantInit.config_redis_ip);
			Integer redisPort = PropKit.getInt(ConstantInit.config_redis_port);
			new RedisPlugin(ConstantCache.cache_name_redis_system, redisIp, redisPort).start();
		}
		
		log.info("SqlXmlPlugin 解析并缓存 xml sql");
		SqlXmlPlugin sqlXmlPlugin = new SqlXmlPlugin();
		sqlXmlPlugin.start();
		
		log.info("afterJFinalStart 缓存参数");
		ParamInitPlugin paramInitPlugin = new ParamInitPlugin();
		paramInitPlugin.start();
    }

}
