package com.platform.plugin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.jfinal.plugin.IPlugin;
import com.platform.tools.ToolCache;
import com.platform.tools.ToolClassSearch;
import com.platform.tools.ToolDirFile;

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
     * 加载sql语句到cache
     * @param isInit 是否初始化加载
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

}
