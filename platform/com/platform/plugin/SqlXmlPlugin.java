package com.platform.plugin;

import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.io.InputStream;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.IPlugin;
import com.platform.tools.ToolCache;
import com.platform.tools.ToolClassSearch;
import com.platform.tools.ToolDirFile;

/**
 * 加载sql文件
 * 
 * @author 董华健
 */
public class SqlXmlPlugin implements IPlugin {

	private static final Log log = Log.getLog(SqlXmlPlugin.class);

	/**
	 * sql放入cache中时的key前缀
	 */
	public static final String cacheStart_sql = "sql_";

	public SqlXmlPlugin() {

	}

	@Override
	public boolean start() {
		// initByPath(true); // 根据绝对路径查找，使用普通构建项目

		initByClassLoader(true); // 根据ClassLoader查找，maven项目和普通构建项目兼容

		return true;
	}

	@Override
	public boolean stop() {
		return true;
	}

	/**
	 * 根据ClassLoader，加载sql语句到cache
	 * 
	 * @param isInit
	 *            是否初始化加载
	 */
	public static synchronized void initByClassLoader(boolean isInit) {
		List<String> pkgs = ToolClassSearch.getScanPkgList();
		for (String pkg : pkgs) {
			findByClassLoader(pkg);
		}
	}

	/**
	 * 根据绝对路径，加载sql语句到cache
	 * 
	 * @param isInit
	 *            是否初始化加载
	 */
	@Deprecated
	public static synchronized void initByPath(boolean isInit) {
		// 1.查找classes目录
		String classesPath = ToolDirFile.getClassesPath();
		List<File> sqlXmlFiles = new ArrayList<File>();
		findClassesByPath(new File(classesPath), sqlXmlFiles);
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
		findJarByPath(isInit);
	}

	/**
	 * 绝对路径，递归查找classes中的.sql.xml文件
	 * 
	 * @param dirFile
	 * @param sqlXmlFiles
	 */
	@Deprecated
	private static void findClassesByPath(File dirFile, List<File> sqlXmlFiles) {
		if (!dirFile.isDirectory()) {
			if (dirFile.getName().endsWith(".sql.xml")) {
				sqlXmlFiles.add(dirFile);
			}
		} else {
			File[] fileList = dirFile.listFiles();
			for (File file : fileList) {
				if (file.isDirectory()) {
					findClassesByPath(file, sqlXmlFiles);

				} else {
					if (file.getName().endsWith(".sql.xml")) {
						sqlXmlFiles.add(file);
					}
				}
			}
		}
	}

