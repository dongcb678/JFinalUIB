package com.platform.tools.code.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.platform.constant.ConstantInit;
import com.platform.dto.DataBase;
import com.platform.tools.ToolDataBase;
import com.platform.tools.ToolSqlXml;
import com.platform.tools.ToolString;
import com.platform.tools.code.run.ColumnDto;

/**
 * 定制MySQL下的代码生成
 * @author 董华健
 */
public class MySQLHandler extends BaseHandler {

	private static Logger log = Logger.getLogger(MySQLHandler.class);

	public MySQLHandler() {
    	String db_type = PropKit.get(ConstantInit.db_type_key);
		log.info("db_type = " + db_type);
		if(!db_type.equals(ConstantInit.db_type_mysql)){
			throw new RuntimeException("请设置init.properties配置文件db.type = mysql");
		}
    	
		log.info("configPlugin 配置Druid数据库连接池连接属性");
		DataBase db = ToolDataBase.getDbInfo();
		String username = db.getUserName();
		String password = db.getPassWord();
		String jdbcUrl = db.getJdbcUrl();
		String dbName = ToolDataBase.getDbInfo().getDbName();
		jdbcUrl = jdbcUrl.replace(dbName, "information_schema");
		DruidPlugin druidPluginIS = new DruidPlugin(jdbcUrl, username, password, "com.mysql.jdbc.Driver");
		druidPluginIS.start();
		
		log.info("configPlugin 配置ActiveRecord插件");
		ActiveRecordPlugin arpIS = new ActiveRecordPlugin("information_schema", druidPluginIS);
		arpIS.setDevMode(true); // 设置开发模式
		arpIS.setShowSql(true); // 是否显示SQL
		arpIS.setContainerFactory(new CaseInsensitiveContainerFactory(true));// 大小写不敏感
		arpIS.setDialect(new MysqlDialect());
		arpIS.start();
	}
	
	@Override
	public List<ColumnDto> getColunm(String tableName)  {
		String dbName = ToolDataBase.getDbInfo().getDbName();

		// 1.查询表和字段描述信息
		String tSql = ToolSqlXml.getSql("platform.mysql.getTables");
		String tableDesc = Db.use("information_schema").findFirst(tSql, dbName, tableName).getStr("table_COMMENT");

		// 2.查询表字段信息
		String cSql = ToolSqlXml.getSql("platform.mysql.getColumns");
		List<Record> listColumn = Db.use("information_schema").find(cSql, dbName, tableName);

		// 3.查询表字段对应的所有java数据类型
		Map<String, String> columnJavaTypeMap = getJavaType(tableName);
		
		List<ColumnDto> list = new ArrayList<ColumnDto>();

		// 4.循环合并表字段详细信息
		for (Record record : listColumn) {
			String column_name = record.getStr("column_name");
			String column_type = record.getStr("column_type");
			String character_maximum_length = String.valueOf(record.getNumber("CHARACTER_MAXIMUM_LENGTH"));
			String column_comment = record.getStr("COLUMN_COMMENT");

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
