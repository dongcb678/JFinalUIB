package little.ant.platform.plugin;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import little.ant.platform.common.DictKeys;

import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;

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
		paramMap.put(DictKeys.db_type_key, properties.getProperty(DictKeys.db_type_key).trim());
		
		// 判断数据库类型
		String db_type = (String) getParamMapValue(DictKeys.db_type_key);
		if(db_type.equals(DictKeys.db_type_postgresql)){ // pg 数据库连接信息
			// 读取当前配置数据库连接信息
			paramMap.put(DictKeys.db_connection_driverClass, properties.getProperty("postgresql.driverClass").trim());
			paramMap.put(DictKeys.db_connection_jdbcUrl, properties.getProperty("postgresql.jdbcUrl").trim());
			paramMap.put(DictKeys.db_connection_userName, properties.getProperty("postgresql.userName").trim());
			paramMap.put(DictKeys.db_connection_passWord, properties.getProperty("postgresql.passWord").trim());
			
			// 解析数据库连接URL，获取数据库名称
			String jdbcUrl = (String) getParamMapValue(DictKeys.db_connection_jdbcUrl);
			String database = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			database = database.substring(database.indexOf("/") + 1);

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
			
		}else if(db_type.equals(DictKeys.db_type_mysql)){ // mysql 数据库连接信息
			// 读取当前配置数据库连接信息
			paramMap.put(DictKeys.db_connection_driverClass, "com.mysql.jdbc.Driver");
			paramMap.put(DictKeys.db_connection_jdbcUrl, properties.getProperty("mysql.jdbcUrl").trim());
			paramMap.put(DictKeys.db_connection_userName, properties.getProperty("mysql.userName").trim());
			paramMap.put(DictKeys.db_connection_passWord, properties.getProperty("mysql.passWord").trim());

			// 解析数据库连接URL，获取数据库名称
			String jdbcUrl = (String) getParamMapValue(DictKeys.db_connection_jdbcUrl);
			String database = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			database = database.substring(database.indexOf("/") + 1, database.indexOf("?"));

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
			
		}else if(db_type.equals(DictKeys.db_type_oracle)){ // oracle 数据库连接信息
			paramMap.put(DictKeys.db_connection_driverClass, properties.getProperty("oracle.driverClass").trim());
			paramMap.put(DictKeys.db_connection_jdbcUrl, properties.getProperty("oracle.jdbcUrl").trim());
			paramMap.put(DictKeys.db_connection_userName, properties.getProperty("oracle.userName").trim());
			paramMap.put(DictKeys.db_connection_passWord, properties.getProperty("oracle.passWord").trim());

			// 解析数据库连接URL，获取数据库名称
			String jdbcUrl = (String) getParamMapValue(DictKeys.db_connection_jdbcUrl);
			String[] prop = jdbcUrl.substring(jdbcUrl.indexOf("@") + 1).split(":");
			String database = prop[2];

			// 解析数据库连接URL，获取数据库地址IP
			String ip = prop[0];

			// 解析数据库连接URL，获取数据库地址端口
			String port = prop[1];
			
			// 把数据库连接信息写入常用map
			paramMap.put(DictKeys.db_connection_ip, ip);
			paramMap.put(DictKeys.db_connection_port, port);
			paramMap.put(DictKeys.db_connection_dbName, database);
		}
		
		// 数据库连接池信息
		paramMap.put(DictKeys.db_initialSize, Integer.valueOf(properties.getProperty(DictKeys.db_initialSize).trim()));
		paramMap.put(DictKeys.db_minIdle, Integer.valueOf(properties.getProperty(DictKeys.db_minIdle).trim()));
		paramMap.put(DictKeys.db_maxActive, Integer.valueOf(properties.getProperty(DictKeys.db_maxActive).trim()));
		
		// 把常用配置信息写入map
		paramMap.put(DictKeys.config_devMode, properties.getProperty(DictKeys.config_devMode).trim());
		paramMap.put(DictKeys.config_luceneIndex, properties.getProperty(DictKeys.config_luceneIndex).trim());
		paramMap.put(DictKeys.config_securityKey_key, properties.getProperty(DictKeys.config_securityKey_key).trim());
		paramMap.put(DictKeys.config_passErrorCount_key, Integer.valueOf(properties.getProperty(DictKeys.config_passErrorCount_key)));
		paramMap.put(DictKeys.config_passErrorHour_key, Integer.valueOf(properties.getProperty(DictKeys.config_passErrorHour_key)));
		paramMap.put(DictKeys.config_maxPostSize_key, Integer.valueOf(properties.getProperty(DictKeys.config_maxPostSize_key)));
		paramMap.put(DictKeys.config_maxAge_key, Integer.valueOf(properties.getProperty(DictKeys.config_maxAge_key)));
		paramMap.put(DictKeys.config_domain_key, properties.getProperty(DictKeys.config_domain_key));
		
		return true;
	}

	@Override
	public boolean stop() {
		paramMap.clear();
		return true;
	}

}
