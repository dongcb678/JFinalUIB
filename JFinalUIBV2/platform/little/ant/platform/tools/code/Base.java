package little.ant.platform.tools.code;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;
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
public abstract class Base {

	/**
	 * 二维数组说明：表名、数据源、是否生成Controller相关、类名（不包含.java）
	 */
	public static String[][] tableArr = {
//			{"wx_aa", "DictKeys.db_dataSource_main", "0", "Aa"}, // 生成.sql.xml文件、Model类、Service类、validator类、Controller类
//			{"wx_bb", "DictKeys.db_dataSource_main", "0", "Bb"},
//			{"wx_cc", "DictKeys.db_dataSource_main", "1", "Cc"} // 生成.sql.xml文件、Model类
			
//			{"pt_department", "DictKeys.db_dataSource_main", "0", "Department"},
//			{"pt_dict", "DictKeys.db_dataSource_main", "0", "Dict"},
//			{"pt_group", "DictKeys.db_dataSource_main", "0", "Group"},
//			{"pt_menu", "DictKeys.db_dataSource_main", "0", "Menu"},
//			{"pt_module", "DictKeys.db_dataSource_main", "0", "Module"},
//			{"pt_operator", "DictKeys.db_dataSource_main", "0", "Operator"},
//			{"pt_param", "DictKeys.db_dataSource_main", "0", "Param"},
//			{"pt_resources", "DictKeys.db_dataSource_main", "0", "Resources"},
//			{"pt_role", "DictKeys.db_dataSource_main", "0", "Role"},
//			{"pt_station", "DictKeys.db_dataSource_main", "0", "Station"},
//			{"pt_syslog", "DictKeys.db_dataSource_main", "0", "Syslog"},
//			{"pt_systems", "DictKeys.db_dataSource_main", "0", "Systems"},
//			{"pt_upload", "DictKeys.db_dataSource_main", "0", "Upload"},
//			{"pt_user", "DictKeys.db_dataSource_main", "0", "User"},
//			{"pt_userinfo", "DictKeys.db_dataSource_main", "0", "UserInfo"}
		
//			{"blog_article", "DictKeys.db_dataSource_main", "0", "Article"},
//			{"blog_articlecomment", "DictKeys.db_dataSource_main", "0", "ArticleComment"},
//			{"blog_circle", "DictKeys.db_dataSource_main", "0", "Circle"},
//			{"blog_circleuser", "DictKeys.db_dataSource_main", "0", "Circleuser"},
//			{"blog_favorite", "DictKeys.db_dataSource_main", "0", "Favorite"},
//			{"blog_inform", "DictKeys.db_dataSource_main", "0", "Inform"},
//			{"blog_link", "DictKeys.db_dataSource_main", "0", "Link"},
//			{"blog_message", "DictKeys.db_dataSource_main", "0", "Message"},
//			{"blog_move", "DictKeys.db_dataSource_main", "0", "Move"},
//			{"blog_movecomment", "DictKeys.db_dataSource_main", "0", "MoveComment"},
//			{"blog_newsdeliver", "DictKeys.db_dataSource_main", "0", "NewsDeliver"},
//			{"blog_praise", "DictKeys.db_dataSource_main", "0", "Praise"},
//			{"blog_trample", "DictKeys.db_dataSource_main", "0", "Trample"},
//			{"blog_type", "DictKeys.db_dataSource_main", "0", "Type"},
			
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
	public static String packageBase = "little.ant.common.tourist";
	
	/**
	 * controller基础路径，例如
	 * @Controller(controllerKey = "/jf/platform/authImg") 中的platform
	 * @Controller(controllerKey = "/jf/wx/authImg") 中的wx
	 * 
	 * render基础路径，例如
	 * /platform/user/add.jsp 中的 platform
	 * /weiXin/user/list.jsp 中的 weiXin
	 */
	public static String basePath = "common/tourist";

	/**
	 * 获取表的所有字段名
	 * @param tableName
	 * @return
	 */
	public abstract List<ColumnDto> getColunm(String tableName);
	
	/**
	 * 获取表描述和字段的描述
	 * @param tableName
	 * @return
	 */
	public abstract List<String> getDesc(String tableName);
	
	/**
	 * 根据数据库表列类型得到对应java数据类型
	 * @param columnType
	 * @return
	 */
	public abstract String getJavaDataType(String columnType);
	
	/**
	 * 生成Model
	 * @param className
	 * @param classNameSmall
	 * @param dataSource
	 * @param tableName
	 */
	public void model(String className, String classNameSmall, String dataSource, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".model";
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("dataSource", dataSource);
		paraMap.put("tableName", tableName);
		paraMap.put("namespace", basePath + "." + classNameSmall);

		paraMap.put("colunmList", getColunm(tableName));
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className +".java";
		createFileByTemplete("model.html", paraMap, filePath);
	}

	/**
	 * 生成DTO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	 * @param base
	 * @param className
	 * @param classNameSmall
	 * @param dataSource
	 * @param tableName
	 */
	public void dto(Base base, String className, String classNameSmall, String dataSource, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".dto";
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("dataSource", dataSource);
		paraMap.put("tableName", tableName);

		paraMap.put("colunmList", getColunm(tableName));
		paraMap.put("base", base);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className +"Dto.java";
		createFileByTemplete("dto.html", paraMap, filePath);
	}

	/**
	 * 生成.sql.xml
	 * @param classNameSmall
	 * @param tableName
	 */
	public void sql(String classNameSmall, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".model";
		paraMap.put("namespace", basePath + "." + classNameSmall);
		paraMap.put("tableName", tableName);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + classNameSmall + ".sql.xml";
		createFileByTemplete("sql.html", paraMap, filePath);
	}

	/**
	 * 生成Controller
	 * @param className
	 * @param classNameSmall
	 */
	public void controller(String className, String classNameSmall, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".controller";
		paraMap.put("basePackage", packageBase);
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("basePath", basePath);
		paraMap.put("tableName", tableName);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Controller.java";
		createFileByTemplete("controller.html", paraMap, filePath);
	}

	/**
	 * 生成validator
	 * @param className
	 * @param classNameSmall
	 */
	public void validator(String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".validator";
		paraMap.put("basePackage", packageBase);
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("basePath", basePath);
		paraMap.put("basePath", basePath);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Validator.java";
		createFileByTemplete("validator.html", paraMap, filePath);
	}
	
	/**
	 * 生成Service
	 * @param className
	 * @param classNameSmall
	 */
	public void service(String className, String classNameSmall){
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
	 * 生成form.html
	 * @param classNameSmall
	 * @param tableName
	 */
	public void form(String classNameSmall, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("colunmList", getColunm(tableName));
		paraMap.put("descList", getDesc(tableName));
		
		String filePath = System.getProperty("user.dir") + "/WebContent/WEB-INF/view/" + basePath + "/" + classNameSmall +"/form.html";
		createFileByTemplete("form.html", paraMap, filePath);
	}

	/**
	 * 生成view.html
	 * @param classNameSmall
	 * @param tableName
	 */
	public void view(String classNameSmall, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("colunmList", getColunm(tableName));
		paraMap.put("descList", getDesc(tableName));
		
		String filePath = System.getProperty("user.dir") + "/WebContent/WEB-INF/view/" + basePath + "/" + classNameSmall +"/view.html";
		createFileByTemplete("view.html", paraMap, filePath);
	}

	/**
	 * 根据具体模板生成文件
	 * @param templateFileName
	 * @param paraMap
	 * @param filePath
	 */
	public void createFileByTemplete(String templateFileName, Map<String, Object> paraMap, String filePath)  {
		try {
			Class<?> classes = Class.forName("little.ant.platform.tools.code.Base");

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
			
			File path = new File(file.getParent());
			if (!path.exists()) {
				path.mkdirs();
			}
			
			BufferedWriter output = new BufferedWriter(new FileWriter(file));   
			output.write(javaSrc);   
			output.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

