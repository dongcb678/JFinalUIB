package little.ant.pingtai.plugin;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;

/**
 * 初始化I18N数据信息的加载
 * @author 董华健
 */
public class I18NPlugin implements IPlugin {

    protected final Logger log = Logger.getLogger(getClass());

	private static final Map<String, Map<String, String>> resourceBundleMap = new HashMap<String, Map<String, String>>();
	
	public static Map<String, String> get(String localePramKey){
		if(localePramKey.equals("zh")){
			localePramKey = "zh_cn";
			
		}else if(localePramKey.equals("en")){
			localePramKey = "en_us";
		
		}else{
			localePramKey = "zh_cn";
		}
		
		Map<String, String> map = resourceBundleMap.get(localePramKey);
		if(map != null){
			return map;
		}else{
			return resourceBundleMap.get("zh_cn");
		}
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
		
		for (String language : languages) {
			Properties properties = new Properties();
			InputStream inputStream = null;
			try {
				//inputStream = this.getClass().getClassLoader().getResourceAsStream(filePath);
				inputStream = I18NPlugin.class.getResourceAsStream("/message_" + language + ".properties");// "/init.properties"
				properties.load(inputStream);
				
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
