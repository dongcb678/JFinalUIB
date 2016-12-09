package com.platform.mvc.jsonp;

import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;

@Controller("/jsonp")
public class JsonpController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(JsonpController.class);

	public void index() {
		// 客户端请求参数，js函数名称
		String jsonpCallback = getPara("callback"); 
		
		// json数据
		String json = "{'content':'我是远程b.com/remote.js带来的数据'}"; 
		
		// 返回jsonp格式数据
		renderJavascript(jsonpCallback + "(" + json + ");"); 
	}
	
}