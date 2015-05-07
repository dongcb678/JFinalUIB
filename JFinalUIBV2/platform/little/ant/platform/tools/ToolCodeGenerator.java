package little.ant.platform.tools;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.beetl.core.BeetlKit;

/**
 * 简易辅助开发代码生成器
 * 
 * 描述：根据表，生成对应的.sql.xml文件、Model类、Service类、validator类、Controller类，
 * 不包含业务处理逻辑，考虑到开发的业务个性化，通用的生成意义不是太大，只做辅助开发
 * 
 * @author 董华健
 */
public class ToolCodeGenerator {

	/**
	 * 二维数组说明：表名、数据源、是否生成Controller相关、类名（不包含.java）
	 */
	public static String[][] tableArr = {
//			{"wx_aa", "DictKeys.db_dataSource_main", "0", "Aa"}, // 生成.sql.xml文件、Model类、Service类、validator类、Controller类
//			{"wx_bb", "DictKeys.db_dataSource_main", "0", "Bb"},
//			{"wx_cc", "DictKeys.db_dataSource_main", "1", "Cc"} // 生成.sql.xml文件、Model类
			
			{"blog_article", "DictKeys.db_dataSource_main", "0", "Article"},
			{"blog_articlecomment", "DictKeys.db_dataSource_main", "0", "ArticleComment"},
			{"blog_circle", "DictKeys.db_dataSource_main", "0", "Circle"},
			{"blog_circleuser", "DictKeys.db_dataSource_main", "0", "Circleuser"},
			{"blog_favorite", "DictKeys.db_dataSource_main", "0", "Favorite"},
			{"blog_inform", "DictKeys.db_dataSource_main", "0", "Inform"},
			{"blog_link", "DictKeys.db_dataSource_main", "0", "Link"},
			{"blog_message", "DictKeys.db_dataSource_main", "0", "Message"},
			{"blog_move", "DictKeys.db_dataSource_main", "0", "Move"},
			{"blog_movecomment", "DictKeys.db_dataSource_main", "0", "MoveComment"},
			{"blog_newsdeliver", "DictKeys.db_dataSource_main", "0", "NewsDeliver"},
			{"blog_praise", "DictKeys.db_dataSource_main", "0", "Praise"},
			{"blog_trample", "DictKeys.db_dataSource_main", "0", "Trample"},
			{"blog_type", "DictKeys.db_dataSource_main", "0", "Type"},
			
//			{"cms_announcement", "DictKeys.db_dataSource_main", "0", "Announcement"},
//			{"cms_answers", "DictKeys.db_dataSource_main", "0", "Answers"},
//			{"cms_column", "DictKeys.db_dataSource_main", "0", "Column"},
//			{"cms_comment", "DictKeys.db_dataSource_main", "0", "Comment"},
//			{"cms_content", "DictKeys.db_dataSource_main", "0", "Content"},
//			{"cms_download", "DictKeys.db_dataSource_main", "0", "Download"},
//			{"cms_job", "DictKeys.db_dataSource_main", "0", "Job"},
//			{"cms_library", "DictKeys.db_dataSource_main", "0", "Library"},
//			{"cms_photogallery", "DictKeys.db_dataSource_main", "0", "Photogallery"},
//			{"cms_photogalleryitem", "DictKeys.db_dataSource_main", "0", "PhotogalleryItem"},
//			{"cms_questions", "DictKeys.db_dataSource_main", "0", "Questions"},
//			{"cms_template", "DictKeys.db_dataSource_main", "0", "Template"},
//			{"cms_vote", "DictKeys.db_dataSource_main", "0", "Vote"},
//			{"cms_voteitem", "DictKeys.db_dataSource_main", "0", "VoteItem"},
//			{"cms_yellowpage", "DictKeys.db_dataSource_main", "0", "YellowPage"},
			
//			{"common_accessstatistics", "DictKeys.db_dataSource_main", "0", "AccessStatistics"},
//			{"common_ad", "DictKeys.db_dataSource_main", "0", "Ad"},
//			{"common_ipblacklist", "DictKeys.db_dataSource_main", "0", "IpBlacklist"},
//			{"common_link", "DictKeys.db_dataSource_main", "0", "Link"},
//			{"common_location", "DictKeys.db_dataSource_main", "0", "Location"},
//			{"common_sensitiveword", "DictKeys.db_dataSource_main", "0", "SensitiveWord"}
			
		};
	
	/**
	 * 生成的包和类所在的源码根目录，比如src或者是weiXin
	 */
	public static String srcFolder = "src";

	/**
	 * 生成的文件存放的包，公共基础包
	 * 描述：比如
	 * 	platform所在的包就是little.ant.platform
	 * 	weixin所在的包就是little.ant.weixin
	 */
	public static String packageBase = "little.ant.blog";
	
	/**
	 * controller基础路径，例如
	 * @Controller(controllerKey = "/jf/platform/authImg") 中的platform
	 * @Controller(controllerKey = "/jf/wx/authImg") 中的wx
	 */
	public static String controllerBasePath = "blog";

	/**
	 * render基础路径，例如
	 * /platform/user/add.jsp 中的platform
	 * /weiXin/user/list.jsp 中的weiXin
	 */
	public static String renderBasePath = "blog";

