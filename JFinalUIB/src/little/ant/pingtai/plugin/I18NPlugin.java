package little.ant.pingtai.plugin;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;

public class I18NPlugin implements IPlugin {

    protected final Logger log = Logger.getLogger(getClass());

	private static final Map<String, Map<String, String>> resourceBundleMap = new HashMap<String, Map<String, String>>();

	private static final String[] languages = {
		"zh", "zh_CN", 
		"en", "en_US"
	};
	
	public static Map<String, String> get(String localePramKey){
		return resourceBundleMap.get(localePramKey);
	}
	
	@Override
	public boolean start() {
		for (String language : languages) {
			String country = null;
			Locale locale = null;
			if(language.equals("zh")){
				country = "CN";
				locale = new Locale(language, country);
			
			}else if(language.equals("en")){
				country = "US";
				locale = new Locale(language, country);
			
			}else{
				locale = new Locale(language);
			}
			
			ResourceBundle resourceBundle = ResourceBundle.getBundle("message", locale);
			Enumeration<String> keys = resourceBundle.getKeys();
			Map<String, String> i18nMap = new HashMap<String, String>();
			while (keys.hasMoreElements()) {
				String key = (String) keys.nextElement();
				String value = resourceBundle.getString(key);
				i18nMap.put(key, value);
			}
			resourceBundleMap.put(language, i18nMap);
		}
		return true;
	}

	@Override
	public boolean stop() {
		return true;
	}

}
