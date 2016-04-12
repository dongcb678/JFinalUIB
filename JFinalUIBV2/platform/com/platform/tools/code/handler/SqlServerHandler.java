package com.platform.tools.code.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.config.run.ConfigCore;
import com.platform.constant.ConstantInit;
import com.platform.tools.ToolSqlXml;
import com.platform.tools.ToolString;
import com.platform.tools.code.run.ColumnDto;

/**
 * 定制SqlServer下的代码生成
 * @author 董华健
 */
public class SqlServerHandler extends BaseHandler {

	private static Logger log = Logger.getLogger(SqlServerHandler.class);

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
		List<ColumnDto> list = new ArrayList<ColumnDto>();

		String tableDesc = Db.use(ConstantInit.db_dataSource_main).findFirst(ToolSqlXml.getSql("platform.sqlserver.getTables"), tableName).getStr("value");
		List<Record> listColumn = Db.use(ConstantInit.db_dataSource_main).find(ToolSqlXml.getSql("platform.sqlserver.getColumns"), tableName);
		
		Map<String, String> columnJavaTypeMap = getJavaType(tableName);
				
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
