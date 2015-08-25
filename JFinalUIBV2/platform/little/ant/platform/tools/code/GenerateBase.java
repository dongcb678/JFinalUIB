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
public abstract class GenerateBase {

	/**
	 * 二维数组说明：
	 * 
	 * 数据源（默认可以是null）、
	 * 表名、
	 * 主键名（默认可以是null）、
	 * 类名（不包含后缀.java）
	 */
	public static String[][] tableArr = {
		{"ConstantInit.db_dataSource_main", "test_blog", "ids", "TestBlog"}
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
	public static String packageBase = "little.ant.test";
	
	/**
	 * controller基础路径，例如
	 * @Controller(controllerKey = "/jf/platform/authImg") 中的platform
	 * @Controller(controllerKey = "/jf/wx/authImg") 中的wx
	 * 
	 * render基础路径，例如
	 * /platform/user/add.jsp 中的 platform
	 * /weiXin/user/list.jsp 中的 weiXin
	 */
	public static String basePath = "test";

	/**
	 * 获取表的所有字段名
	 * @param tableName
	 * @return
	 */
	public abstract List<TableColumnDto> getColunm(String tableName);
	
	/**
	 * 根据数据库表列类型得到对应java数据类型
	 * @param columnType
	 * @return
	 */
	public abstract String dbTypeToJava(String columnType);
	
	/**
	 * 生成Model
	 * @param className
	 * @param classNameSmall
	 * @param dataSource
	 * @param tableName
	 * @param pkName
	 */
	public void model(String className, String classNameSmall, String dataSource, String tableName, String pkName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".model";
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("dataSource", dataSource);
		paraMap.put("tableName", tableName);
		paraMap.put("pkName", pkName);
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
	public void dto(GenerateBase base, String className, String classNameSmall, String dataSource, String tableName){
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

