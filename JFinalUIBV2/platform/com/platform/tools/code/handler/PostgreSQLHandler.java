package com.platform.tools.code.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.constant.ConstantInit;
import com.platform.tools.ToolSqlXml;
import com.platform.tools.ToolString;
import com.platform.tools.code.run.ColumnDto;

/**
 * 定制PostgreSQL下的代码生成
 * @author 董华健
 */
public class PostgreSQLHandler extends BaseHandler {

	private static Logger log = Logger.getLogger(PostgreSQLHandler.class);
	
	public PostgreSQLHandler() {
    	String db_type = PropKit.get(ConstantInit.db_type_key);
		log.info("db_type = " + db_type);
		if(!db_type.equals(ConstantInit.db_type_postgresql)){
			throw new RuntimeException("请设置init.properties配置文件db.type = postgresql");
		}
	}

	@Override
	public List<ColumnDto> getColunm(String tableName) {
		List<ColumnDto> list = new ArrayList<ColumnDto>();

		Map<String, String> map = new HashMap<String, String>();
		List<Record> listDesc = Db.use(ConstantInit.db_dataSource_main).find(ToolSqlXml.getSql("platform.postgresql.getColumnsInfo"), tableName);
		for (Record record : listDesc) {
			if(record.getStr("attname") == null){
				map.put("tableName", record.getStr("description"));
			}else{
				map.put(record.getStr("attname"), record.getStr("description"));
			}
		}
		
		Map<String, String> columnJavaTypeMap = getJavaType(tableName);
				
		List<Record> listColumn = Db.use(ConstantInit.db_dataSource_main).find(ToolSqlXml.getSql("platform.postgresql.getColumns"), tableName);
		for (Record record : listColumn) {
			String column_name = record.getStr("column_name");
			String data_type = record.getStr("data_type");
			String character_maximum_length = String.valueOf(record.getNumber("character_maximum_length"));

			// 需要跳过的字段
			if("xxx".equals(column_name) || "yyy".equals(column_name) || "zzz".equals(column_name)){
				continue;
			}
			
			ColumnDto table = new ColumnDto();
			table.setTable_name(tableName);
			table.setTable_desc(listDesc.get(0).getStr("description"));
			
			table.setColumn_name(column_name);
			table.setColumn_name_upperCaseFirstOne(ToolString.toUpperCaseFirstOne(column_name));
			
			table.setColumn_type(data_type);
			table.setColumn_length(character_maximum_length);
			table.setColumn_desc(map.get(column_name));

			table.setColumn_className(columnJavaTypeMap.get(column_name.toLowerCase()));
			
			list.add(table);
		}
		
		return list;
	}
	
}
