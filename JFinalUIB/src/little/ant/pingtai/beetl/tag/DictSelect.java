package little.ant.pingtai.beetl.tag;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.model.BaseModel;
import little.ant.pingtai.model.Dict;
import little.ant.pingtai.thread.ThreadParamInit;

import org.apache.log4j.Logger;
import org.beetl.core.Tag;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 字典select
 * 
 * @author 董华健
 */
public class DictSelect extends Tag {

	private static Logger log = Logger.getLogger(DictSelect.class);

	@SuppressWarnings("unchecked")
	@Override
	public void render() {
		try {
			Map<String, String> param = (Map<String, String>) args[1];

			log.debug("获取标签属性");

			String id = param.get("id");
			String name = param.get("name");

			String classs = param.get("classs");
			String style = param.get("style");

			String number = param.get("number");
			String defaultnumber = param.get("defaultnumber");

			log.debug("组装select标签");

			StringBuilder sb = new StringBuilder();
			if (null != id && !id.isEmpty()) {
				sb.append("<select id=\"").append(id).append("\" name=\"").append(name);
				sb.append("\" class=\"").append(classs).append("\" style=\"").append(style).append("\" >");
			} else {
				sb.append("<select name=\"").append(name).append("\" class=\"").append(classs);
				sb.append("\" style=\"").append(style).append("\" >");
			}

			Dict parentDict = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict + number);
			String parentI18n = parentDict.getStr("i18n");
			
			String val = "val";
			if(null != parentI18n && parentI18n.equals("1")){
				String localePram = (String) ctx.getGlobal("localePram");
				val += BaseModel.i18n(localePram);
			}
			List<Dict> dictList = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_dict_child + number);

			for (Dict dict : dictList) {
				String numbersTemp = dict.getStr("numbers");
				String namesTemp = dict.getStr("names");
				String valueTemp = dict.getStr(val);
				if (null != defaultnumber && null != valueTemp && defaultnumber.equals(numbersTemp)) {// 默认选中
					sb.append("<option value=\"").append(valueTemp).append("\" selected=\"selected\">");
					sb.append(namesTemp);
					sb.append("</option>");

				} else {
					sb.append("<option value=\"").append(valueTemp).append("\">");
					sb.append(namesTemp);
					sb.append("</option>");
				}
			}
			sb.append("</select>");

			ctx.byteWriter.writeString(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
