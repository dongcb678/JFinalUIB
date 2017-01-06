package com.platform.tools.code.handler;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.beetl.core.BeetlKit;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.DbKit;
import com.platform.dto.DataBase;

/**
 * 代码生成处理器基类
 * @author 董华健  dongcb678@163.com
 */
public abstract class BaseHandler {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(BaseHandler.class);
	
	protected DataBase dataBase;
	protected String srcFolder;
	protected String packageBase;
	protected String basePath;
	protected String dataSource;
	
	/**
	 * 获取表的所有字段信息
	 * @param tableName
	 * @return
	 */
	public abstract List<ColumnDto> getColunm(String tableName);

	/**
	 * 获取所有数据类型
	 * @param tableName
	 * @return
	 */
	public Set<String> getJataTypeList(String tableName){
		Map<String, String> map = getJavaType(tableName);
		Set<String> keys = map.keySet();
		Set<String> typeSet = new HashSet<String>();
		for (String key : keys) {
			String type = map.get(key);
			if(type.equals("byte[]") || type.startsWith("java.lang.")){
				continue;
			}
			typeSet.add(map.get(key));
		}
		return typeSet;
	}
	
	/**
	 * 获取表所有字段对应的java数据类型
	 * @param tableName
	 * @return
	 */
	public Map<String, String> getJavaType(String tableName){
		String name = getDataBase().getName();
		
        //  获取字段数
	    Map<String, String> columnJavaTypeMap = new HashMap<String, String>();
	    
	    Connection conn = null;
	    Statement st = null;
	    ResultSet rs = null;
	    
		try {
			conn = DbKit.getConfig(name).getConnection();
			st = conn.createStatement();    
		    String sql = "select * from " + tableName + " where 1 != 1 ";   
		    rs = st.executeQuery(sql);    
		    ResultSetMetaData rsmd = rs.getMetaData(); 

	        int columns = rsmd.getColumnCount();   
	        for (int i=1; i<=columns; i++){   
	            //获取字段名
	            String columnName = rsmd.getColumnName(i).toLowerCase(); 
	 			String columnClassName = rsmd.getColumnClassName(i);   
	 			if(columnClassName.equals("[B")){
	 				columnClassName = "byte[]";
	 			}
	 			columnJavaTypeMap.put(columnName, columnClassName);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbKit.getConfig().close(rs, st, conn);
		}
		
		return columnJavaTypeMap;
	}

	/**
	 * 生成Model
	 * @param className			类名称
	 * @param classNameSmall	类名称首字母小写
	 * @param dataSource		数据源名称
	 * @param tableName			表名称
	 * @param pkName			主键列名称
	 * @param colunmList		表字段信息
	 */
	public void model(String className, String classNameSmall, String dataSource, String tableName, String pkName, List<ColumnDto> colunmList){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + "." + className.toLowerCase();
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("dataSource", dataSource);
		paraMap.put("tableName", tableName);
		paraMap.put("pkName", pkName);
		paraMap.put("namespace", basePath + "." + classNameSmall);

		paraMap.put("colunmList", colunmList);
		paraMap.put("dataTypes", getJataTypeList(tableName));
		
		String filePath = System.getProperty("user.dir") + "/" + srcFolder + "/" + packages.replace(".", "/") + "/" + className + ".java";
		createFileByTemplete("java/model.html", paraMap, filePath);
	}

	/**
	 * 生成DTO 
	 * @param className			类名称
	 * @param classNameSmall	类名称首字母小写
	 * @param dataSource		数据源名称
	 * @param tableName			表名称
	 * @param colunmList		表字段信息
	 */
	public void dto(String className, String classNameSmall, String dataSource, String tableName, List<ColumnDto> colunmList){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + "." + className.toLowerCase();
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("dataSource", dataSource);
		paraMap.put("tableName", tableName);

		paraMap.put("colunmList", colunmList);
		paraMap.put("dataTypes", getJataTypeList(tableName));
		
		String filePath = System.getProperty("user.dir") + "/" + srcFolder + "/" + packages.replace(".", "/") + "/" + className + "Dto.java";
		createFileByTemplete("java/dto.html", paraMap, filePath);
	}

	/**
	 * 生成.sql.xml
	 * @param classNameSmall	类名称首字母小写
	 * @param tableName			表名称
	 */
	public void sql(String classNameSmall, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + "." + classNameSmall.toLowerCase();
		paraMap.put("namespace", basePath + "." + classNameSmall);
		paraMap.put("tableName", tableName);
		
		String filePath = System.getProperty("user.dir") + "/" + srcFolder + "/" + packages.replace(".", "/") + "/" + classNameSmall + ".sql.xml";
		createFileByTemplete("java/sql.html", paraMap, filePath);
	}

	/**
	 * 生成Controller
	 * @param className			类名称
	 * @param classNameSmall	类名称首字母小写
	 */
	public void controller(String className, String classNameSmall, String tableName){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + "." + classNameSmall.toLowerCase();
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("basePath", basePath);
		paraMap.put("tableName", tableName);
		
		String filePath = System.getProperty("user.dir") + "/" + srcFolder + "/" + packages.replace(".", "/") + "/" + className + "Controller.java";
		createFileByTemplete("java/controller.html", paraMap, filePath);
	}

	/**
	 * 生成validator
	 * @param className			类名称
	 * @param classNameSmall	类名称首字母小写
	 */
	public void validator(String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + "." + classNameSmall.toLowerCase();
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("basePath", basePath);
		
		String filePath = System.getProperty("user.dir") + "/" + srcFolder + "/" + packages.replace(".", "/") + "/" + className + "Validator.java";
		createFileByTemplete("java/validator.html", paraMap, filePath);
	}
	
	/**
	 * 生成Service
	 * @param className			类名称
	 * @param classNameSmall	类名称首字母小写
	 */
	public void service(String className, String classNameSmall){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		String packages = packageBase + "." + classNameSmall.toLowerCase();
		paraMap.put("package", packages);
		paraMap.put("className", className);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("namespace", srcFolder + "." + classNameSmall);
		
		String filePath = System.getProperty("user.dir") + "/" + srcFolder + "/" + packages.replace(".", "/") + "/" + className + "Service.java";
		createFileByTemplete("java/service.html", paraMap, filePath);
	}

	/**
	 * 生成list.html
	 * @param classNameSmall 	类名称，且首字母小写
	 * @param colunmList		model字段信息
	 */
	public void list(String classNameSmall, List<ColumnDto> colunmList){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("basePath", basePath);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("colunmList", colunmList);
		
		String filePath = System.getProperty("user.dir") + "/WebContent/WEB-INF/view/" + basePath + "/" + classNameSmall + "/list.html";
		createFileByTemplete("html/list.html", paraMap, filePath);
	}

	/**
	 * 生成add.html
	 * @param classNameSmall 	类名称，且首字母小写
	 * @param colunmList		model字段信息
	 */
	public void add(String classNameSmall, List<ColumnDto> colunmList){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("basePath", basePath);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("colunmList", colunmList);
		
		String filePath = System.getProperty("user.dir") + "/WebContent/WEB-INF/view/" + basePath + "/" + classNameSmall + "/add.html";
		createFileByTemplete("html/add.html", paraMap, filePath);
	}

	/**
	 * 生成update.html
	 * @param classNameSmall 	类名称，且首字母小写
	 * @param colunmList		model字段信息
	 */
	public void update(String classNameSmall, List<ColumnDto> colunmList){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("basePath", basePath);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("colunmList", colunmList);
		
		String filePath = System.getProperty("user.dir") + "/WebContent/WEB-INF/view/" + basePath + "/" + classNameSmall + "/update.html";
		createFileByTemplete("html/update.html", paraMap, filePath);
	}

	/**
	 * 生成form.html
	 * @param classNameSmall 	类名称，且首字母小写
	 * @param colunmList		model字段信息
	 */
	public void form(String classNameSmall, List<ColumnDto> colunmList){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("basePath", basePath);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("colunmList", colunmList);
		
		String filePath = System.getProperty("user.dir") + "/WebContent/WEB-INF/view/" + basePath + "/" + classNameSmall + "/form.html";
		createFileByTemplete("html/form.html", paraMap, filePath);
	}

	/**
	 * 生成view.html
	 * @param classNameSmall 	类名称，且首字母小写
	 * @param colunmList		model字段信息
	 */
	public void view(String classNameSmall, List<ColumnDto> colunmList){
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("basePath", basePath);
		paraMap.put("classNameSmall", classNameSmall);
		paraMap.put("colunmList", colunmList);
		
		String filePath = System.getProperty("user.dir") + "/WebContent/WEB-INF/view/" + basePath + "/" + classNameSmall + "/view.html";
		createFileByTemplete("html/view.html", paraMap, filePath);
	}

	/**
	 * 根据具体模板生成文件
	 * @param templateFileName	模板文件名称
	 * @param paraMap			渲染参数
	 * @param filePath			输出目录
	 */
	public static void createFileByTemplete(String templateFileName, Map<String, Object> paraMap, String filePath)  {
		InputStream is = null;
		BufferedWriter output = null;
		try {
			is = BaseHandler.class.getResourceAsStream("/com/platform/tools/code/tpl/" + templateFileName);
			int count = 0;
			while (count == 0) {
				count = is.available();
			}
			
			byte[] bytes = new byte[count];
			int readCount = 0; // 已经成功读取的字节的个数
			while (readCount < count) {
				readCount += is.read(bytes, readCount, count - readCount);
			}
			
			String template = new String(bytes);
			
			String javaSrc = BeetlKit.render(template, paraMap);
			
			File file = new File(filePath);
			
			File path = new File(file.getParent());
			if (!path.exists()) {
				path.mkdirs();
			}
			
			output = new BufferedWriter(new FileWriter(file));   
			output.write(javaSrc);   
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(is != null){
					is.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(output != null){
					output.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public DataBase getDataBase() {
		return dataBase;
	}

	public void setDataBase(DataBase dataBase) {
		this.dataBase = dataBase;
	}

	public String getSrcFolder() {
		return srcFolder;
	}

	public void setSrcFolder(String srcFolder) {
		this.srcFolder = srcFolder;
	}

	public String getPackageBase() {
		return packageBase;
	}

	public void setPackageBase(String packageBase) {
		this.packageBase = packageBase;
	}

	public String getBasePath() {
		return basePath;
	}

	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}

	public String getDataSource() {
		return dataSource;
	}

	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}

}
