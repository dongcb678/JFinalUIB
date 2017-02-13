package com.platform.tools;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.beetl.core.BeetlKit;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.ext.jfinal3.JFinal3BeetlRenderFactory;

import com.jfinal.log.Log;
import com.platform.beetl.format.DateFormat;
import com.platform.beetl.func.AuthUrl;
import com.platform.beetl.func.EscapeHtml;
import com.platform.beetl.func.I18nFormat;
import com.platform.beetl.func.OrderBy;
import com.platform.beetl.func.UnEscapeHtml;
import com.platform.beetl.tag.DictTag;
import com.platform.beetl.tag.ParamTag;
import com.platform.constant.ConstantInit;
import com.platform.dto.DataBase;

/**
 * Beetl工具类
 * @author 董华健
 */
public abstract class ToolBeetl {

	private static final Log log = Log.getLog(ToolBeetl.class);

	public static final JFinal3BeetlRenderFactory brf = new JFinal3BeetlRenderFactory();
	
	/**
	 * 模板扩展
	 */
	public static GroupTemplate regiseter(){
		DataBase dataBase = ToolDataBase.getDbMap(ConstantInit.db_dataSource_main);
		String db_type = dataBase.getType();
		
		Map<String, Object> sharedVars = new HashMap<String, Object>();
		sharedVars.put("db_type", db_type);
		
		if(log.isDebugEnabled()) log.debug("注册全局web视图模板解析");
		GroupTemplate mainGT = brf.groupTemplate;
		if(mainGT == null){
			JFinal3BeetlRenderFactory brfTemp = new JFinal3BeetlRenderFactory();
			brfTemp.config();
			mainGT = brfTemp.groupTemplate;
		}
		mainGT.registerFunction("authUrl", new AuthUrl());
		mainGT.registerFunction("orderBy", new OrderBy());
		mainGT.registerFunction("escapeHtml", new EscapeHtml());
		mainGT.registerFunction("unEscapeHtml", new UnEscapeHtml());
		mainGT.registerFunction("i18nFormat", new I18nFormat());
		mainGT.registerTag("dict", DictTag.class);
		mainGT.registerTag("param", ParamTag.class);
		mainGT.registerFormat("dateFormat", new DateFormat());
		mainGT.setSharedVars(sharedVars);

		if(log.isDebugEnabled()) log.debug("注册全局BeetlKit模板解析");
		GroupTemplate kitGT = BeetlKit.gt;
		kitGT.registerFunction("authUrl", new AuthUrl());
		kitGT.registerFunction("orderBy", new OrderBy());
		kitGT.registerFunction("escapeHtml", new EscapeHtml());
		kitGT.registerFunction("unEscapeHtml", new UnEscapeHtml());
		kitGT.registerFunction("i18nFormat", new I18nFormat());
		kitGT.registerTag("dict", DictTag.class);
		kitGT.registerTag("param", ParamTag.class);
		kitGT.registerFormat("dateFormat", new DateFormat());
		kitGT.setSharedVars(sharedVars);
		
		return mainGT;
	}
	
	/**
	 * 生成静态html
	 * @param ftlPath 模板路径
	 * @param paramMap 参数
	 * @param htmlPath html文件保存路径
	 */
	public static void makeHtml(String tlPath, Map<String, Object> paramMap, String htmlPath) {
		PrintWriter pw = null;
		try {
			GroupTemplate groupTemplate = regiseter();
			
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