	/**
	 * 绝对路径，查找jar文件中的.sql.xml文件
	 * 
	 * @param sqlXmlFiles
	 */
	@Deprecated
	private static void findJarByPath(boolean isInit) {
		try {
			// jar中文件查找
			List<String> jarList = ToolClassSearch.getScanJarList();
			int size = jarList.size();
			for (int i = 0; i < size; i++) {
				JarFile jarFile = new JarFile(new File(ToolDirFile.getLibPath() + File.separator + jarList.get(i)));
				Enumeration<JarEntry> entries = jarFile.entries();
				while (entries.hasMoreElements()) {
					JarEntry jarEntry = entries.nextElement();
					String entryName = jarEntry.getName();
					String pkgEntryName = entryName.replaceAll("/", ".");

					// 去除不需要扫描的包
					List<String> pkgs = ToolClassSearch.getScanPkgList();
					boolean pkgResult = false;
					for (String pkg : pkgs) {
						if (pkgEntryName.startsWith(pkg)) {
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
	 * 根据ClassLoader查找指定包下sql文件
	 * 
	 * @param basePackage
	 */
	private static void findByClassLoader(String basePackage) {
		// 是否循环迭代
		boolean recursive = true;
		String packageDirName = basePackage.replace('.', '/');
		Enumeration<URL> dirs;
		try {
			dirs = Thread.currentThread().getContextClassLoader().getResources(packageDirName);
			Set<String> set = new HashSet<String>(); // 去重
			while (dirs.hasMoreElements()) {
				URL url = dirs.nextElement();
				
				if(set.contains(url.getPath())){
					continue;
				}else{
					set.add(url.getPath());
				}
				
				String protocol = url.getProtocol();
				if ("file".equals(protocol)) {
					// 如果是以文件的形式保存在服务器上
					String basePath = URLDecoder.decode(url.getFile(), "UTF-8");
					scanClasses(basePackage, basePath, recursive);
				} else if ("jar".equals(protocol)) {
					// 如果是jar包文件
					JarFile jarFile;
					try {
						jarFile = ((JarURLConnection) url.openConnection()).getJarFile();
						
						Enumeration<JarEntry> entries = jarFile.entries();
						while (entries.hasMoreElements()) {
							JarEntry entry = entries.nextElement();
							String name = entry.getName();
							if (name.charAt(0) == '/') {
								name = name.substring(1);
							}
							if (name.startsWith(packageDirName)) {
								int idx = name.lastIndexOf('/');
								if (idx != -1) {
									basePackage = name.substring(0, idx).replace('/', '.');
								}
								if ((idx != -1) || recursive) {
									if (name.endsWith(".sql.xml") && !entry.isDirectory()) {
										InputStream inputStream = null;
										try {
											inputStream = jarFile.getInputStream(entry);
											SAXReader reader = new SAXReader();
											Document doc = reader.read(inputStream);
											parseDoc(true, basePackage, doc);
										} catch (DocumentException e) {
											e.printStackTrace();
										} finally {
											inputStream.close();
										}
									}
								}
							}
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 递归查找classes目录下的sql文件
	 * 
	 * @param basePackage
	 * @param basePath
	 * @param recursive
	 */
	private static void scanClasses(String basePackage, String basePath, final boolean recursive) {
		File dir = new File(basePath);
		if (!dir.exists() || !dir.isDirectory()) {
			return;
		}
		File[] dirfiles = dir.listFiles(new FileFilter() {
			public boolean accept(File file) {
				return (recursive && file.isDirectory()) || (file.getName().endsWith(".sql.xml"));
			}
		});
		for (File file : dirfiles) {
			if (file.isDirectory()) {
				scanClasses(basePackage + "." + file.getName(), file.getAbsolutePath(), recursive);
			} else {
				try {
					SAXReader reader = new SAXReader();
					Document doc = reader.read(file);
					parseDoc(true, file.getName(), doc);
				} catch (DocumentException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 解析xml
	 * 
	 * @param isInit
	 * @param fileName
	 * @param doc
	 */
	private static void parseDoc(boolean isInit, String fileName, Document doc) {
		Element root = doc.getRootElement();
		String namespace = root.attributeValue("namespace");
		if (StrKit.isBlank(namespace)) {
			if(log.isErrorEnabled()) log.error("sql xml文件" + fileName + "的命名空间不能为空");
			return;
		}

		for (Iterator<?> iterTemp = root.elementIterator(); iterTemp.hasNext();) {
			Element element = (Element) iterTemp.next();
			if (element.getName().toLowerCase().equals("sql")) {
				String id = element.attributeValue("id");
				String key = namespace + "." + id;

				if (StrKit.isBlank(id)) {
					if(log.isErrorEnabled()) log.error("sql xml文件" + fileName + "的存在没有id的sql语句");
					throw new RuntimeException("sql xml文件" + fileName + "的存在没有id的sql语句");
				}

				String sql = element.getText();
				if (StrKit.isBlank(sql)) {
					if(log.isErrorEnabled()) log.error("sql xml文件" + fileName + "的存在没有内容的sql语句，sqlId = " + key);
					throw new RuntimeException("sql xml文件" + fileName + "的存在没有内容的sql语句，sqlId = " + key);
				}

				if (isInit && null != ToolCache.get(cacheStart_sql + key)) {
					if(log.isWarnEnabled()) log.warn("sql xml文件" + fileName + "的sql语句重复，sqlId = " + key);
					// throw new RuntimeException("sql xml文件" + fileName + "的sql语句重复，sqlId = " + key);
				}

				sql = sql.replaceAll("[\\s]{2,}", " ");
				ToolCache.set(cacheStart_sql + key, sql);
				if(log.isDebugEnabled()) log.debug("sql加载, sql file = " + fileName + ", sql key = " + key + ", sql content = " + sql);
			}
		}
	}

}
