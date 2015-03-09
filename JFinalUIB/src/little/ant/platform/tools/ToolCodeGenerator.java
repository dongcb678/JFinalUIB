package little.ant.platform.tools;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.beetl.core.BeetlKit;

/**
 * 简易辅助开发代码生成器
 * @author 董华健
 * 描述：根据表，生成对应的.sql.xml文件、Model类、Service类、validator类、Controller类，
 * 不包含业务处理逻辑，考虑到开发的业务个性化，通用的生成意义不是太大，只做辅助开发
 */
public class ToolCodeGenerator {

	public static void main(String[] args) {
		/**
		 * 表名集合
		 */
		String[] tableArr = {"wx_aa",
		"wx_bb",
		"wx_cc"};
		
		/**
		 * 表名对应的类名
		 */
		String[] classNameArr = {"Aa",
				"Bb",
				"Cc"};
		
		/**
		 * 生成的包和类所在的源码根目录，比如src或者是weiXin
		 */
		String srcFolder = "weiXin";

		/**
		 * 生成的文件存放的包，公共基础包
		 * 描述：比如controller所在的包就是little.ant.weixin.controller
		 */
		String packageBase = "little.ant.weixin";
		
		/**
		 * 循环生成文件
		 */
		for (int i = 0; i < tableArr.length; i++) {
			String tableName = tableArr[i]; //表名称
			String className = classNameArr[i]; //表对应的类名
			String classNameSmall = ToolString.toLowerCaseFirstOne(className); //表对应的类名，首字母小写
			
			sql(srcFolder, packageBase, classNameSmall); // 生成sql文件
			model(srcFolder, packageBase, className, classNameSmall, tableName); // 生成model
			
			validator(srcFolder, packageBase, className, classNameSmall); // 生成validator
			controller(srcFolder, packageBase, className, classNameSmall); // 生成controller
			service(srcFolder, packageBase, className, classNameSmall); // 生成service
		}
	}

	/**
	 * 生成.sql.xml
	 * @param srcFolder
	 * @param packageBase
	 * @param classNameSmall
	 */
	public static void sql(String srcFolder, String packageBase, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".model";
		paraMap.put("namespace", srcFolder + "." + classNameSmall);
		
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
	public static void controller(String srcFolder, String packageBase, String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".controller";
		paraMap.put("basePackage", packageBase);
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Controller.java";
		createFileByTemplete("controller.html", paraMap, filePath);
	}

	/**
	 * 生成Model
	 * @param srcFolder
	 * @param packageBase
	 * @param className
	 * @param classNameSmall
	 * @param tableName
	 */
	public static void model(String srcFolder, String packageBase, String className, String classNameSmall, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".model";
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("tableName", tableName);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className +"Model.java";
		createFileByTemplete("model.html", paraMap, filePath);
	}

	/**
	 * 生成Service
	 * @param srcFolder
	 * @param packageBase
	 * @param className
	 * @param classNameSmall
	 */
	public static void service(String srcFolder, String packageBase, String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".service";
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Service.java";
		createFileByTemplete("service.html", paraMap, filePath);
	}

	/**
	 * 生成validator
	 * @param srcFolder
	 * @param packageBase
	 * @param className
	 * @param classNameSmall
	 */
	public static void validator(String srcFolder, String packageBase, String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".validator";
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Validator.java";
		createFileByTemplete("validator.html", paraMap, filePath);
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

}
