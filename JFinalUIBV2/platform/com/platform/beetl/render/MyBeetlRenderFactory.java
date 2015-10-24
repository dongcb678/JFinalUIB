package com.platform.beetl.render;

import org.apache.log4j.Logger;
import org.beetl.ext.jfinal.BeetlRender;
import org.beetl.ext.jfinal.BeetlRenderFactory;

import com.jfinal.render.Render;
import com.platform.beetl.format.DateFormat;
import com.platform.beetl.func.AuthUrl;
import com.platform.beetl.func.EscapeXml;
import com.platform.beetl.func.I18nFormat;
import com.platform.beetl.func.OrderBy;
import com.platform.beetl.tag.DictTag;
import com.platform.beetl.tag.ParamTag;

/**
 * 继承BeetlRenderFactory，调用MyBeetlRender，实现视图耗时计算
 * @author 董华健
 */
public class MyBeetlRenderFactory extends BeetlRenderFactory {
	
	private static Logger log = Logger.getLogger(MyBeetlRenderFactory.class);

	public Render getRender(String view) {
		log.debug("MyBeetlRenderFactory start");
		BeetlRender render = new MyBeetlRender(groupTemplate, view);
		log.debug("MyBeetlRenderFactory end");
		return render;
	}

	public String getViewExtension() {
		return ".html";
	}
	
	/**
	 * 注册扩展函数
	 */
	public static void regiseter(){
		groupTemplate.registerFunction("authUrl", new AuthUrl());
		groupTemplate.registerFunction("orderBy", new OrderBy());
		groupTemplate.registerFunction("escapeXml", new EscapeXml());
		groupTemplate.registerFunction("i18nFormat", new I18nFormat());
		groupTemplate.registerTag("dict", DictTag.class);
		groupTemplate.registerTag("param", ParamTag.class);
		groupTemplate.registerFormat("dateFormat", new DateFormat());
	}
}
