package com.platform.tools.code.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.tools.ToolSqlXml;
import com.platform.tools.ToolString;

/**
 * 定制PostgreSQL下的代码生成
 * @author 董华健
 */
public class PostgreSQLHandler extends BaseHandler {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(PostgreSQLHandler.class);
	
	@Override
	public List<ColumnDto> getColunm(String tableName) {
		String name = getDataBase().getName();
		
		// 1.查询表和字段描述信息
		Map<String, String> map = new HashMap<String, String>();
		String ciSql = ToolSqlXml.getSqlMy("platform.postgresql.getColumnsInfo");
		List<Record> listDesc = Db.use(name).find(ciSql, tableName);
		for (Record record : listDesc) {
			if(record.getStr("attname") == null){
				map.put("tableName", record.getStr("description"));
			}else{
				map.put(record.getStr("attname"), record.getStr("description"));
			}
		}
		
		// 2.查询表字段信息
		String cSql = ToolSqlXml.getSqlMy("platform.postgresql.getColumns");
		List<Record> listColumn = Db.use(name).find(cSql, tableName);

		// 3.查询表字段对应的所有java数据类型
		Map<String, String> columnJavaTypeMap = getJavaType(tableName);
		
		List<ColumnDto> list = new ArrayList<ColumnDto>();
		
		// 4.循环合并表字段详细信息
		for (Record record : listColumn) {
			String column_name = record.getStr("column_name");
			String data_type = record.getStr("data_type");
			String character_maximum_length = String.valueOf(record.getNumber("character_maximum_length"));

			// 需要跳过的字段
			if("xxx".equals(column_name) || "yyy".equals(column_name) || "zzz".equals(column_name)){
				continue;
			}
			
			ColumnDto table = new ColumnDto();
			table.setTable_name(tableName); // 表名称
			table.setTable_desc(listDesc.get(0).getStr("description")); // 表描述
			table.setColumn_name(column_name); // 列名称
			 // 列名称，首字母大写
			table.setColumn_name_upperCaseFirstOne(ToolString.toUpperCaseFirstOne(column_name));
			table.setColumn_type(data_type); // 列类型
			table.setColumn_length(character_maximum_length); // 列最大长度
			table.setColumn_desc(map.get(column_name)); // 列描述
			// 对应的java数据类型
			table.setColumn_className(columnJavaTypeMap.get(column_name.toLowerCase()));
			
			list.add(table);
		}
		
		return list;
	}
	
}
