package com.platform.tools.code;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.platform.plugin.SqlXmlPlugin;
import com.platform.tools.ToolSqlXml;
import com.platform.tools.ToolString;

/**
 * 定制MySQL下的代码生成
 * @author 董华健
 */
public class GenerateMySQL extends GenerateBase {

	private static Logger log = Logger.getLogger(GenerateMySQL.class);
	
	/**
	 * 循环生成文件
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		GenerateBase base = new GenerateMySQL();
		for (int i = 0; i < tableArr.length; i++) {
			// 数据源名称
			String dataSource = tableArr[i][0]; 
			// 表名
			String tableName = tableArr[i][1]; 
			// 主键
			String pkName = tableArr[i][2]; 
			// 类名
			String className = tableArr[i][3]; 
			// 类名首字母小写
			String classNameSmall = ToolString.toLowerCaseFirstOne(className); 
			
			// 1.生成sql文件
			base.sql(classNameSmall, tableName); 
			
			// 2.生成model
			base.model(className, classNameSmall, dataSource, tableName, pkName); 
			
			// 3.生成validator
			base.validator(className, classNameSmall); 
			
			// 4.生成controller
			base.controller(className, classNameSmall, tableName); 
			
			// 5.生成service
			base.service(className, classNameSmall); 

			// 6.生成DTO，还没有处理数据库字段类型到java数据类型的对应转换
			//base.dto(base, className, classNameSmall, dataSource, tableName); 
			
			// 7.生成视图文件
			//base.form(classNameSmall, tableName);
			//base.view(classNameSmall, tableName);
		}
		
		System.exit(0);
	}
	
	/**
	 * 根据自己的情况修改这里的数据源IP、端口、用户名、密码
	 * 数据库information_schema是mysql的系统库，不能改
	 */
	@Override
	public List<TableColumnDto> getColunm(String tableName)  {
		log.info("configPlugin 配置Druid数据库连接池连接属性");
		DruidPlugin druidPluginIS = new DruidPlugin(
				"jdbc:mysql://127.0.0.1:3306/information_schema?characterEncoding=UTF-8"
				+ "&autoReconnect=true&failOverReadOnly=false&zeroDateTimeBehavior=convertToNull", 
				"root", 
				"678789", 
				"com.mysql.jdbc.Driver");
		druidPluginIS.start();

		log.info("configPlugin 配置ActiveRecord插件");
		ActiveRecordPlugin arpIS = new ActiveRecordPlugin("information_schema", druidPluginIS);
		arpIS.setDevMode(true); // 设置开发模式
		arpIS.setShowSql(true); // 是否显示SQL
		arpIS.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 大小写不敏感
		arpIS.setDialect(new MysqlDialect());
		arpIS.start();
		
		log.info("EhCachePlugin EhCache缓存");
		EhCachePlugin ehCachePlugin = new EhCachePlugin();
		ehCachePlugin.start();

		log.info("SqlXmlPlugin 解析并缓存 xml sql");
		SqlXmlPlugin sqlXmlPlugin = new SqlXmlPlugin();
		sqlXmlPlugin.start();
		
		List<TableColumnDto> list = new ArrayList<TableColumnDto>();
		
		String tableDesc = Db.use("information_schema").findFirst(ToolSqlXml.getSql("platform.mysql.getTables"), "jfinaluibv2", tableName).getStr("table_COMMENT");
		List<Record> listColumn = Db.use("information_schema").find(ToolSqlXml.getSql("platform.mysql.getColumns"), "jfinaluibv2", tableName);
		
		Map<String, String> columnJavaTypeMap = getJavaType(tableName);
				
		for (Record record : listColumn) {
			String column_name = record.getStr("column_name");
			String column_type = record.getStr("column_type");
			String character_maximum_length = String.valueOf(record.getBigInteger("CHARACTER_MAXIMUM_LENGTH"));
			String column_comment = record.getStr("COLUMN_COMMENT");

			// 需要跳过的字段
			if("xxx".equals(column_name) || "yyy".equals(column_name) || "zzz".equals(column_name)){
				continue;
			}
			
			TableColumnDto table = new TableColumnDto();
			table.setTable_name(tableName);
			table.setTable_desc(tableDesc);
			
			table.setColumn_name(column_name);
			table.setColumn_name_upperCaseFirstOne(ToolString.toUpperCaseFirstOne(column_name));
			table.setColumn_type(column_type);
			table.setColumn_length(character_maximum_length);
			table.setColumn_desc(column_comment);
			
			table.setColumn_className(columnJavaTypeMap.get(column_name.toLowerCase()));
			
			list.add(table);
		}
		
		return list;
	}

	/**
	 * 根据自己的情况修改这里的数据源IP、端口、数据库名称、用户名、密码
	 */
	public Map<String, String> getJavaType(String tableName){
		log.info("configPlugin 配置Druid数据库连接池连接属性");
		DruidPlugin druidPluginUIB = new DruidPlugin(
				"jdbc:mysql://127.0.0.1:3306/jfinaluibv2?characterEncoding=UTF-8"
				+ "&autoReconnect=true&failOverReadOnly=false&zeroDateTimeBehavior=convertToNull", 
				"root", 
				"678789", 
				"com.mysql.jdbc.Driver");
		druidPluginUIB.start();

        //  获取字段数
	    Map<String, String> columnJavaTypeMap = new HashMap<String, String>();
		try {
			DataSource dataSource = druidPluginUIB.getDataSource();
			Connection conn = dataSource.getConnection();
			
			Statement stmt = conn.createStatement();    
		    String sql = "select * from " + tableName + " where 1 != 1 ";   
		    ResultSet rs = stmt.executeQuery(sql);    
		    ResultSetMetaData rsmd = rs.getMetaData(); 

	        int columns = rsmd.getColumnCount();   
	        for (int i=1; i<=columns; i++){   
	            //获取字段名
	            String columnName = rsmd.getColumnName(i).toLowerCase(); 
	 			String columnClassName = rsmd.getColumnClassName(i);   
	 			if(columnClassName.equals("[B")){
	 				columnClassName = "byte[]";
	 			}
	 			columnJavaTypeMap.put(columnName, columnClassName);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return columnJavaTypeMap;
	}

}
