package com.platform.plugin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.jfinal.kit.PathKit;
import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;

/**
 * 初始化I18N数据信息的加载
 * @author 董华健
 */
public class I18NPlugin implements IPlugin {

    protected final Logger log = Logger.getLogger(getClass());

	private static final Map<String, Map<String, String>> resourceBundleMap = new HashMap<String, Map<String, String>>();

	/**
	 * 根据i18n参数查询获取哪个字段的值
	 * @param i18n
	 * @return
	 */
	public static String i18n(String i18n){
		String val = "_zhcn";
		if(i18n.equals("zh") || i18n.equals("zh_cn")){
			val = "_zhcn";
			
		} else if(i18n.equals("en") || i18n.equals("en_us")){
			val = "_enus";
			
		} else if(i18n.equals("ja") || i18n.equals("ja_jp")){
			val = "_ja";
			
		} else if(i18n.equals("zh_hk")){
			val = "_zhhk";
			
		} else if(i18n.equals("zh_tw")){
			val = "_zhtw";
		}
		return val;
	}
	
	/**
	 * 获取国际化Map
	 * @param localePramKey
	 * @return
	 */
	public static Map<String, String> get(String localePramKey){
		if(localePramKey.equals("zh")){
			localePramKey = "zh_cn";
			
		}else if(localePramKey.equals("en")){
			localePramKey = "en_us";
		
		}
		
		Map<String, String> map = resourceBundleMap.get(localePramKey);
		if(map != null){
			return map;
		}else{
			return resourceBundleMap.get("zh_cn");
		}
	}

	/**
	 * 获取国际化值
	 * @param i18n 国家语言标示
	 * @param key
	 * @return
	 */
	public static String get(String i18n, String key){
		Map<String, String> map = get(i18n);
		return map.get(key);
	}
	
	@Override
	public boolean start() {
		String[] languages = {
				"zh_CN", 
				"zh_HK", 
				"zh_TW",
				"en_US",
				"ja"
			};
		
		String fileName = null;
		String classRootPath = PathKit.getWebRootPath() + File.separator + "WEB-INF" + File.separator + "classes";
		
		for (String language : languages) {
			fileName = "message_" + language + ".properties";// + File.separator + 
			InputStream inputStream = null;
			try {
				//inputStream = this.getClass().getClassLoader().getResourceAsStream(filePath);
				//inputStream = I18NPlugin.class.getResourceAsStream(fileName);// "/init.properties"
				inputStream = new FileInputStream(new File(classRootPath  + File.separator +  fileName));
				
				Properties properties = new Properties();
				properties.load(inputStream);

				log.debug("加载国际化资源文件：" + fileName); 
				
				Map<String, String> i18nMap = new HashMap<String, String>();
				Enumeration<Object> keys = properties.keys();
				while (keys.hasMoreElements()) {
					String key = (String) keys.nextElement();
					String value = properties.getProperty(key);
					i18nMap.put(key, value);
				}
				resourceBundleMap.put(language.toLowerCase(), i18nMap);
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
		return true;
	}

	@Override
	public boolean stop() {
		resourceBundleMap.clear();
		return true;
	}

}
