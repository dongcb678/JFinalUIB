package com.platform.tools.code;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.jfinal.kit.PropKit;
import com.platform.config.run.ConfigCore;
import com.platform.constant.ConstantInit;
import com.platform.plugin.I18NPlugin;
import com.platform.tools.ToolDirFile;

/**
 * 根据国际化资源文件生成常量
 * @author 董华健
 */
public class GenerateI18n  {

	private static Logger log = Logger.getLogger(GenerateI18n.class);

	public static void main(String[] args) throws IOException {
		log.info("启动ConfigCore start ......");
    	new ConfigCore();
    	log.info("启动ConfigCore end ......");

		String fileNamePrefix = PropKit.get(ConstantInit.config_i18n_filePrefix);
		String fileName = null;
		String classesPath = ToolDirFile.getClassesPath();
		
		String language = I18NPlugin.i18n_local_zh_CN;
		fileName = fileNamePrefix + "_" + language + ".properties";// + File.separator + 
		InputStream inputStream = null;
		try {
			//inputStream = this.getClass().getClassLoader().getResourceAsStream(filePath);
			//inputStream = I18NPlugin.class.getResourceAsStream(fileName);// "/init.properties"
			inputStream = new FileInputStream(new File(classesPath  + File.separator +  fileName));
			
			Properties properties = new Properties();
			properties.load(inputStream);

			log.debug("加载国际化资源文件：" + fileName); 
			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("package", "com.platform.constant");
			paramMap.put("className", "ConstantI18n");

			Map<String, Object> i18nMap = new HashMap<String, Object>();
			Enumeration<Object> keys = properties.keys();
			while (keys.hasMoreElements()) {
				String key = (String) keys.nextElement();
				String value = properties.getProperty(key);
				i18nMap.put(key, value);
			}
			paramMap.put("i18nMap", i18nMap);

			String filePath = System.getProperty("user.dir") + "/platform/com/platform/constant/ConstantI18n.java";
			
			GenerateBase.createFileByTemplete("i18n.html", paramMap, filePath);
		} catch (Exception exception) {
			log.info("加载properties失败！...");
		} finally {
			try {
				if (inputStream != null) {
					inputStream.close();
				}
			} catch (IOException e) {
				log.info("加载properties后关闭失败！...");
			}
		}
			
		System.exit(0);
	}
	
}
