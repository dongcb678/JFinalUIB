package com.platform.tools;

import java.io.PrintWriter;
import java.util.Map;
import java.util.Set;

import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.ext.jfinal.BeetlRenderFactory;

import com.platform.beetl.render.MyBeetlRenderFactory;

/**
 * Beetl工具类
 * @author 董华健
 */
public abstract class ToolBeetl {
	
	/**
	 * 生成静态html
	 * @param ftlPath 模板路径
	 * @param paramMap 参数
	 * @param htmlPath html文件保存路径
	 */
	public static void makeHtml(String tlPath, Map<String, Object> paramMap, String htmlPath) {
		PrintWriter pw = null;
		try {
			GroupTemplate groupTemplate = BeetlRenderFactory.groupTemplate;
			if(groupTemplate == null){
				groupTemplate = new BeetlRenderFactory().groupTemplate;
			}
			MyBeetlRenderFactory.regiseter();
			
			Template template = groupTemplate.getTemplate(tlPath);
			
			//添加数据到上下文中
            Set<String> keys = paramMap.keySet();
            for (String key : keys) {
            	template.binding(key, paramMap.get(key));
			}

            pw = new PrintWriter(htmlPath);
            template.renderTo(pw);//template.renderTo(os);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	if(pw != null ){
        		pw.close();
        	}
        }
	}
	
}
