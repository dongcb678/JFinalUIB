package com.platform.tools;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.platform.constant.ConstantInit;
import com.platform.dto.DataBase;

/**
 * 数据库导入导出处理
 * @author 董华健
 */
public abstract class ToolDataBase {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolDataBase.class);

	/**
	 * 分解数据库连接url
	 * @return
	 */
	public static DataBase getDbInfo(){
		String driverClass = null;
		String jdbcUrl = null;
		String userName = null;
		String passWord = null;
		String ip = null;
		String port = null;
		String dbName = null;
		
		// 判断数据库类型
		String db_type = PropKit.get(ConstantInit.db_type_key);
		if(db_type.equals(ConstantInit.db_type_postgresql)){ // pg 数据库连接信息
			driverClass = PropKit.get(ConstantInit.db_connection_postgresql_driverClass);
			jdbcUrl = PropKit.get(ConstantInit.db_connection_postgresql_jdbcUrl);
			userName = PropKit.get(ConstantInit.db_connection_postgresql_userName);
			passWord = PropKit.get(ConstantInit.db_connection_postgresql_passWord);
			
			// 解析数据库连接URL，获取数据库名称
			dbName = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			dbName = dbName.substring(dbName.indexOf("/") + 1);

			// 解析数据库连接URL，获取数据库地址IP
			ip = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			ip = ip.substring(0, ip.indexOf(":"));

			// 解析数据库连接URL，获取数据库地址端口
			port = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			port = port.substring(port.indexOf(":") + 1, port.indexOf("/"));
			
		}else if(db_type.equals(ConstantInit.db_type_mysql)){ // mysql 数据库连接信息
			driverClass = PropKit.get(ConstantInit.db_connection_mysql_driverClass);
			jdbcUrl = PropKit.get(ConstantInit.db_connection_mysql_jdbcUrl);
			userName = PropKit.get(ConstantInit.db_connection_mysql_userName);
			passWord = PropKit.get(ConstantInit.db_connection_mysql_passWord);
			
			// 解析数据库连接URL，获取数据库名称
			dbName = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			dbName = dbName.substring(dbName.indexOf("/") + 1, dbName.indexOf("?"));

			// 解析数据库连接URL，获取数据库地址IP
			ip = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			ip = ip.substring(0, ip.indexOf(":"));

			// 解析数据库连接URL，获取数据库地址端口
			port = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			port = port.substring(port.indexOf(":") + 1, port.indexOf("/"));
			
		}else if(db_type.equals(ConstantInit.db_type_oracle)){ // oracle 数据库连接信息
			driverClass = PropKit.get(ConstantInit.db_connection_oracle_driverClass);
			jdbcUrl = PropKit.get(ConstantInit.db_connection_oracle_jdbcUrl);
			userName = PropKit.get(ConstantInit.db_connection_oracle_userName);
			passWord = PropKit.get(ConstantInit.db_connection_oracle_passWord);
			
			// 解析数据库连接URL，获取数据库名称
			String[] prop = jdbcUrl.substring(jdbcUrl.indexOf("@") + 1).split(":");
			dbName = prop[2];

			// 解析数据库连接URL，获取数据库地址IP
			ip = prop[0];

			// 解析数据库连接URL，获取数据库地址端口
			port = prop[1];
			
		}else if(db_type.equals(ConstantInit.db_type_sqlserver)){ // sqlserver 数据库连接信息
			driverClass = PropKit.get(ConstantInit.db_connection_sqlserver_driverClass);
			jdbcUrl = PropKit.get(ConstantInit.db_connection_sqlserver_jdbcUrl);
			userName = PropKit.get(ConstantInit.db_connection_sqlserver_userName);
			passWord = PropKit.get(ConstantInit.db_connection_sqlserver_passWord);
			
			// 解析数据库连接URL，获取数据库名称
			dbName = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			dbName = dbName.substring(dbName.indexOf("/") + 1);

			// 解析数据库连接URL，获取数据库地址IP
			ip = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			ip = ip.substring(0, ip.indexOf(":"));

			// 解析数据库连接URL，获取数据库地址端口
			port = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			port = port.substring(port.indexOf(":") + 1, port.indexOf("/"));
			
		}else if(db_type.equals(ConstantInit.db_type_db2)){ // db2 数据库连接信息
			driverClass = PropKit.get(ConstantInit.db_connection_db2_driverClass);
			jdbcUrl = PropKit.get(ConstantInit.db_connection_db2_jdbcUrl);
			userName = PropKit.get(ConstantInit.db_connection_db2_userName);
			passWord = PropKit.get(ConstantInit.db_connection_db2_passWord);
			
			// 解析数据库连接URL，获取数据库名称
			dbName = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			dbName = dbName.substring(dbName.indexOf("/") + 1);

			// 解析数据库连接URL，获取数据库地址IP
			ip = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			ip = ip.substring(0, ip.indexOf(":"));

			// 解析数据库连接URL，获取数据库地址端口
			port = jdbcUrl.substring(jdbcUrl.indexOf("//") + 2);
			port = port.substring(port.indexOf(":") + 1, port.indexOf("/"));
		}
		
		// 把数据库连接信息写入常用map
		DataBase db = new DataBase();
		db.setDriverClass(driverClass);
		db.setJdbcUrl(jdbcUrl);
		db.setUserName(userName);
		db.setPassWord(passWord);
		
		db.setIp(ip);
		db.setPort(port);
		db.setDbName(dbName);
		
		return db;
	}
	
	/**
	 * 数据库导出
	 * @param exportPath
	 * @throws IOException
	 */
	public static void exportSql(String exportPath) throws IOException {
		DataBase db = getDbInfo();
		String username = db.getUserName();
		String password = db.getPassWord();
		String ip = db.getIp();
		String port = db.getPort();
		String database = db.getDbName();
		
		StringBuilder command = new StringBuilder();

		String db_type = PropKit.get(ConstantInit.db_type_key);
		if(db_type.equals(ConstantInit.db_type_postgresql)){ // pg
			// pg_dump --host 127.0.0.1 --port 5432 --username "postgres" --role "postgres" --no-password  --format custom --blobs --encoding UTF8 --verbose --file "D:/jfinaluibv3.backup" "jfinaluibv3"
			command.append(PathKit.getWebRootPath()).append("/WEB-INF/database/pg/bin/pg_dump ");
			command.append(" --host ").append(ip).append(" --port ").append(port).append(" --username ").append(" \"postgres\" ");
			command.append(" --role \"postgres\" --no-password  --format custom --blobs --encoding UTF8 --verbose --file ").append(exportPath).append(" \"").append(database).append("\" ");
			
		}else if(db_type.equals(ConstantInit.db_type_mysql)){ // mysql
			command.append("cmd /c mysqldump -u").append(username).append(" -p").append(password)//密码是用的小p，而端口是用的大P。  
					.append(" -h").append(ip).append(" -P").append(port).append(" ").append(database).append(" -r \"").append(exportPath+"\"");
			
		} else if(db_type.equals(ConstantInit.db_type_oracle)){ // oracle
			
		}
		
		try {
			Process process = Runtime.getRuntime().exec(command.toString(), null, new File(exportPath));
			process.waitFor();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 数据库导入
	 * @param filePath
	 * @throws IOException
	 */
	public static void importSql(String filePath) throws IOException {
		DataBase db = getDbInfo();
		String username = db.getUserName();
		String password = db.getPassWord();
		String ip = db.getIp();
		String port = db.getPort();
		String database = db.getDbName();
		
		String db_type = PropKit.get(ConstantInit.db_type_key);
		if(db_type.equals(ConstantInit.db_type_postgresql)){ // pg
			
			
			
		}else if(db_type.equals(ConstantInit.db_type_mysql)){ // mysql
			//第一步，获取登录命令语句  
			String loginCommand = new StringBuilder().append("mysql -u").append(username).append(" -p").append(password).append(" -h").append(ip).append(" -P").append(port).toString();
			//第二步，获取切换数据库到目标数据库的命令语句  
			String switchCommand = new StringBuilder("use ").append(database).toString();
			//第三步，获取导入的命令语句  
			String importCommand = new StringBuilder("source ").append(filePath).toString();
			//需要返回的命令语句数组  
			String[] commands = new String[] { loginCommand, switchCommand, importCommand };
			
			Runtime runtime = Runtime.getRuntime();
			Process process = runtime.exec(commands[0]);
			//执行了第一条命令以后已经登录到mysql了，所以之后就是利用mysql的命令窗口  
			//进程执行后面的代码  
			OutputStream os = process.getOutputStream();
			OutputStreamWriter writer = new OutputStreamWriter(os);
			//命令1和命令2要放在一起执行  
			writer.write(commands[1] + "\r\n" + commands[2]);
			writer.flush();
			writer.close();
			os.close();
			
		} else if(db_type.equals(ConstantInit.db_type_oracle)){ // oracle
			
			
		}
	}
	
}
