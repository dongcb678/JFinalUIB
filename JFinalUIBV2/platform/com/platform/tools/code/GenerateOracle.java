package com.platform.tools.code;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.config.run.ConfigCore;
import com.platform.constant.ConstantInit;
import com.platform.plugin.PropertiesPlugin;
import com.platform.tools.ToolSqlXml;
import com.platform.tools.ToolString;

/**
 * 定制Oracle下的代码生成
 * @author 董华健
 */
public class GenerateOracle extends GenerateBase {

	private static Logger log = Logger.getLogger(GenerateOracle.class);
	
	/**
	 * 循环生成文件
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		log.info("启动ConfigCore start ......");
    	new ConfigCore();
    	log.info("启动ConfigCore end ......");
    	
		GenerateBase base = new GenerateOracle();
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

			List<TableColumnDto> colunmList = base.getColunm(tableName);
			
			// 1.生成sql文件
			base.sql(classNameSmall, tableName); 
			
			// 2.生成model
			base.model(className, classNameSmall, dataSource, tableName, pkName, colunmList); 
			
			// 3.生成validator
			base.validator(className, classNameSmall); 
			
			// 4.生成controller
			base.controller(className, classNameSmall, tableName); 
			
			// 5.生成service
			base.service(className, classNameSmall); 

			// 6.生成DTO，还没有处理数据库字段类型到java数据类型的对应转换
			//base.dto(className, classNameSmall, dataSource, tableName, colunmList); 
			
			// 7.生成视图文件
			//base.form(classNameSmall, tableName, colunmList);
			//base.view(classNameSmall, tableName, colunmList);
		}
		
		System.exit(0);
	}

	@Override
	public List<TableColumnDto> getColunm(String tableName) {
		String dbUser = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_userName);
		
		List<TableColumnDto> list = new ArrayList<TableColumnDto>();
		
		String tableDesc = Db.use(ConstantInit.db_dataSource_main).findFirst(ToolSqlXml.getSql("platform.oracle.getTableComments"), dbUser, tableName).getStr("COMMENTS");
		
		Map<String, String> columnJavaTypeMap = getJavaType(tableName);
				
		List<Record> listColumnComments = Db.use(ConstantInit.db_dataSource_main).find(ToolSqlXml.getSql("platform.oracle.getColumnComments"), dbUser, tableName, tableName);
		for (Record record : listColumnComments) {
			String column_name = record.getStr("COLUMN_NAME").toLowerCase();
			String column_type = record.getStr("DATA_TYPE").toLowerCase();
			BigDecimal column_length = record.getBigDecimal("DATA_LENGTH");
			String comments = record.getStr("COMMENTS");
			
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
			table.setColumn_length(column_length.toString());
			table.setColumn_desc(comments);

			table.setColumn_className(columnJavaTypeMap.get(column_name.toLowerCase()));
			
			list.add(table);
		}
		
		return list;
	}
	
	

}
