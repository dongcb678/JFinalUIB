package com.platform.thread.job;

import java.sql.Connection;
import java.sql.SQLException;

import org.quartz.utils.ConnectionProvider;

import com.jfinal.plugin.activerecord.DbKit;
import com.platform.constant.ConstantInit;

public class MyConnectionProvider implements ConnectionProvider{
	
	@Override
	public Connection getConnection() throws SQLException {
		return DbKit.getConfig(ConstantInit.db_dataSource_main).getConnection();
	}

	@Override
	public void initialize() throws SQLException {
		
	}

	@Override
	public void shutdown() throws SQLException {
		
	}
	
}
