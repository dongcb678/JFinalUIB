package com.platform.beetl.func;

import java.text.MessageFormat;
import java.util.LinkedList;
import java.util.Map;

import org.beetl.core.Context;
import org.beetl.core.Function;

import com.jfinal.log.Log;
import com.platform.constant.ConstantWebContext;

/**
 * 国际化输出
 * @author 董华健
 * 
 * 说明：beetl本身自带了strutil.format ${ strutil.format (“hello,{0}, my age is {1}”,”joeli”,15),输出是hello,joelli, my age is 15. 具体请参考
 * http://docs.oracle.com/javase/6/docs/api/java/text/MessageFormat.html
 */
public class I18nFormat implements Function {

	private static final Log log = Log.getLog(I18nFormat.class);
	
	/**
	 * 过滤xml文档函数实现
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Object call(Object[] arg, Context context) {
		if(arg.length == 0){
			if(log.isErrorEnabled()) log.error("I18nFormat参数为空");
			return null;
		}
		
		// 第一个参数时国际化模板的key
		Map<String, String> i18nMap = (Map<String, String>) context.getGlobal(ConstantWebContext.request_i18nMap);
		String formatTemplateKey = (String) arg[0];
		String formatTemplate = i18nMap.get(formatTemplateKey);
		
		// 格式化参数数据
		LinkedList<Object> paramValue = new LinkedList<Object>();
		for (int i = 1, length = arg.length; i < length; i++) {
			paramValue.add(arg[i]);
		}

		// 格式化
		//String value = String.format(formatTemplate, paramValue.toArray());	// %s %d ...
		String value = MessageFormat.format(formatTemplate, paramValue.toArray());	// {0} {1} ...
		
		return value;
	}

}
