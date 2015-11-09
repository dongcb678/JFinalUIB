package com.platform.plugin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;
import com.platform.constant.ConstantInit;

/**
 * 读取Properties配置文件数据放入缓存
 * @author 董华健
 */
public class PropertiesPlugin implements IPlugin {

    protected final Logger log = Logger.getLogger(getClass());

	/**
	 * 保存系统配置参数值
	 */
	private static Map<String, Object> paramMap = new HashMap<String, Object>();
	
    private Properties properties;

	public PropertiesPlugin(Properties properties){
		this.properties = properties;
	}

	/**
	 * 获取系统配置参数值
	 * @param key
	 * @return
	 */
	public static Object getParamMapValue(String key){
		return paramMap.get(key);
	}
	
	@Override
	public boolean start() {
		paramMap.put(ConstantInit.db_type_key, properties.getProperty(ConstantInit.db_type_key).trim());
		
		// 判断数据库类型
		String db_type = (String) getParamMapValue(ConstantInit.db_type_key);
		if(db_type.equals(ConstantInit.db_type_postgresql)){ // pg 数据库连接信息
			// 读取当前配置数据库连接信息
			paramMap.put(ConstantInit.db_connection_driverClass, properties.getProperty("postgresql.driverClass").trim());
			paramMap.put(ConstantInit.db_connection_jdbcUrl, properties.getProperty("postgresql.jdbcUrl").trim());
			paramMap.put(ConstantInit.db_connection_userName, properties.getProperty("postgresql.userName").trim());
			paramMap.put(ConstantInit.db_connection_passWord, properties.getProperty("postgresql.passWord").trim());
			
			// 解析数据库连接URL，获取数据库名称
			String jdbcUrl = (String) getParamMapValue(ConstantInit.db_connection_jdbcUrl);
			String database = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			database = database.substring(database.indexOf("/") + 1);

			// 解析数据库连接URL，获取数据库地址IP
			String ip = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			ip = ip.substring(0, ip.indexOf(":"));

			// 解析数据库连接URL，获取数据库地址端口
			String port = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			port = port.substring(port.indexOf(":") + 1, port.indexOf("/"));
			
			// 把数据库连接信息写入常用map
			paramMap.put(ConstantInit.db_connection_ip, ip);
			paramMap.put(ConstantInit.db_connection_port, port);
			paramMap.put(ConstantInit.db_connection_dbName, database);
			
		}else if(db_type.equals(ConstantInit.db_type_mysql)){ // mysql 数据库连接信息
			// 读取当前配置数据库连接信息
			paramMap.put(ConstantInit.db_connection_driverClass, "com.mysql.jdbc.Driver");
			paramMap.put(ConstantInit.db_connection_jdbcUrl, properties.getProperty("mysql.jdbcUrl").trim());
			paramMap.put(ConstantInit.db_connection_userName, properties.getProperty("mysql.userName").trim());
			paramMap.put(ConstantInit.db_connection_passWord, properties.getProperty("mysql.passWord").trim());

			// 解析数据库连接URL，获取数据库名称
			String jdbcUrl = (String) getParamMapValue(ConstantInit.db_connection_jdbcUrl);
			String database = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			database = database.substring(database.indexOf("/") + 1, database.indexOf("?"));

			// 解析数据库连接URL，获取数据库地址IP
			String ip = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			ip = ip.substring(0, ip.indexOf(":"));

			// 解析数据库连接URL，获取数据库地址端口
			String port = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			port = port.substring(port.indexOf(":") + 1, port.indexOf("/"));
			
			// 把数据库连接信息写入常用map
			paramMap.put(ConstantInit.db_connection_ip, ip);
			paramMap.put(ConstantInit.db_connection_port, port);
			paramMap.put(ConstantInit.db_connection_dbName, database);
			
		}else if(db_type.equals(ConstantInit.db_type_oracle)){ // oracle 数据库连接信息
			paramMap.put(ConstantInit.db_connection_driverClass, properties.getProperty("oracle.driverClass").trim());
			paramMap.put(ConstantInit.db_connection_jdbcUrl, properties.getProperty("oracle.jdbcUrl").trim());
			paramMap.put(ConstantInit.db_connection_userName, properties.getProperty("oracle.userName").trim());
			paramMap.put(ConstantInit.db_connection_passWord, properties.getProperty("oracle.passWord").trim());

			// 解析数据库连接URL，获取数据库名称
			String jdbcUrl = (String) getParamMapValue(ConstantInit.db_connection_jdbcUrl);
			String[] prop = jdbcUrl.substring(jdbcUrl.indexOf("@") + 1).split(":");
			String database = prop[2];

			// 解析数据库连接URL，获取数据库地址IP
			String ip = prop[0];

			// 解析数据库连接URL，获取数据库地址端口
			String port = prop[1];
			
			// 把数据库连接信息写入常用map
			paramMap.put(ConstantInit.db_connection_ip, ip);
			paramMap.put(ConstantInit.db_connection_port, port);
			paramMap.put(ConstantInit.db_connection_dbName, database);
		}
		
		// 数据库连接池信息
		paramMap.put(ConstantInit.db_initialSize, Integer.valueOf(properties.getProperty(ConstantInit.db_initialSize).trim()));
		paramMap.put(ConstantInit.db_minIdle, Integer.valueOf(properties.getProperty(ConstantInit.db_minIdle).trim()));
		paramMap.put(ConstantInit.db_maxActive, Integer.valueOf(properties.getProperty(ConstantInit.db_maxActive).trim()));
		
		// 把常用配置信息写入map
		String scan_package = properties.getProperty(ConstantInit.config_scan_package).trim();
		if(null != scan_package && !scan_package.isEmpty()){
			List<String> list = new ArrayList<String>();
			String[] pkgs = scan_package.split(",");
			for (String pkg : pkgs) {
				list.add(pkg.trim());
			}
			paramMap.put(ConstantInit.config_scan_package, list);
		}else{
			paramMap.put(ConstantInit.config_scan_package, new ArrayList<String>());
		}
		
		String scan_jar = properties.getProperty(ConstantInit.config_scan_jar).trim();
		if(null != scan_jar && !scan_jar.isEmpty()){
			List<String> list = new ArrayList<String>();
			String[] jars = scan_jar.split(",");
			for (String jar : jars) {
				list.add(jar.trim());
			}
			paramMap.put(ConstantInit.config_scan_jar, list);
		}else{
			paramMap.put(ConstantInit.config_scan_jar, new ArrayList<String>());
		}

		paramMap.put(ConstantInit.config_devMode, properties.getProperty(ConstantInit.config_devMode).trim());
		
		paramMap.put(ConstantInit.config_luceneIndex, properties.getProperty(ConstantInit.config_luceneIndex).trim());
		
		paramMap.put(ConstantInit.config_securityKey_key, properties.getProperty(ConstantInit.config_securityKey_key).trim());
		
		paramMap.put(ConstantInit.config_passErrorCount_key, Integer.valueOf(properties.getProperty(ConstantInit.config_passErrorCount_key)));
		
		paramMap.put(ConstantInit.config_passErrorHour_key, Integer.valueOf(properties.getProperty(ConstantInit.config_passErrorHour_key)));
		
		paramMap.put(ConstantInit.config_maxPostSize_key, Integer.valueOf(properties.getProperty(ConstantInit.config_maxPostSize_key)));
		
		paramMap.put(ConstantInit.config_maxAge_key, Integer.valueOf(properties.getProperty(ConstantInit.config_maxAge_key)));

		paramMap.put(ConstantInit.config_session_key, Integer.valueOf(properties.getProperty(ConstantInit.config_session_key)));
		
		paramMap.put(ConstantInit.config_domain_key, properties.getProperty(ConstantInit.config_domain_key));
		
		// mail 配置
		paramMap.put(ConstantInit.config_mail_host, properties.getProperty(ConstantInit.config_mail_host).trim());
		paramMap.put(ConstantInit.config_mail_port, properties.getProperty(ConstantInit.config_mail_port).trim());
		paramMap.put(ConstantInit.config_mail_from, properties.getProperty(ConstantInit.config_mail_from).trim());
		paramMap.put(ConstantInit.config_mail_userName, properties.getProperty(ConstantInit.config_mail_userName).trim());
		paramMap.put(ConstantInit.config_mail_password, properties.getProperty(ConstantInit.config_mail_password).trim());
		paramMap.put(ConstantInit.config_mail_to, properties.getProperty(ConstantInit.config_mail_to).trim());

		// 缓存类型配置
		paramMap.put(ConstantInit.config_cache_type, properties.getProperty(ConstantInit.config_cache_type).trim());
		
		// redis 配置
		paramMap.put(ConstantInit.config_redis_ip, properties.getProperty(ConstantInit.config_redis_ip).trim());
		paramMap.put(ConstantInit.config_redis_port, Integer.valueOf(properties.getProperty(ConstantInit.config_redis_port).trim()));

		// 国际化配置，资源文件前缀
		paramMap.put(ConstantInit.config_i18n_filePrefix, properties.getProperty(ConstantInit.config_i18n_filePrefix).trim());
		
		for (String key : paramMap.keySet()) {
			log.debug("全局参数配置：" + key + " = " + paramMap.get(key));
		}
		
		return true;
	}

	@Override
	public boolean stop() {
		paramMap.clear();
		return true;
	}

}
