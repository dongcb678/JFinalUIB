package com.platform.tools;

import java.util.Map;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import com.jfinal.log.Log;

/**
 * script工具类
 * @author 董华健
 */
public abstract class ToolScript {

	private static final Log log = Log.getLog(ToolScript.class);

	/**
	 * 渲染模板
	 * @param templateContent
	 * @param paramMap
	 * @return
	 */
	public static String render(String templateContent, Map<String, Object> paramMap) {
		ScriptEngineManager manager = new ScriptEngineManager();
		// 建立javascript脚本引擎
		ScriptEngine engine = manager.getEngineByName("javascript");
		try {
			// 将变量和变量值传给javascript脚本
			for (String key : paramMap.keySet()) {
				engine.put(key, paramMap.get(key));
			}

			// 开始执行脚本
			engine.eval(templateContent);
			
			// 编译执行，执行单个函数
//			if (engine instanceof Compilable){
//				Compilable compEngine = (Compilable)engine;
//				compEngine.compile(templateContent);
//			}
			
			// 执行多个函数
//			if (engine instanceof Invocable){
//				engine.eval(templateContent);
//				Invocable invokeEngine = (Invocable)engine;
//				Object o = invokeEngine.invokeFunction("funcName", "funcParam1", "funcParam2");
//			}
			
			// 异步调用
//			Invocable invokeEngine = (Invocable)engine;
//			Runnable runner = invokeEngine.getInterface(Runnable.class);
//			Thread t = new Thread(runner);
//			t.start();
//			t.join();
			
		} catch (ScriptException e) {
			if(log.isErrorEnabled()) log.error("执行脚本异常");
		}
//		} catch (NoSuchMethodException e) {
//			if(log.isErrorEnabled()) log.error("执行脚本异常");
//		}
		
		// 取js变量值
		String output = (String) engine.get("output");

		return output;
	}
	
	/**
	 * 生成静态html
	 * @param tlPath 模板路径
	 * @param paramMap 参数
	 * @param htmlPath html文件保存路径
	 */
	public static void makeHtml(String tlPath, Map<String, Object> paramMap, String htmlPath) {
		String html = render(tlPath, paramMap);
		ToolDirFile.createFile(htmlPath, html);
	}
	
}
