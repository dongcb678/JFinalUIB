package com.platform.tools.code.run;

import java.util.List;

import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.platform.constant.ConstantInit;
import com.platform.run.ConfigCore;
import com.platform.tools.ToolString;
import com.platform.tools.code.handler.BaseHandler;
import com.platform.tools.code.handler.DB2Handler;
import com.platform.tools.code.handler.MySQLHandler;
import com.platform.tools.code.handler.OracleHandler;
import com.platform.tools.code.handler.PostgreSQLHandler;
import com.platform.tools.code.handler.SqlServerHandler;

/**
 * 简易辅助开发代码生成器
 * 
 * 描述：根据表，生成对应的.sql.xml文件、Model类、Service类、validator类、Controller类，
 * 不包含业务处理逻辑，考虑到开发的业务个性化，通用的生成意义不是太大，只做辅助开发
 * 
 * @author 董华健
 */
public class GenerateCode {

	private static final Log log = Log.getLog(GenerateCode.class);

	/**
	 * 二维数组说明：
	 * 数据源（默认可以是null）、 表名、主键名（默认可以是null）、类名（不包含后缀.java）
	 */
	public static String[][] tableArr = {
		//{"数据源名称", "表名称", "主键列名称", "生成类名称"}
//		{"ConstantInit.db_dataSource_main", "test_blog", "ids", "Blog"}
		{null, "test_blog", null, "Blog"}

//		{null, "pt_department", null, "Department"},
//		{null, "pt_dict", null, "Dict"},
//		{null, "pt_group", null, "Group"},
//		{null, "pt_menu", null, "Menu"},
//		{null, "pt_module", null, "Module"},
//		{null, "pt_operator", null, "Operator"},
//		{null, "pt_param", null, "Param"},
//		{null, "pt_role", null, "Role"},
//		{null, "pt_station", null, "Station"},
//		{null, "pt_systems", null, "Systems"},
//		{null, "pt_upload", null, "Upload"},
//		{null, "pt_syslog", null, "SysLog"},
//		{null, "pt_resources", null, "Resources"},
//		{null, "pt_user", null, "User"},
//		{null, "pt_userinfo", null, "UserInfo"},
		
//		{null, "pt_usergroup", null, "UserGroup"},
//		{null, "pt_grouprole", null, "GroupRole"},
//		{null, "pt_userstation", null, "UserStation"},
//		{null, "pt_roleoperator", null, "RoleOperator"},
//		{null, "pt_stationoperator", null, "StationOperator"}
	};
	
	/**
	 * 生成的包和类所在的源码根目录，比如src或者是weiXin
	 */
	public static final String srcFolder = "src";

	/**
	 * 生成的文件存放的包，公共基础包
	 * 描述：比如platform所在的包就是com.platform，test所在的包就是com.test
	 */
	public static final String packageBase = "com.test.mvc";

	/**
	 * controller基础路径，例如
	 * @Controller("/platform/authImg") 中的platform
	 * @Controller("/test/blog") 中的test
	 * 
	 * render基础路径，例如
	 * /platform/user/add.jsp 中的 platform
	 * /test/blog/list.jsp 中的 test
	 */
	public static final String basePath = "test";

	/**
	 * 循环生成文件
	 */
	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		log.info("启动ConfigCore start ......");
    	ConfigCore.getSingleton();
    	log.info("启动ConfigCore end ......");
    	
		log.info("根据不同的数据库加载不同的处理器");
    	BaseHandler handler = null;
    	String db_type = PropKit.get(ConstantInit.db_type_key);
		if(db_type.equals(ConstantInit.db_type_postgresql)){
			handler = new PostgreSQLHandler();
			
		}else if(db_type.equals(ConstantInit.db_type_mysql)){
			handler = new MySQLHandler();
			
		}else if(db_type.equals(ConstantInit.db_type_oracle)){
			handler = new OracleHandler();
			
		}else if(db_type.equals(ConstantInit.db_type_db2)){
			handler = new DB2Handler();
			
		}else if(db_type.equals(ConstantInit.db_type_sqlserver)){
			handler = new SqlServerHandler();
		}
    	
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

			List<ColumnDto> colunmList = handler.getColunm(tableName);
			
			// 1.生成sql文件
			handler.sql(classNameSmall, tableName); 
			
			// 2.生成model
			handler.model(className, classNameSmall, dataSource, tableName, pkName, colunmList); 
			
			// 3.生成validator
			handler.validator(className, classNameSmall); 
			
			// 4.生成controller
			handler.controller(className, classNameSmall, tableName); 
			
			// 5.生成service
			handler.service(className, classNameSmall); 

			// 6.生成DTO，还没有处理数据库字段类型到java数据类型的对应转换
			//handler.dto(className, classNameSmall, dataSource, tableName, colunmList); 
			
			// 7.生成视图文件
			//handler.list(classNameSmall, colunmList);
			//handler.add(classNameSmall, colunmList);
			//handler.update(classNameSmall, colunmList);
			//handler.form(classNameSmall, colunmList);
			//handler.view(classNameSmall, colunmList);
		}
		
		System.exit(0);
	}

}

