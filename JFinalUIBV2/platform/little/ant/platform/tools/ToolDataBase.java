package little.ant.platform.tools;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

import com.jfinal.kit.PathKit;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.plugin.PropertiesPlugin;

/**
 * 数据库导入导出处理
 * @author 董华健
 */
public abstract class ToolDataBase {
	
	/**
	 * 数据库导出
	 * @param exportPath
	 * @throws IOException
	 */
	public static void exportSql(String exportPath) throws IOException {
		String db_type = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_type_key);
		
		String username = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_userName);
		String password = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_passWord);
		String ip = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_ip);
		String port = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_port);
		String database = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_dbName);
		
		StringBuilder command = new StringBuilder();
		
		if(db_type.equals(ConstantInit.db_type_postgresql)){ // pg
			// pg_dump --host 127.0.0.1 --port 5432 --username "postgres" --role "postgres" --no-password  --format custom --blobs --encoding UTF8 --verbose --file "D:/jfinaluibv2.backup" "jfinaluibv2"
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
		String username = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_userName);
		String password = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_passWord);
		String ip = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_ip);
		String port = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_port);
		String database = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_connection_dbName);
		
		String db_type = (String) PropertiesPlugin.getParamMapValue(ConstantInit.db_type_key);
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
