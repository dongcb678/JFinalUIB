package little.ant.pingtai.tools;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.beetl.core.BeetlKit;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.jfinal.log.Logger;

public class ToolSqlXml {

    protected static final Logger log = Logger.getLogger(ToolSqlXml.class);

    private static Map<String, String> sqlMap = new HashMap<String, String>();

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
    	
        return sql;
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
			String value = (String) param.get(key);
			value = value.replace("'", "").replace(";", "");
			sql = sql.replace("#" + key + "#", value);
		}
		
        return sql;
    }

    public static void destory() {
        sqlMap.clear();
    }

    @SuppressWarnings("rawtypes")
	public static void init() {
        File file = new File(ToolSqlXml.class.getClassLoader().getResource("").getFile());
    	List<File> files = new ArrayList<File>();
        findFiles(file, files);
        
    	SAXReader reader = new SAXReader();
    	String fileName = null;
    	try {
	        for (File xmlfile : files) {
	        	fileName = xmlfile.getName();
				Document doc = reader.read(xmlfile);
				Element root = doc.getRootElement();
				String namespace = root.attributeValue("namespace");
				if(null == namespace || namespace.trim().isEmpty()){
					log.error("sql xml文件" + fileName + "的命名空间不能为空");
					continue;
				}
				
				for(Iterator iterTemp = root.elementIterator(); iterTemp.hasNext();) {	
					Element element = (Element) iterTemp.next();	
					if(element.getName().toLowerCase().equals("sql")){
						String id = element.attributeValue("id");
						if(null == id || id.trim().isEmpty()){
							log.error("sql xml文件" + fileName + "的存在没有id的sql语句");
							continue;
						}
						
						String sql = element.getText();
						if(null == sql || sql.trim().isEmpty()){
							log.error("sql xml文件" + fileName + "的存在没有内容的sql语句");
							continue;
						}
						
						String key = namespace + "." + id;
						if(sqlMap.containsKey(key)){
							log.error("sql xml文件" + fileName + "的sql语句" + key + "的存在重复命名空间和ID");
							continue;
						}
						
						sqlMap.put(key, sql);
						log.debug("sql文件名：" + fileName + " sql key: " + key + " sql内容：" + sql);
					}
				}
	        }
		} catch (DocumentException e) {
			log.error("sql xml文件" + fileName + "解析异常");
			e.printStackTrace();
		}
    }
    
    /**
     * 递归查找文件
     * @param baseFile
     * @param sqlXmlFiles
     * @return
     */
    private static List<File> findFiles(File baseFile, List<File> sqlXmlFiles) {
        if (!baseFile.isDirectory()) {
        	if (baseFile.getName().endsWith(".sql.xml")) {
        		sqlXmlFiles.add(baseFile);
        	}
        } else {
            File[] fileList = baseFile.listFiles();
            for (File file : fileList) {
            	if (file.isDirectory()) {
            		findFiles(file, sqlXmlFiles);
                    
            	} else {
                	if (file.getName().endsWith(".sql.xml")) {
                		sqlXmlFiles.add(file);
                	}
                }
			}
        }
        return sqlXmlFiles;
    }
    
}
