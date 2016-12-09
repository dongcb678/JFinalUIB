package com.platform.dto;

import java.io.Serializable;

public class Redis implements Serializable {
	
	private static final long serialVersionUID = 7980276824979813474L;

	/**
	 * 名称
	 */
	public String name;
	
	/**
	 * IP
	 */
	public String ip;
	
	/**
	 * 端口
	 */
	public int port;

	/**
	 * 密码
	 */
	public String password;

	/**
	 * 超时时间
	 */
	public int timeout;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getTimeout() {
		return timeout;
	}

	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

}
