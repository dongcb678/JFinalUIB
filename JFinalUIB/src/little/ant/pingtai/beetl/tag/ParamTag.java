package little.ant.pingtai.beetl.tag;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.model.BaseModel;
import little.ant.pingtai.model.ParamModel;
import little.ant.pingtai.thread.ThreadParamInit;

import org.apache.log4j.Logger;
import org.beetl.core.Tag;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 参数select
 * 
 * @author 董华健
 */
public class ParamTag extends Tag {

	private static Logger log = Logger.getLogger(ParamTag.class);

	@SuppressWarnings("unchecked")
	@Override
	public void render() {
		try {
			Map<String, String> param = (Map<String, String>) args[1];

			log.debug("获取标签属性");

			String type = param.get("type") == null ? "" : param.get("type");
			
			String id = param.get("id") == null ? "" : param.get("id");
			String name = param.get("name") == null ? "" : param.get("name");
			
			String classs = param.get("classs") == null ? "" : param.get("classs");
			String style = param.get("style") == null ? "" : param.get("style");

			String number = param.get("number") == null ? "" : param.get("number");
			String defaultnumber = param.get("defaultnumber") == null ? "" : param.get("defaultnumber");

			log.debug("参数标签");
			
			if(type.equals("")){
				ctx.byteWriter.writeString(select(id, name, classs, style, number, defaultnumber));
				
			}else if(type.equals("select")){
				ctx.byteWriter.writeString(select(id, name, classs, style, number, defaultnumber));
				
			}else if(type.equals("radio")){
				ctx.byteWriter.writeString(radio(id, name, classs, style, number, defaultnumber));
				
			}else if(type.equals("checkbox")){
				ctx.byteWriter.writeString(checkbox(id, name, classs, style, number, defaultnumber));
				
			} else {
				ctx.byteWriter.writeString(select(id, name, classs, style, number, defaultnumber));
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 下拉标签
	 * @param id
	 * @param name
	 * @param classs
	 * @param style
	 * @param number
	 * @param defaultnumber
	 * @return
	 */
	private String select(String id, String name, String classs, String style, String number, String defaultnumber){
		StringBuilder sb = new StringBuilder();
		if (null != id && !id.isEmpty()) {
			sb.append("<select id=\"").append(id).append("\" name=\"").append(name);
			sb.append("\" class=\"").append(classs).append("\" style=\"").append(style).append("\" >");
		} else {
			sb.append("<select name=\"").append(name).append("\" class=\"").append(classs);
			sb.append("\" style=\"").append(style).append("\" >");
		}

		ParamModel parentParam = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + number);
		String parentI18n = parentParam.getStr("i18n");
		
		String val = "val";
		if(null != parentI18n && parentI18n.equals("1")){
			String localePram = (String) ctx.getGlobal("localePram");
			val += BaseModel.i18n(localePram);
		}
		List<ParamModel> paramList = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + number);

		for (ParamModel param : paramList) {
			String status = param.getStr("status");
			String numbersTemp = param.getStr("numbers");
			String namesTemp = param.getStr("names");
			String valueTemp = param.getStr(val);
			if(null == status || status.equals("0")){
				log.debug("参数" + numbersTemp + "已经停用");
				continue;
			}
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
		
		return sb.toString();
	}

	/**
	 * 单选
	 * @param id
	 * @param name
	 * @param classs
	 * @param style
	 * @param number
	 * @param defaultnumber
	 * @return
	 */
	private String radio(String id, String name, String classs, String style, String number, String defaultnumber){
		StringBuilder sb = new StringBuilder();
		
		ParamModel parentParam = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + number);
		String parentI18n = parentParam.getStr("i18n");
		
		String val = "val";
		if(null != parentI18n && parentI18n.equals("1")){
			String localePram = (String) ctx.getGlobal("localePram");
			val += BaseModel.i18n(localePram);
		}
		List<ParamModel> paramList = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + number);

		for (ParamModel param : paramList) {
			String status = param.getStr("status");
			String numbersTemp = param.getStr("numbers");
			String namesTemp = param.getStr("names");
			String valueTemp = param.getStr(val);
			if(null == status || status.equals("0")){
				log.debug("参数" + numbersTemp + "已经停用");
				continue;
			}
			if (null != defaultnumber && null != valueTemp && defaultnumber.equals(numbersTemp)) {// 默认选中
				sb.append(namesTemp).append("<input type=\"radio\" id=\"").append(id).append(paramList.indexOf(param)).append("\" name=\"").append(name)
				.append("\" value=\"").append(valueTemp).append("\" class=\"").append(classs).append("\" style=\"").append(style).append("\" checked=\"checked\" >");
				
			} else {
				sb.append(namesTemp).append("<input type=\"radio\" id=\"").append(id).append(paramList.indexOf(param)).append("\" name=\"").append(name)
				.append("\" value=\"").append(valueTemp).append("\" class=\"").append(classs).append("\" style=\"").append(style).append("\" >");
			}
		}
		sb.append("</select>");
		
		return sb.toString();
	}

	/**
	 * 多选
	 * @param id
	 * @param name
	 * @param classs
	 * @param style
	 * @param number
	 * @param defaultnumber
	 * @return
	 */
	private String checkbox(String id, String name, String classs, String style, String number, String defaultnumber){
		StringBuilder sb = new StringBuilder();
		
		ParamModel parentDict = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + number);
		String parentI18n = parentDict.getStr("i18n");
		
		String val = "val";
		if(null != parentI18n && parentI18n.equals("1")){
			String localePram = (String) ctx.getGlobal("localePram");
			val += BaseModel.i18n(localePram);
		}
		List<ParamModel> paramList = CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + number);

		for (ParamModel param : paramList) {
			String status = param.getStr("status");
			String numbersTemp = param.getStr("numbers");
			String namesTemp = param.getStr("names");
			String valueTemp = param.getStr(val);
			if(null == status || status.equals("0")){
				log.debug("参数" + numbersTemp + "已经停用");
				continue;
			}
			if (null != defaultnumber && null != valueTemp && defaultnumber.equals(numbersTemp)) {// 默认选中
				sb.append(namesTemp).append("<input type=\"checkbox\" id=\"").append(id).append(paramList.indexOf(param)).append("\" name=\"").append(name)
				.append("\" value=\"").append(valueTemp).append("\" class=\"").append(classs).append("\" style=\"").append(style).append("\" checked=\"checked\" >");
				
			} else {
				sb.append(namesTemp).append("<input type=\"checkbox\" id=\"").append(id).append(paramList.indexOf(param)).append("\" name=\"").append(name)
				.append("\" value=\"").append(valueTemp).append("\" class=\"").append(classs).append("\" style=\"").append(style).append("\" >");
			}
		}
		sb.append("</select>");
		
		return sb.toString();
	}
}
