package com.platform.beetl.tag;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.beetl.core.Tag;

import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.platform.constant.ConstantWebContext;
import com.platform.mvc.param.Param;
import com.platform.plugin.I18NPlugin;

/**
 * 参数输出标签：支持select、radio、checkbox
 * 
 * @author 董华健
 */
public class ParamTag extends Tag {

	private static final Log log = Log.getLog(ParamTag.class);

	@SuppressWarnings("unchecked")
	@Override
	public void render() {
		try {
			Map<String, String> param = (Map<String, String>) args[1];

			if(log.isDebugEnabled()) log.debug("获取标签属性");

			String type = param.get("type") == null ? "" : param.get("type");
			
			String id = param.get("id") == null ? "" : param.get("id");
			String name = param.get("name") == null ? "" : param.get("name");
			
			String class_ = param.get("class") == null ? "" : param.get("class");
			String style = param.get("style") == null ? "" : param.get("style");

			String number = param.get("number") == null ? "" : param.get("number");
			String defaultnumber = param.get("defaultnumber") == null ? "" : param.get("defaultnumber");

			if(log.isDebugEnabled()) log.debug("参数标签属性：type=" + type + "，id=" + id + "，name=" + name + "，class_=" + class_
					+ "，style=" + style + "，number=" + number + "，defaultnumber=" + defaultnumber);
			
			if(type.equals("")){
				ctx.byteWriter.writeString(select(id, name, class_, style, number, defaultnumber));
				
			}else if(type.equals("select")){
				ctx.byteWriter.writeString(select(id, name, class_, style, number, defaultnumber));
				
			}else if(type.equals("radio")){
				ctx.byteWriter.writeString(radio(id, name, class_, style, number, defaultnumber));
				
			}else if(type.equals("checkbox")){
				ctx.byteWriter.writeString(checkbox(id, name, class_, style, number, defaultnumber));
				
			} else {
				ctx.byteWriter.writeString(select(id, name, class_, style, number, defaultnumber));
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 下拉标签
	 * @param id
	 * @param name
	 * @param class_
	 * @param style
	 * @param number
	 * @param defaultnumber
	 * @return
	 */
	private String select(String id, String name, String class_, String style, String number, String defaultnumber){
		StringBuilder sb = new StringBuilder();
		if (StrKit.notBlank(id)) {
			sb.append("<select id=\"").append(id).append("\" name=\"").append(name);
			sb.append("\" class=\"").append(class_).append("\" style=\"").append(style).append("\" >");
		} else {
			sb.append("<select name=\"").append(name).append("\" class=\"").append(class_);
			sb.append("\" style=\"").append(style).append("\" >");
		}

		Param parentParam = Param.dao.cacheGet(number);
		String parentI18n = parentParam.getStr("i18n");
		
		String val = "val";
		if(null != parentI18n && parentI18n.equals("1")){
			String localePram = (String) ctx.getGlobal(ConstantWebContext.request_localePram);
			val += I18NPlugin.columnSuffix(localePram);
		}
		List<Param> paramList = Param.dao.cacheGetChild(number);

		for (Param param : paramList) {
			String status = param.getStr("status");
			String numbersTemp = param.getStr("numbers");
			String namesTemp = param.getStr("names");
			String valueTemp = param.getStr(val);
			if(null == status || status.equals("0")){
				if(log.isDebugEnabled()) log.debug("参数" + numbersTemp + "已经停用");
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
	 * @param class_
	 * @param style
	 * @param number
	 * @param defaultnumber
	 * @return
	 */
	private String radio(String id, String name, String class_, String style, String number, String defaultnumber){
		StringBuilder sb = new StringBuilder();
		
		Param parentParam = Param.dao.cacheGet(number);
		String parentI18n = parentParam.getStr("i18n");
		
		String val = "val";
		if(null != parentI18n && parentI18n.equals("1")){
			String localePram = (String) ctx.getGlobal(ConstantWebContext.request_localePram);
			val += I18NPlugin.columnSuffix(localePram);
		}
		List<Param> paramList = Param.dao.cacheGetChild(number);

		for (Param param : paramList) {
			String status = param.getStr("status");
			String numbersTemp = param.getStr("numbers");
			String namesTemp = param.getStr("names");
			String valueTemp = param.getStr(val);
			if(null == status || status.equals("0")){
				if(log.isDebugEnabled()) log.debug("参数" + numbersTemp + "已经停用");
				continue;
			}
			if (null != defaultnumber && null != valueTemp && defaultnumber.equals(numbersTemp)) {// 默认选中
				sb.append(namesTemp).append("<input type=\"radio\" id=\"").append(id).append(paramList.indexOf(param)).append("\" name=\"").append(name)
				.append("\" value=\"").append(valueTemp).append("\" class=\"").append(class_).append("\" style=\"").append(style).append("\" checked=\"checked\" >");
				
			} else {
				sb.append(namesTemp).append("<input type=\"radio\" id=\"").append(id).append(paramList.indexOf(param)).append("\" name=\"").append(name)
				.append("\" value=\"").append(valueTemp).append("\" class=\"").append(class_).append("\" style=\"").append(style).append("\" >");
			}
		}
		sb.append("</select>");
		
		return sb.toString();
	}

	/**
	 * 多选
	 * @param id
	 * @param name
	 * @param class_
	 * @param style
	 * @param number
	 * @param defaultnumber
	 * @return
	 */
	private String checkbox(String id, String name, String class_, String style, String number, String defaultnumber){
		StringBuilder sb = new StringBuilder();
		
		Param parentDict = Param.dao.cacheGet(number);
		String parentI18n = parentDict.getStr("i18n");
		
		String val = "val";
		if(null != parentI18n && parentI18n.equals("1")){
			String localePram = (String) ctx.getGlobal(ConstantWebContext.request_localePram);
			val += I18NPlugin.columnSuffix(localePram);
		}
		List<Param> paramList = Param.dao.cacheGetChild(number);

		for (Param param : paramList) {
			String status = param.getStr("status");
			String numbersTemp = param.getStr("numbers");
			String namesTemp = param.getStr("names");
			String valueTemp = param.getStr(val);
			if(null == status || status.equals("0")){
				if(log.isDebugEnabled()) log.debug("参数" + numbersTemp + "已经停用");
				continue;
			}
			if (null != defaultnumber && null != valueTemp && defaultnumber.equals(numbersTemp)) {// 默认选中
				sb.append(namesTemp).append("<input type=\"checkbox\" id=\"").append(id).append(paramList.indexOf(param)).append("\" name=\"").append(name)
				.append("\" value=\"").append(valueTemp).append("\" class=\"").append(class_).append("\" style=\"").append(style).append("\" checked=\"checked\" >");
				
			} else {
				sb.append(namesTemp).append("<input type=\"checkbox\" id=\"").append(id).append(paramList.indexOf(param)).append("\" name=\"").append(name)
				.append("\" value=\"").append(valueTemp).append("\" class=\"").append(class_).append("\" style=\"").append(style).append("\" >");
			}
		}
		sb.append("</select>");
		
		return sb.toString();
	}
}
