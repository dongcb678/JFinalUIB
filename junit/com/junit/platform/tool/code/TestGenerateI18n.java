package com.junit.platform.tool.code;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.junit.Test;

import com.jfinal.log.Log;
import com.junit.TestBase;
import com.platform.tools.ToolDirFile;
import com.platform.tools.code.handler.BaseHandler;

/**
 * 根据国际化资源文件生成对应常量文件
 * @author 董华健
 */
public class TestGenerateI18n extends TestBase {

	private static final Log log = Log.getLog(TestGenerateI18n.class);

	@Test
	public void generate() throws IOException {
		String propPath = ToolDirFile.getClassesPath() + File.separator + "message_zh_CN.properties";
		InputStream inputStream = null;
		try {
			inputStream = new FileInputStream(new File(propPath));
			
			Properties properties = new Properties();
			properties.load(inputStream);

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

			String outPath = System.getProperty("user.dir") + "/platform/com/platform/constant/ConstantI18n2.java";
			
			BaseHandler.createFileByTemplete("java/i18n.html", paramMap, outPath);
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
	}
	
}
