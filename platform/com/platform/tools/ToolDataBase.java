package com.platform.tools;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.platform.config.ConfigCore;
import com.platform.constant.ConstantInit;
import com.platform.dto.DataBase;

/**
 * 数据库导入导出处理
 * @author 董华健
 */
public abstract class ToolDataBase {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolDataBase.class);

	private static final Map<String, DataBase> dbMap = new HashMap<String, DataBase>();
	
	/**
	 * 获取所有数据源配置对象
	 * @return
	 */
	public static Map<String, DataBase> getDbMap(){
		if(dbMap.isEmpty()){
			synchronized (ConfigCore.class) {
				if(dbMap.isEmpty()){
					parseDbInfo();
				}
			}
		}
		return dbMap;
	}

	/**
	 * 获取指定数据源对象
	 * @param name
	 * @return
	 */
	public static DataBase getDbMap(String name){
		if(dbMap.isEmpty()){
			parseDbInfo();
		}
		return dbMap.get(name);
	}
	
	/**
	 * 分解数据库连接url
	 * @return
	 */
	private static void parseDbInfo(){
		String driverClass = null;
		String jdbcUrl = null;
		String userName = null;
		String passWord = null;
		String ip = null;
		String port = null;
		String dbName = null;

		String db_start = "db[";
		String db_end = "]";
		String prefix = null;
		
		DataBase db = null;
		
		int count = PropKit.getInt(ConstantInit.db_count_key);

		for (int i = 1; i <= count; i++) {
			prefix = db_start + i + db_end + ".";
			
			// 数据源名称
			String name = PropKit.get(prefix + ConstantInit.db_name_key);
			
			// 判断数据库类型
			String db_type = PropKit.get(prefix + ConstantInit.db_type_key);
			if(db_type.equals(ConstantInit.db_type_postgresql)){ // pg 数据库连接信息
				driverClass = PropKit.get(prefix + ConstantInit.db_connection_postgresql_driverClass);
				jdbcUrl = PropKit.get(prefix + ConstantInit.db_connection_postgresql_jdbcUrl);
				userName = PropKit.get(prefix + ConstantInit.db_connection_postgresql_userName);
				passWord = PropKit.get(prefix + ConstantInit.db_connection_postgresql_passWord);
				
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
				driverClass = PropKit.get(prefix + ConstantInit.db_connection_mysql_driverClass);
				jdbcUrl = PropKit.get(prefix + ConstantInit.db_connection_mysql_jdbcUrl);
				userName = PropKit.get(prefix + ConstantInit.db_connection_mysql_userName);
				passWord = PropKit.get(prefix + ConstantInit.db_connection_mysql_passWord);
				
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
				driverClass = PropKit.get(prefix + ConstantInit.db_connection_oracle_driverClass);
				jdbcUrl = PropKit.get(prefix + ConstantInit.db_connection_oracle_jdbcUrl);
				userName = PropKit.get(prefix + ConstantInit.db_connection_oracle_userName);
				passWord = PropKit.get(prefix + ConstantInit.db_connection_oracle_passWord);
				
				// 解析数据库连接URL，获取数据库名称
				String[] prop = jdbcUrl.substring(jdbcUrl.indexOf("@") + 1).split(":");
				dbName = prop[2];

				// 解析数据库连接URL，获取数据库地址IP
				ip = prop[0];

				// 解析数据库连接URL，获取数据库地址端口
				port = prop[1];
				
			}else if(db_type.equals(ConstantInit.db_type_sqlserver)){ // sqlserver 数据库连接信息
				driverClass = PropKit.get(prefix + ConstantInit.db_connection_sqlserver_driverClass);
				jdbcUrl = PropKit.get(prefix + ConstantInit.db_connection_sqlserver_jdbcUrl);
				userName = PropKit.get(prefix + ConstantInit.db_connection_sqlserver_userName);
				passWord = PropKit.get(prefix + ConstantInit.db_connection_sqlserver_passWord);
				
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
				driverClass = PropKit.get(prefix + ConstantInit.db_connection_db2_driverClass);
				jdbcUrl = PropKit.get(prefix + ConstantInit.db_connection_db2_jdbcUrl);
				userName = PropKit.get(prefix + ConstantInit.db_connection_db2_userName);
				passWord = PropKit.get(prefix + ConstantInit.db_connection_db2_passWord);
				
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
			db = new DataBase();
			
			db.setName(name);
			
			db.setType(db_type);
			
			db.setDriverClass(driverClass);
			db.setJdbcUrl(jdbcUrl);
			db.setUserName(userName);
			
			// passWord = ConfigTools.decrypt(publicKey, passWord); // druid 密码解密
			db.setPassWord(passWord);
			
			db.setIp(ip);
			db.setPort(port);
			db.setDbName(dbName);
			
			db.setInitialSize(PropKit.getInt(prefix + ConstantInit.db_initialSize));
			db.setMinIdle(PropKit.getInt(prefix + ConstantInit.db_minIdle));
			db.setMaxActive(PropKit.getInt(prefix + ConstantInit.db_maxActive));
			
			dbMap.put(name, db);
		}
	}
	
	/**
	 * 数据库导出
	 * @param dbName		数据源名称
	 * @throws IOException
	 */
	public static void dbBackup(String name) throws IOException {
		DataBase db = getDbMap(name);
		String username = db.getUserName();
		String password = db.getPassWord();
		String ip = db.getIp();
		String port = db.getPort();
		String database = db.getDbName();
		String type = db.getType();
		
		boolean isWin = System.getProperty("os.name").toLowerCase().startsWith("win"); // 操作系统类型
		
		StringBuilder command = new StringBuilder();
		command.append(PathKit.getWebRootPath()).append(File.separator)
			.append("WEB-INF").append(File.separator)
			.append("files").append(File.separator)
			.append("db");
		
		String storePath = command.toString() + File.separator + "backup";
		String storeName = ToolDateTime.format(new Date(), "yyyyMMdd_HHmmss_SSS") + "_" + database + ".backup";
		
		if(type.equals(ConstantInit.db_type_postgresql)){ // pg
//			pg_dump --host 127.0.0.1 --port 5432 --username "postgres" --role "postgres" --no-password  --format custom --blobs --encoding UTF8 --verbose --file "D:/jfinaluibv4.backup" "jfinaluibv4"
//			command.append(PathKit.getWebRootPath()).append("/WEB-INF/database/pg/bin/pg_dump ");
//			command.append(" --host ").append(ip).append(" --port ").append(port).append(" --username ").append(" \"postgres\" ");
//			command.append(" --role \"postgres\" --no-password  --format custom --blobs --encoding UTF8 --verbose --file ").append(exportPath).append(" \"").append(database).append("\" ");
			
			command.append(File.separator).append("script").append(File.separator).append("pg");
			String cliPath = command.toString();
			
			if(isWin){ // windows
				command.append(File.separator).append("pg-win.bat")
				.append(" ").append(cliPath)//1-cli路径
				.append(" ").append(username)//2
				.append(" ").append(password)//3
				.append(" ").append(ip)//4
				.append(" ").append(port)//5
				.append(" ").append(database)//6
				.append(" ").append("\"").append(storePath).append("\"")//7
				.append(" ").append(storeName);//8
				
			} else { // linux
				command.append("sh").append(" ")
				.append(cliPath).append(File.separator).append("pg-linux.sh")
				.append(" ").append(storePath)//1-备份文件路径
				.append(" ").append(username)//2
				.append(" ").append(password)//3
				.append(" ").append(ip)//4
				.append(" ").append(port)//5
				.append(" ").append(database)//6
				.append(" ").append(storeName);//7
			}
			
			try {
				Process process = Runtime.getRuntime().exec(command.toString());
				process.waitFor();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
		}else if(type.equals(ConstantInit.db_type_mysql)){ // mysql
			command.append("cmd /c mysqldump -u").append(username).append(" -p").append(password)//密码是用的小p，而端口是用的大P。  
					.append(" -h").append(ip).append(" -P").append(port).append(" ").append(database).append(" -r \"").append(storePath+"\"");
			
			try {
				Process process = Runtime.getRuntime().exec(command.toString(), null, new File(storePath));
				process.waitFor();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		} else if(type.equals(ConstantInit.db_type_oracle)){ // oracle
			
		} else if(type.equals(ConstantInit.db_type_sqlserver)){ // sqlServer
			
		} else if(type.equals(ConstantInit.db_type_db2)){ // db2
			
		}
	}
	
	/**
	 * 数据库导入
	 * @param dbName
	 * @param filePath
	 * @throws IOException
	 */
	public static void importSql(String name, String filePath) throws IOException {
		DataBase db = getDbMap(name);
		String username = db.getUserName();
		String password = db.getPassWord();
		String ip = db.getIp();
		String port = db.getPort();
		String database = db.getDbName();
		String type = db.getType();

		boolean isWin = System.getProperty("os.name").toLowerCase().startsWith("win"); // 操作系统类型
		
		if(type.equals(ConstantInit.db_type_postgresql)){ // pg
//			/usr/bin/pg_restore --host 127.0.0.1 --port 5432 --username 'postgres' --dbname 'jfinaluibv4' --no-password '/var/lib/pgsql/bdom.backup'

			if(isWin){ // windows
				
			} else { // linux
				
			}
			
		}else if(type.equals(ConstantInit.db_type_mysql)){ // mysql
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
			
		} else if(type.equals(ConstantInit.db_type_oracle)){ // oracle
			
		} else if(type.equals(ConstantInit.db_type_sqlserver)){ // sqlServer
			
		} else if(type.equals(ConstantInit.db_type_db2)){ // db2
			
		}
	}
	
}
