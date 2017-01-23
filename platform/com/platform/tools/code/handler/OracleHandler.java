package com.platform.tools.code.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.tools.ToolSqlXml;
import com.platform.tools.ToolString;

/**
 * 定制Oracle下的代码生成
 * @author 董华健
 */
public class OracleHandler extends BaseHandler {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(OracleHandler.class);
	
	@Override
	public List<ColumnDto> getColunm(String tableName) {
		String dbUser = getDataBase().getUserName();
		String name = getDataBase().getName();

		// 1.查询表和字段描述信息
		String tcSql = ToolSqlXml.getSqlMy("platform.oracle.getTableComments");
		String tableDesc = Db.use(name).findFirst(tcSql, dbUser, tableName).getStr("COMMENTS");

		// 2.查询表字段信息
		String ccSql = ToolSqlXml.getSqlMy("platform.oracle.getColumnComments");
		List<Record> listColumnComments = Db.use(name).find(ccSql, dbUser, tableName, tableName);

		// 3.查询表字段对应的所有java数据类型
		Map<String, String> columnJavaTypeMap = getJavaType(tableName);
		
		List<ColumnDto> list = new ArrayList<ColumnDto>();

		// 4.循环合并表字段详细信息
		for (Record record : listColumnComments) {
			String column_name = record.getStr("COLUMN_NAME").toLowerCase();
			String column_type = record.getStr("DATA_TYPE").toLowerCase();
			String column_length = String.valueOf(record.getNumber("DATA_LENGTH"));
			String comments = record.getStr("COMMENTS");
			
			// 需要跳过的字段
			if("xxx".equals(column_name) || "yyy".equals(column_name) || "zzz".equals(column_name)){
				continue;
			}
			
			ColumnDto table = new ColumnDto();
			table.setTable_name(tableName);
			table.setTable_desc(tableDesc);
			
			table.setColumn_name(column_name);
			table.setColumn_name_upperCaseFirstOne(ToolString.toUpperCaseFirstOne(column_name));
			
			table.setColumn_type(column_type);
			table.setColumn_length(column_length);
			table.setColumn_desc(comments);

			table.setColumn_className(columnJavaTypeMap.get(column_name.toLowerCase()));
			
			list.add(table);
		}
		
		return list;
	}

}
