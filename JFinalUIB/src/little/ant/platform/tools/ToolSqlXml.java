package little.ant.platform.tools;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.beetl.core.BeetlKit;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.jfinal.log.Logger;

/**
 * 处理Sql Map
 * @author 董华健
 * 说明：加载sql map中的sql到map中，并提供动态长度sql处理
 */
public class ToolSqlXml {

    protected static final Logger log = Logger.getLogger(ToolSqlXml.class);

    /**
     * xml中所有的sql语句
     */
    private static final Map<String, String> sqlMap = new HashMap<String, String>();
    
    /**
     * 过滤掉的sql关键字
     */
    private static final List<String> badKeyWordList = new ArrayList<String>();
    
    /**
     * 加载关键字到List
     */
    static {
    	String badStr = "'|and|exec|execute|insert|select|delete|update|count|drop|*|%|chr|mid|master|truncate|" +
                "char|declare|sitename|net user|xp_cmdshell|;|or|-|+|,|like'|and|exec|execute|insert|create|drop|" +
                "table|from|grant|use|group_concat|column_name|" +
                "information_schema.columns|table_schema|union|where|select|delete|update|order|by|count|*|" +
                "chr|mid|master|truncate|char|declare|or|;|-|--|+|,|like|//|/|%|#";
    	badKeyWordList.addAll(Arrays.asList(badStr.split("\\|")));
    }
    
    /**
     * sql查询关键字过滤效验
     * @param queryStr
     * @return
     */
    public static boolean keywordVali(String queryStr) {
    	queryStr = queryStr.toLowerCase();//统一转为小写
        for (String badKeyWord : badKeyWordList) {
        	if (queryStr.indexOf(badKeyWord) >= 0) {
                return true;
            }
		}
        return false;
    }
    
    /**
     * 获取SQL，固定SQL
     * @param sqlId
     * @return
     */
    public static String getSql(String sqlId) {
    	String sql = sqlMap.get(sqlId);
    	if(null == sql || sql.isEmpty()){
			log.error("sql语句不存在：sql id是" + sqlId);
    	}
    	
        return sql.replaceAll("[\\s]{2,}", " ");
    }

    /**
     * 获取SQL，动态SQL
     * @param sqlId
     * @param param
     * @return
     */
    public static String getSql(String sqlId, Map<String, Object> param) {
    	String sqlTemplete = sqlMap.get(sqlId);
    	if(null == sqlTemplete || sqlTemplete.isEmpty()){
			log.error("sql语句不存在：sql id是" + sqlId);
    	}
    	String sql = BeetlKit.render(sqlTemplete, param);
		
		Set<String> keySet = param.keySet();
		for (String key : keySet) {
			if(param.get(key) == null){
				break;
			}

			Object paramValue = param.get(key);
			if(paramValue instanceof String){
				String value = (String) paramValue;
				value = value.replace("'", "").replace(";", "").replace("--", "");
				sql = sql.replace("#" + key + "#", value);
			}
		}
		
        return sql.replaceAll("[\\s]{2,}", " ");
    }

    /**
     * 获取SQL，动态SQL
     * @param sqlId 
     * @param param 查询参数
     * @param list 用于接收预处理的值
     * @return
     */
    public static String getSql(String sqlId, Map<String, String> param, LinkedList<Object> list) {
    	String sqlTemplete = sqlMap.get(sqlId);
    	if(null == sqlTemplete || sqlTemplete.isEmpty()){
			log.error("sql语句不存在：sql id是" + sqlId);
    	}
    	
    	Map<String, Object> paramMap = new HashMap<String, Object>();
    	Set<String> paramKeySet = param.keySet();
    	for (String paramKey : paramKeySet) {
    		paramMap.put(paramKey, (Object)param.get(paramKey));
		}
    	String sql = BeetlKit.render(sqlTemplete, paramMap);
		
    	Pattern pattern = Pattern.compile("#[\\w\\d\\$\\'\\%\\_]+#");	//#[\\w\\d]+#    \\$
		Pattern pattern2 = Pattern.compile("\\$[\\w\\d\\_]+\\$");
		
		Matcher matcher = pattern.matcher(sql);
		
		while (matcher.find()) {
			String clounm = matcher.group(0); // 得到的结果形式：#'%$names$%'#
			
			Matcher matcher2 = pattern2.matcher(clounm);
			matcher2.find();
			String clounm2 = matcher2.group(0); // 得到的结果形式：$names$
			
			String clounm3 = clounm2.replace("$", "");
			
			if(clounm.equals("#" + clounm2 + "#")){ // 数值型，可以对应处理int、long、bigdecimal、double等等
				String val = (String) param.get(clounm3);
				try {
					Integer.parseInt(val);
					sql = sql.replace(clounm, val);
				} catch (NumberFormatException e) {
					log.error("查询参数值错误，整型值传入了字符串，非法字符串是：" + val);
					return null;
				}
				
			}else{ // 字符串，主要是字符串模糊查询、日期比较的查询
				String val = (String) param.get(clounm3);
				
				String clounm4 = clounm.replace("#", "").replace("'", "").replace(clounm2, val);
				list.add(clounm4);
				
				sql = sql.replace(clounm, "?");
			}
		}
		
        return sql.replaceAll("[\\s]{2,}", " ");
    }
    
