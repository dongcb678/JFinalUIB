package little.ant.pingtai.tools;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.beetl.core.BeetlKit;

public class ToolCodeGenerator {

	public static void main(String[] args) {
		String[] tableArr = {"wx_aa",
		"wx_bb",
		"wx_cc"};

		String[] classNameArr = {"Aa",
				"Bb",
				"Cc"};
		
		String[] classNameSmallArr = {"aa",
				"bb",
				"cc"};

		String srcFolder = "weiXin";
		String packageBase = "little.ant.weixin";
		
		for (int i = 0; i < tableArr.length; i++) {

			String tableName = tableArr[i];
			String className = classNameArr[i];
			String classNameSmall = classNameSmallArr[i];
			
			validator(srcFolder, packageBase, className, classNameSmall);
			model(srcFolder, packageBase, className, classNameSmall, tableName);
			service(srcFolder, packageBase, className, classNameSmall);
			controller(srcFolder, packageBase, className, classNameSmall);
			sql(srcFolder, packageBase, classNameSmall);
		}
	}

	/**
	 * xxx.sql.xml
	 * @param srcFolder
	 * @param packageBase
	 * @param classNameSmall
	 */
	public static void sql(String srcFolder, String packageBase, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".model";
		paraMap.put("namespace", srcFolder + "." + classNameSmall);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + classNameSmall + ".sql.xml";
		readFile("sql.html", paraMap, filePath);
	}

	/**
	 * 生成Controller
	 * @param packageBase
	 */
	public static void controller(String srcFolder, String packageBase, String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".controller";
		paraMap.put("basePackage", packageBase);
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Controller.java";
		readFile("controller.html", paraMap, filePath);
	}

	/**
	 * 生成Model
	 * @param packageBase
	 */
	public static void model(String srcFolder, String packageBase, String className, String classNameSmall, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".model";
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("tableName", tableName);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className +"Model.java";
		readFile("model.html", paraMap, filePath);
	}

	/**
	 * 生成Service
	 * @param packageBase
	 */
	public static void service(String srcFolder, String packageBase, String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".service";
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Service.java";
		readFile("service.html", paraMap, filePath);
	}

	/**
	 * 生成validator
	 * @param packageBase
	 */
	public static void validator(String srcFolder, String packageBase, String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + ".validator";
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		
		String filePath = System.getProperty("user.dir") + "/"+srcFolder+"/" + packages.replace(".", "/") + "/" + className + "Validator.java";
		readFile("validator.html", paraMap, filePath);
	}
	
	/**
	 * 生成
	 * @param templateFileName
	 * @param paraMap
	 * @param filePath
	 */
	public static void readFile(String templateFileName, Map<String, Object> paraMap, String filePath)  {
		try {
			Class<?> classes = Class.forName("little.ant.pingtai.tools.ToolCodeGenerator");

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
