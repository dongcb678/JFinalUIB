package com.platform.tools.code;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.constant.ConstantInit;
import com.platform.run.ConfigCore;
import com.platform.tools.ToolSqlXml;
import com.platform.tools.ToolString;

/**
 * 定制PostgreSQL下的代码生成
 * @author 董华健
 */
public class GeneratePostgreSQL extends GenerateBase {

	private static Logger log = Logger.getLogger(GeneratePostgreSQL.class);
	
	/**
	 * 循环生成文件
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		log.info("启动ConfigCore start ......");
    	new ConfigCore();
    	log.info("启动ConfigCore end ......");
    	
		GenerateBase base = new GeneratePostgreSQL();
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

	@Override
	public List<TableColumnDto> getColunm(String tableName) {
		List<TableColumnDto> list = new ArrayList<TableColumnDto>();
		
		List<Record> listDesc = Db.use(ConstantInit.db_dataSource_main).find(ToolSqlXml.getSql("platform.postgresql.getColumnsInfo"), tableName);
		int index = 1;
		
		List<Record> listColumn = Db.use(ConstantInit.db_dataSource_main).find(ToolSqlXml.getSql("platform.postgresql.getColumns"), tableName);
		for (Record record : listColumn) {
			String column_name = record.getStr("column_name");
			String data_type = record.getStr("data_type");
			String character_maximum_length = String.valueOf(record.getInt("character_maximum_length"));

			// 需要跳过的字段
			if("xxx".equals(column_name) || "yyy".equals(column_name) || "zzz".equals(column_name)){
				index += 1;
				continue;
			}
			
			TableColumnDto table = new TableColumnDto();
			table.setTable_name(tableName);
			table.setColumn_name(column_name);
			table.setColumn_type(data_type);
			table.setColumn_length(character_maximum_length);

			table.setTable_desc(listDesc.get(0).getStr("description"));
			table.setColumn_desc(listDesc.get(index).getStr("description"));
			
			list.add(table);
			
			index += 1;
		}
		
		return list;
	}

	@Override
	public String dbTypeToJava(String columnType){
		String javaDataType = null;
		if(columnType.indexOf("char") != -1 || columnType.indexOf("text") != -1){
			javaDataType = "String";
			
		} else if(columnType.indexOf("int") != -1){
			javaDataType = "long";
			
		} else if(columnType.indexOf("time") != -1 || columnType.indexOf("date") != -1){
			javaDataType = "Date";
			
		} else if(columnType.indexOf("byte") != -1 || columnType.indexOf("text") != -1){
			javaDataType = "byte[]";
		}
		
		return javaDataType;
	}
}
