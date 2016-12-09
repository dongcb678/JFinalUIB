package com.platform.constant;

/**
 * init配置文件对应的key
 * @author 董华健
 */
public interface ConstantInit {

	/**
	 * 扫描的包
	 */
	public static final String config_scan_package = "config.scan.package";

	/**
	 * 扫描的jar
	 */
	public static final String config_scan_jar = "config.scan.jar";
	
	/**
	 * 开发模式
	 */
	public static final String config_devMode = "config.devMode";
	
	/**
	 * 加密密钥
	 */
	public static final String config_securityKey_key = "config.securityKey";
	
	/**
	 * 密码最大错误次数
	 */
	public static final String config_passErrorCount_key = "config.passErrorCount";
	
	/**
	 * 密码错误最大次数后间隔登陆时间（小时）
	 */
	public static final String config_passErrorHour_key = "config.passErrorHour";

	/**
	 * #文件上传大小限制 10 * 1024 * 1024 = 10M
	 */
	public static final String config_maxPostSize_key = "config.maxPostSize";

	/**
	 * # cookie 值的时间
	 */
	public static final String config_maxAge_key = "config.maxAge";

	/**
	 * # 不使用自动登陆时，最大超时时间，单位：分钟
	 */
	public static final String config_session_key = "config.session";

	/**
	 * # 域名或者服务器IP，多个逗号隔开，验证Referer时使用
	 */
	public static final String config_domain_key = "config.domain";

	/**
	 * mail 配置：邮件服务器地址
	 */
	public static final String config_mail_host = "config.mail.host";

	/**
	 * mail 配置：邮件服务器端口
	 */
	public static final String config_mail_port = "config.mail.port";

	/**
	 * mail 配置：邮件服务器账号
	 */
	public static final String config_mail_from = "config.mail.from";

	/**
	 * mail 配置：邮件服务器名称
	 */
	public static final String config_mail_userName = "config.mail.userName";

	/**
	 * mail 配置：邮件服务器密码
	 */
	public static final String config_mail_password = "config.mail.password";

	/**
	 * mail 配置：接收邮件地址
	 */
	public static final String config_mail_to = "config.mail.to";

	/**
	 *  缓存类型配置
	 */
	public static final String config_cache_type = "config.cache.type";

	/**
	 *  redis 配置：数量
	 */
	public static final String config_redis_count = "redis.count";

	/**
	 *  国际化配置，资源文件前缀
	 */
	public static final String config_i18n_filePrefix = "config.i18n.filePrefix";

	/**
	 * 数据源个数
	 */
	public static final String db_count_key = "db.count";

	/**
	 * 当前数据源名称
	 */
	public static final String db_name_key = "name";

	/**
	 * 当前数据源类型
	 */
	public static final String db_type_key = "type";

	/**
	 * 当前数据库类型：postgresql
	 */
	public static final String db_type_postgresql = "postgresql";

	/**
	 * 当前数据库类型：mysql
	 */
	public static final String db_type_mysql = "mysql";

	/**
	 * 当前数据库类型：oracle
	 */
	public static final String db_type_oracle = "oracle";

	/**
	 * 当前数据库类型：sqlserver
	 */
	public static final String db_type_sqlserver = "sqlserver";

	/**
	 * 当前数据库类型：db2
	 */
	public static final String db_type_db2 = "db2";

	/**
	 * 数据库连接参数：驱动
	 */
	public static final String db_connection_postgresql_driverClass = "postgresql.driverClass";
	
	/**
	 * 数据库连接参数：连接URL
	 */
	public static final String db_connection_postgresql_jdbcUrl = "postgresql.jdbcUrl";
	
	/**
	 * 数据库连接参数：用户名
	 */
	public static final String db_connection_postgresql_userName = "postgresql.userName";
	
	/**
	 * 数据库连接参数：密码
	 */
	public static final String db_connection_postgresql_passWord = "postgresql.passWord";

	/**
	 * 数据库连接参数：驱动
	 */
	public static final String db_connection_mysql_driverClass = "mysql.driverClass";
	
	/**
	 * 数据库连接参数：连接URL
	 */
	public static final String db_connection_mysql_jdbcUrl = "mysql.jdbcUrl";
	
	/**
	 * 数据库连接参数：用户名
	 */
	public static final String db_connection_mysql_userName = "mysql.userName";
	
	/**
	 * 数据库连接参数：密码
	 */
	public static final String db_connection_mysql_passWord = "mysql.passWord";

	/**
	 * 数据库连接参数：驱动
	 */
	public static final String db_connection_oracle_driverClass = "oracle.driverClass";
	
	/**
	 * 数据库连接参数：连接URL
	 */
	public static final String db_connection_oracle_jdbcUrl = "oracle.jdbcUrl";
	
	/**
	 * 数据库连接参数：用户名
	 */
	public static final String db_connection_oracle_userName = "oracle.userName";
	
	/**
	 * 数据库连接参数：密码
	 */
	public static final String db_connection_oracle_passWord = "oracle.passWord";
	
	/**
	 * 数据库连接参数：驱动
	 */
	public static final String db_connection_sqlserver_driverClass = "sqlserver.driverClass";
	
	/**
	 * 数据库连接参数：连接URL
	 */
	public static final String db_connection_sqlserver_jdbcUrl = "sqlserver.jdbcUrl";
	
	/**
	 * 数据库连接参数：用户名
	 */
	public static final String db_connection_sqlserver_userName = "sqlserver.userName";
	
	/**
	 * 数据库连接参数：密码
	 */
	public static final String db_connection_sqlserver_passWord = "sqlserver.passWord";

	/**
	 * 数据库连接参数：驱动
	 */
	public static final String db_connection_db2_driverClass = "db2.driverClass";
	
	/**
	 * 数据库连接参数：连接URL
	 */
	public static final String db_connection_db2_jdbcUrl = "db2.jdbcUrl";
	
	/**
	 * 数据库连接参数：用户名
	 */
	public static final String db_connection_db2_userName = "db2.userName";
	
	/**
	 * 数据库连接参数：密码
	 */
	public static final String db_connection_db2_passWord = "db2.passWord";

	/**
	 * 数据库连接池参数：初始化连接大小
	 */
	public static final String db_initialSize = "initialSize";

	/**
	 * 数据库连接池参数：最少连接数
	 */
	public static final String db_minIdle = "minIdle";

	/**
	 * 数据库连接池参数：最多连接数
	 */
	public static final String db_maxActive = "maxActive";

	/**
	 *  主数据源名称：系统主数据源
	 */
	public static final String db_dataSource_main = "main";

}