    /**
     * 清楚加载的sql
     */
    public static void destory() {
        sqlMap.clear();
    }

    /**
     * 初始化加载sql语句到map
     */
	public static synchronized void init(boolean isInit) {
		// 1.查找classes目录
		String classesPath = ToolDirFile.getClassesPath(); 
		List<File> sqlXmlFiles = new ArrayList<File>();
    	findByClasses(new File(classesPath), sqlXmlFiles);
    	for (File file : sqlXmlFiles) {
			try {
				SAXReader reader = new SAXReader();
				Document doc = reader.read(file);
				parseDoc(isInit, file.getName(), doc);
			} catch (DocumentException e) {
				e.printStackTrace();
			}
		}
        
    	// 2.查找jar文件中的目录
    	findByJars(isInit);
    }


    /**
     * 递归查找classes中的.sql.xml文件
     * @param dirFile
     * @param sqlXmlFiles
     */
    private static void findByClasses(File dirFile, List<File> sqlXmlFiles) {
        if (!dirFile.isDirectory()) {
        	if (dirFile.getName().endsWith(".sql.xml")) {
        		sqlXmlFiles.add(dirFile);
        	}
        } else {
            File[] fileList = dirFile.listFiles();
            for (File file : fileList) {
            	if (file.isDirectory()) {
            		findByClasses(file, sqlXmlFiles);
                    
            	} else {
                	if (file.getName().endsWith(".sql.xml")) {
                		sqlXmlFiles.add(file);
                	}
                }
			}
        }
    }

    /**
     * 查找jar文件中的.sql.xml文件
     * @param sqlXmlFiles
     */
	private static void findByJars(boolean isInit) {
    	try {
            // jar中文件查找
        	List<String> jarList = ToolClassSearch.scanJarList();
        	int size = jarList.size();
            for (int i = 0; i < size; i++) {
                JarFile jarFile = new JarFile(new File(ToolDirFile.getLibPath() + File.separator + jarList.get(i)));
                Enumeration<JarEntry> entries = jarFile.entries();
                while (entries.hasMoreElements()) {
                    JarEntry jarEntry = entries.nextElement();
                    String entryName = jarEntry.getName();
                    String pkgEntryName = entryName.replaceAll("/", ".");
                    
                    // 去除不需要扫描的包
                    List<String> pkgs = ToolClassSearch.scanPkgList();
                    boolean pkgResult = false;
                    for (String pkg : pkgs) {
                    	if(pkgEntryName.startsWith(pkg)){
                    		pkgResult = true;
                    		break;
                    	}
                    }
                    
                    // 查找.sql.xml文件
                    if (!jarEntry.isDirectory() && pkgResult && entryName.endsWith(".sql.xml")) {
                    	InputStream inputStream = null;
                    	try {
                        	inputStream = jarFile.getInputStream(jarEntry); 
            				SAXReader reader = new SAXReader();
            				Document doc = reader.read(inputStream);
            				parseDoc(isInit, pkgEntryName, doc);
            			} catch (DocumentException e) {
            				e.printStackTrace();
            			} finally {
            				inputStream.close();
            			}
                    }
                }
                jarFile.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    /**
     * 解析xml
     * @param isInit
     * @param fileName
     * @param doc
     */
	private static void parseDoc(boolean isInit, String fileName, Document doc){
    	Element root = doc.getRootElement();
		String namespace = root.attributeValue("namespace");
		if(null == namespace || namespace.trim().isEmpty()){
			log.error("sql xml文件" + fileName + "的命名空间不能为空");
			return;
		}
		
		for(Iterator<?> iterTemp = root.elementIterator(); iterTemp.hasNext();) {	
			Element element = (Element) iterTemp.next();	
			if(element.getName().toLowerCase().equals("sql")){
				String id = element.attributeValue("id");
				String key = namespace + "." + id;
				
				if(null == id || id.trim().isEmpty()){
					log.error("sql xml文件" + fileName + "的存在没有id的sql语句");
					continue;
				}
				
				String sql = element.getText();
				if(null == sql || sql.trim().isEmpty()){
					log.error("sql xml文件" + fileName + "的存在没有内容的sql语句，sqlId = " + key);
					continue;
				}
				
				if(isInit && null != sqlMap.get(key)){
					log.error("sql xml文件" + fileName + "的sql语句重复，sqlId = " + key);
					continue;
				} else if(null != sqlMap.get(key)){
					log.error("sql xml文件" + fileName + "的sql语句重复，sqlId = " + key);
				}
				
				sql = sql.replaceAll("[\\s]{2,}", " ");
				sqlMap.put(key, sql);
				log.debug("sql加载, sql file = " + fileName + ", sql key = " + key + ", sql content = " + sql);
			}
		}
	}
	
}
