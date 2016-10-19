package com.platform.tools.code.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.constant.ConstantInit;
import com.platform.run.ConfigCore;
import com.platform.tools.ToolSqlXml;
import com.platform.tools.ToolString;
import com.platform.tools.code.run.ColumnDto;

/**
 * 定制SqlServer下的代码生成
 * @author 董华健
 */
public class SqlServerHandler extends BaseHandler {

	private static final Log log = Log.getLog(SqlServerHandler.class);

	public SqlServerHandler() {
		log.info("启动ConfigCore start ......");
    	ConfigCore.getSingleton();
    	log.info("启动ConfigCore end ......");

    	String db_type = PropKit.get(ConstantInit.db_type_key);
		log.info("db_type = " + db_type);
		if(!db_type.equals(ConstantInit.db_type_sqlserver)){
			throw new RuntimeException("请设置init.properties配置文件db.type = sqlserver");
		}
	}
	
	@Override
	public List<ColumnDto> getColunm(String tableName)  {
		// 1.查询表和字段描述信息
		String tSql = ToolSqlXml.getSql("platform.sqlserver.getTables");
		String tableDesc = Db.use(ConstantInit.db_dataSource_main).findFirst(tSql, tableName).getStr("value");

		// 2.查询表字段信息
		String cSql = ToolSqlXml.getSql("platform.sqlserver.getColumns");
		List<Record> listColumn = Db.use(ConstantInit.db_dataSource_main).find(cSql, tableName);

		// 3.查询表字段对应的所有java数据类型
		Map<String, String> columnJavaTypeMap = getJavaType(tableName);

		List<ColumnDto> list = new ArrayList<ColumnDto>();

		// 4.循环合并表字段详细信息
		for (Record record : listColumn) {
			String column_name = record.getStr("name");
			String column_type = record.getStr("type");
			String character_maximum_length = String.valueOf(record.getNumber("length"));
			String column_comment = record.getStr("remarks");

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
			table.setColumn_length(character_maximum_length);
			table.setColumn_desc(column_comment);
			
			table.setColumn_className(columnJavaTypeMap.get(column_name.toLowerCase()));
			
			list.add(table);
		}
		
		return list;
	}

}
