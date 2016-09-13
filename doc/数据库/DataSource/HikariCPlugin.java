package com.platform.plugin;

import javax.sql.DataSource;

import com.jfinal.plugin.IPlugin;
import com.jfinal.plugin.activerecord.IDataSourceProvider;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/**
 * The HikariCP datasource plugin.
 */
public class HikariCPlugin implements IPlugin, IDataSourceProvider {
	
	private String driverClass;
	private String jdbcUrl;
	private String user;
	private String password;
	
	private boolean readOnly = false; // 连接只读数据库时配置为true， 保证安全
	
	private int minimumIdle = 50;
	private int maximumPoolSize = 100; // 连接池中允许的最大连接数。缺省值：10；推荐的公式：((core_count * 2) + effective_spindle_count) 

	private long connectionTimeout = 30000; // 等待连接池分配连接的最大时长（毫秒），超过这个时长还没可用的连接则发生SQLException， 缺省:30秒
	private long idleTimeout = 600000; // 一个连接idle状态的最大时长（毫秒），超时则被释放（retired），缺省:10分钟
	
	/**
	 * 一个连接的生命时长（毫秒），超时而且没被使用则被释放（retired），
	 * 缺省:30分钟，建议设置比数据库超时时长少30秒，参考MySQL wait_timeout参数（show variables like '%timeout%';）
	 */
	private long maxLifetime = 1800000;
	
	private String poolName = "HikariCP";
	
	private HikariDataSource dataSource;
	private boolean isStarted = false;
	
	public HikariCPlugin(String driverClass, String jdbcUrl, String user, String password, int minimumIdle, int maximumPoolSize) {
		this.jdbcUrl = jdbcUrl;
		this.user = user;
		this.password = password;
		this.driverClass = driverClass;
	}
	
	public boolean start() {
		if (isStarted)
			return true;
		
		HikariConfig config = new HikariConfig();

		config.setDriverClassName(driverClass);
		config.setJdbcUrl(jdbcUrl);
		config.setUsername(user);
		config.setPassword(password);
		
		config.setReadOnly(readOnly);
		
		config.setMinimumIdle(minimumIdle);
		config.setMaximumPoolSize(maximumPoolSize);
		
		config.setConnectionTimeout(connectionTimeout);
		config.setIdleTimeout(idleTimeout);
		config.setMaxLifetime(maxLifetime);
		
		config.setPoolName(poolName);
		
		// 乱码处理
		config.addDataSourceProperty("useUnicode", "true");
		config.addDataSourceProperty("characterEncoding", "utf8");
		
		// Statement Cache
		config.addDataSourceProperty("cachePrepStmts", "true");
		config.addDataSourceProperty("prepStmtCacheSize", "250");
		config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");

		dataSource = new HikariDataSource(config);
		
		isStarted = true;
		return true;
	}
	
	public DataSource getDataSource() {
		return dataSource;
	}
	
	public boolean stop() {
		if (dataSource != null)
			dataSource.close();
		
		dataSource = null;
		isStarted = false;
		return true;
	}
}

