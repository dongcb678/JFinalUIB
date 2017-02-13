package com.platform.plugin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.IPlugin;
import com.platform.constant.ConstantInit;
import com.platform.tools.ToolDirFile;

/**
 * 初始化I18N数据信息的加载
 * @author 董华健
 */
public class I18NPlugin implements IPlugin {

	private static final Log log = Log.getLog(I18NPlugin.class);

    public static final String i18n_local_zh_CN = "zh_CN";
    
    public static final String i18n_local_zh_HK = "zh_HK";
    
    public static final String i18n_local_zh_TW = "zh_TW";
    
    public static final String i18n_local_en_US = "en_US";
    
    public static final String i18n_local_ja = "ja";

	private static final Map<String, Map<String, String>> resourceBundleMap = new HashMap<String, Map<String, String>>();

	/**
	 * 根据i18n参数查询获取哪个字段的值
	 * @param i18n
	 * @return
	 */
	public static String columnSuffix(String i18n){
		String val = null;
		if(i18n.equals(i18n_local_zh_CN)){
			val = "_zhcn";
			
		} else if(i18n.equals(i18n_local_en_US)){
			val = "_enus";
			
		} else if(i18n.equals(i18n_local_ja)){
			val = "_ja";
			
		} else if(i18n.equals(i18n_local_zh_HK)){
			val = "_zhhk";
			
		} else if(i18n.equals(i18n_local_zh_TW)){
			val = "_zhtw";
		}
		return val;
	}
	
	/**
	 * 获取国际化Map
	 * @param localePram
	 * @return
	 */
	public static Map<String, String> get(String localePram){
		return resourceBundleMap.get(localePram);
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

	/**
	 * 国际化key值处理
	 * @param localePram
	 * @return
	 */
	public static String localParse(String localePram){
		localePram = localePram.toLowerCase();
		if(localePram.equals("zh") || localePram.equals("zh_cn")){
			localePram = i18n_local_zh_CN;
			
		}else if(localePram.equals("en") || localePram.equals("en_us")){
			localePram = i18n_local_en_US;
		
		}else if(localePram.equals("ja") || localePram.equals("ja_jp")){
			localePram = i18n_local_ja;
			
		} else if(localePram.equals("zh_hk")){
			localePram = i18n_local_zh_HK;
			
		} else if(localePram.equals("zh_tw")){
			localePram = i18n_local_zh_TW;
			
		} else{
			localePram = i18n_local_zh_CN;
		}
		
		return localePram;
	}
	
	@Override
	public boolean start() {
		String[] languages = {
				i18n_local_zh_CN, 
				i18n_local_zh_HK, 
				i18n_local_zh_TW,
				i18n_local_en_US,
				i18n_local_ja
			};

		String fileNamePrefix = PropKit.get(ConstantInit.config_i18n_filePrefix);
		String fileName = null;
		String classesPath = ToolDirFile.getClassesPath();
		
		for (String language : languages) {
			fileName = fileNamePrefix + "_" + language + ".properties";// + File.separator + 
			InputStream inputStream = null;
			try {
				//inputStream = this.getClass().getClassLoader().getResourceAsStream(filePath);
				//inputStream = I18NPlugin.class.getResourceAsStream(fileName);// "/init.properties"
				if(log.isDebugEnabled()) log.debug("加载国际化资源文件：" + classesPath  + File.separator +  fileName);
				inputStream = new FileInputStream(new File(classesPath  + File.separator +  fileName));
				
				Properties properties = new Properties();
				properties.load(inputStream);

				Map<String, String> i18nMap = new HashMap<String, String>();
				Enumeration<Object> keys = properties.keys();
				while (keys.hasMoreElements()) {
					String key = (String) keys.nextElement();
					String value = properties.getProperty(key);
					i18nMap.put(key, value);
				}
				resourceBundleMap.put(language, i18nMap);
			} catch (Exception e) {
				if(log.isErrorEnabled()) log.error("加载properties失败！..." + e.getMessage());
				e.printStackTrace();
			} finally {
				try {
					if (inputStream != null) {
						inputStream.close();
					}
				} catch (IOException e) {
					if(log.isErrorEnabled()) log.error("加载properties后关闭失败！...");
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
