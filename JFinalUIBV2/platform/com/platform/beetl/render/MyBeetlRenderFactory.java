package com.platform.beetl.render;

import org.apache.log4j.Logger;
import org.beetl.ext.jfinal.BeetlRender;
import org.beetl.ext.jfinal.BeetlRenderFactory;

import com.jfinal.render.Render;

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

}
