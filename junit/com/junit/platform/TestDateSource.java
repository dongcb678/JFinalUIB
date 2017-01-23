package com.junit.platform;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;

import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.cache.EhCache;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;

/**
 * 动态创建数据源
 */
public class TestDateSource  {
	
	@Test
    public void test() throws Exception{
		// 创建数据源插件
		DruidPlugin druidPlugin = new DruidPlugin(
				"jdbc:mysql://127.0.0.1:3306/jfinaluibv4?characterEncoding=UTF-8"
				+ "&autoReconnect=true&failOverReadOnly=false&zeroDateTimeBehavior=convertToNull", 
				"root", "678789", "com.mysql.jdbc.Driver");
		druidPlugin.set(5, 5, 10);
		
		// 启动数据源插件，实例化数据源对象
		druidPlugin.start();
		
		// 获取数据源对象
		DataSource ds = druidPlugin.getDataSource();
		
		/**
		 * 创建Config，参数说明String name（Config名称）, DataSource dataSource（数据源）, Dialect dialect（方言）, 
		 * boolean showSql（是否先打印sql）, boolean devMode（是否开发模式）, int transactionLevel（事务隔离级别）, 
		 * IContainerFactory containerFactory（容器工厂）, ICache cache（缓存目标）
		 */
		Config config = new Config("test", ds, new MysqlDialect(), true, true, 
				DbKit.DEFAULT_TRANSACTION_LEVEL, new CaseInsensitiveContainerFactory(true), new EhCache());
		
		// 由于TableBuilder类可用范围限制，不能动态注册Model
		// new TableBuilder().build(tableList, config); 
		
		// 注册Config
		DbKit.addConfig(config);
		
		// 由于TableBuilder类可用范围限制，不能调用，也没意义，此方法用来注册Db类默认主数据源
		// Db.init(); 
		
		List<Record> list = Db.use("test").find("select * from pt_user");
		
		System.out.println("查询用户表：size = " + list.size() + "\r\n" + JsonKit.toJson(list));
    }

}
