package com.platform.dto;

import java.io.Serializable;

public class DataBase implements Serializable {
	
	private static final long serialVersionUID = 7980276824979813474L;

	/**
	 * 数据库连接参数：驱动
	 */
	public String driverClass;
	
	/**
	 * 数据库连接参数：连接URL
	 */
	public String jdbcUrl;
	
	/**
	 * 数据库连接参数：用户名
	 */
	public String userName;
	
	/**
	 * 数据库连接参数：密码
	 */
	public String passWord;

	/**
	 * 数据库连接参数：数据库服务器IP
	 */
	public String ip;
	
	/**
	 * 数据库连接参数：数据库服务器端口
	 */
	public String port;
	
	/**
	 * 数据库连接参数：数据库名称
	 */
	public String dbName;

	public String getDriverClass() {
		return driverClass;
	}

	public void setDriverClass(String driverClass) {
		this.driverClass = driverClass;
	}

	public String getJdbcUrl() {
		return jdbcUrl;
	}

	public void setJdbcUrl(String jdbcUrl) {
		this.jdbcUrl = jdbcUrl;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getDbName() {
		return dbName;
	}

	public void setDbName(String dbName) {
		this.dbName = dbName;
	}

	
}