	/**
	 * 循环生成文件
	 */
	public static void main(String[] args) {
		try {
			for (int i = 0; i < tableArr.length; i++) {
				// 表名
				String tableName = tableArr[i][0]; 
				// 数据源名称
				String dataSource = tableArr[i][1]; 
				// 是否生成Controller相关
				String generController = tableArr[i][2]; 
				// 类名
				String className = tableArr[i][3]; 
				// 类名首字母小写
				String classNameSmall = ToolString.toLowerCaseFirstOne(className); 
				
				// 1.生成sql文件
				sql(classNameSmall, tableName); 
				// 2.生成model
				model(className, classNameSmall, dataSource, tableName); 
				
				// 是否生成Controller相关
				if(generController.equals("0")){
					// 3.生成validator
					validator(className, classNameSmall); 
					// 4.生成controller
					controller(className, classNameSmall); 
					// 5.生成service
					service(className, classNameSmall); 
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.exit(0);
		}
	}

	/**
	 * 生成Model
	 * @param srcFolder
	 * @param packageBase
	 * @param className
	 * @param classNameSmall
	 * @param tableName
	 */
	public static void model(String className, String classNameSmall, String dataSource, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".model";
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("dataSource", dataSource);
		paraMap.put("tableName", tableName);

		paraMap.put("colunmList", getColunmByPg(tableName));
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className +".java";
		createFileByTemplete("model.html", paraMap, filePath);
	}

	/**
	 * 生成.sql.xml
	 * @param srcFolder
	 * @param packageBase
	 * @param classNameSmall
	 */
	public static void sql(String classNameSmall, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".model";
		paraMap.put("namespace", controllerBasePath + "." + classNameSmall);
		paraMap.put("tableName", tableName);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + classNameSmall + ".sql.xml";
		createFileByTemplete("sql.html", paraMap, filePath);
	}

	/**
	 * 生成Controller
	 * @param srcFolder
	 * @param packageBase
	 * @param className
	 * @param classNameSmall
	 */
	public static void controller(String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".controller";
		paraMap.put("basePackage", packageBase);
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("controllerBasePath", controllerBasePath);
		paraMap.put("renderBasePath", renderBasePath);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Controller.java";
		createFileByTemplete("controller.html", paraMap, filePath);
	}

	/**
	 * 生成validator
	 * @param srcFolder
	 * @param packageBase
	 * @param className
	 * @param classNameSmall
	 */
	public static void validator(String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".validator";
		paraMap.put("basePackage", packageBase);
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("controllerBasePath", controllerBasePath);
		paraMap.put("renderBasePath", renderBasePath);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Validator.java";
		createFileByTemplete("validator.html", paraMap, filePath);
	}
	
	/**
	 * 生成Service
	 * @param srcFolder
	 * @param packageBase
	 * @param className
	 * @param classNameSmall
	 */
	public static void service(String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".service";
		paraMap.put("basePackage", packageBase);
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("namespace", srcFolder + "." + classNameSmall);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Service.java";
		createFileByTemplete("service.html", paraMap, filePath);
	}

	/**
	 * 根据具体模板生成文件
	 * @param templateFileName
	 * @param paraMap
	 * @param filePath
	 */
	public static void createFileByTemplete(String templateFileName, Map<String, Object> paraMap, String filePath)  {
		try {
			Class<?> classes = Class.forName("little.ant.platform.tools.ToolCodeGenerator");

			InputStream controllerInputStream = classes.getResourceAsStream(templateFileName);
			int count = 0;
			while (count == 0) {
				count = controllerInputStream.available();
			}
			
			byte[] bytes = new byte[count];
			int readCount = 0; // 已经成功读取的字节的个数
			while (readCount < count) {
				readCount += controllerInputStream.read(bytes, readCount, count - readCount);
			}
			
			String template = new String(bytes);
			
			String javaSrc = BeetlKit.render(template, paraMap);
			
			File file = new File(filePath);
			BufferedWriter output = new BufferedWriter(new FileWriter(file));   
			output.write(javaSrc);   
			output.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static List<String> getColunmByPg(String tableName){
		try {
			Class.forName("org.postgresql.Driver");
		} catch (java.lang.ClassNotFoundException e) {
			System.out.print("Class not found exception occur. Message is:");
			System.out.print(e.getMessage());
		}
		
		String url = "jdbc:postgresql://127.0.0.1:5432/jfinaluibv2";
		String user = "postgres";
		String pass = "678789";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<String> list = new ArrayList<String>();
		
		try {
			conn = DriverManager.getConnection(url, user, pass);
			stmt = (Statement) conn.createStatement();

			rs = (ResultSet) stmt.executeQuery("select column_name from information_schema.columns where table_name = '"+tableName+"'");
			while (rs.next()) {
				String column_name = rs.getString("column_name");
				list.add(column_name);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return list;
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	private static List<String> getColunmByMysql(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (java.lang.ClassNotFoundException e) {
			System.out.print("Class not found exception occur. Message is:");
			System.out.print(e.getMessage());
		}
		
		String url = "jdbc:mysql://127.0.0.1:3306/jfinaluibv2?characterEncoding=UTF-8";
		String user = "root";
		String pass = "678789";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<String> list = new ArrayList<String>();
		
		try {
			conn = DriverManager.getConnection(url, user, pass);
			stmt = (Statement) conn.createStatement();

			rs = (ResultSet) stmt.executeQuery("desc ?");
			while (rs.next()) {
				String column_name = rs.getString("Field");
				list.add(column_name);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return list;
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	private static List<String> getColunmByOracle(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (java.lang.ClassNotFoundException e) {
			System.out.print("Class not found exception occur. Message is:");
			System.out.print(e.getMessage());
		}
		
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String user = "scott";
		String pass = "678789";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<String> list = new ArrayList<String>();
		
		try {
			conn = DriverManager.getConnection(url, user, pass);
			stmt = (Statement) conn.createStatement();

			rs = (ResultSet) stmt.executeQuery("select * from user_col_comments where xxx = ?");
			while (rs.next()) {
				String column_name = rs.getString("Field");
				list.add(column_name);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return list;
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
}

