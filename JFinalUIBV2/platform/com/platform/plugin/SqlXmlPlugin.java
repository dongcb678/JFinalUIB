package com.platform.plugin;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.jfinal.kit.PathKit;
import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;
import com.platform.tools.ToolCache;

/**
 * 加载sql文件
 * @author 董华健
 */
public class SqlXmlPlugin implements IPlugin {

    protected static final Logger log = Logger.getLogger(SqlXmlPlugin.class);
    
    /**
     * sql放入cache中时的key前缀
     */
	public static final String cacheStart_sql = "sql_";
    
    public SqlXmlPlugin() {
    	
    }

    @Override
    public boolean start() {
        init(true);
        return true;
    }

    @Override
    public boolean stop() {
        return true;
    }

    /**
     * 初始化加载sql语句到cache
     * @param isInit
     */
	public static synchronized void init(boolean isInit) {
		/*
		String classRootPath = ToolSqlXml.class.getClassLoader().getResource("").getFile();
		try {
			classRootPath = java.net.URLDecoder.decode(classRootPath, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			log.error("初始化加载sql：获取classRootPath异常");
		}
		*/
		String classRootPath = PathKit.getRootClassPath();
        File file = new File(classRootPath);
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
						
						if(isInit && null != ToolCache.get(cacheStart_sql + key)){
							log.error("sql xml文件" + fileName + "的sql语句重复，sqlId = " + key);
							continue;
						} else if(null != ToolCache.get(cacheStart_sql + key)){
							log.error("sql xml文件" + fileName + "的sql语句重复，sqlId = " + key);
						}
						
						sql = sql.replaceAll("[\\s]{2,}", " ");
						ToolCache.set(cacheStart_sql + key, sql);
						log.debug("sql加载, sql file = " + fileName + ", sql key = " + key + ", sql content = " + sql);
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
     */
    private static void findFiles(File baseFile, List<File> sqlXmlFiles) {
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
    }
    
}
