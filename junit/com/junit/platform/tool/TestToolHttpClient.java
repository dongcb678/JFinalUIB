package com.junit.platform.tool;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.client.CookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.junit.Test;

import com.jfinal.log.Log;
import com.platform.tools.ToolHttp;

public class TestToolHttpClient {

	private static final Log log = Log.getLog(TestToolHttpClient.class);

	/**
	 * 方法1：建议使用此方法
	 * cookie的有效期是15天，过期失效需要重新登录获取cookie对象
	 */
	@Test
	public void cookie(){
		// 1.构造登陆参数
		Map<String, String> loginParam = new HashMap<String, String>();
		loginParam.put("username", "admins");	// 登陆账号
		loginParam.put("password", "000000");	// 登陆密码
		loginParam.put("returnText", "true");	// 返回文本，好识别
		
		// 2.登陆后构建cookie认证对象,有效期是15天，过期失效需要重新登录获取cookie对象
		CookieStore cookieStore = ToolHttp.mockCookie("http://127.0.0.1:99/platform/login/vali", loginParam);
		if(cookieStore == null){
			log.error("登陆失败");
		}
		
		// 3.构造数据请求参数
		Map<String, String> postParam = new HashMap<String, String>();
		//postParam.put("xxx", "xxx");
		//postParam.put("xxx", "xxx");
		
		// 4.进行数据请求
		String content = ToolHttp.mockPostByCookie(cookieStore, "http://127.0.0.1:99/platform/index", postParam);
		if(content.indexOf("/platform/login/login.html") != -1){
			log.error("需要重新登录，认证码失效");
		}
		
		// 5.输出响应正文数据
		System.out.println("----------------------");
		System.out.println(content);
		System.out.println("----------------------");
	}

	/**
	 * 方法2：建议使用此方法
	 * cookie的有效期是15天，过期失效需要重新登录获取cookie对象
	 */
	@Test
	public void header(){
		// 1.构造登陆参数
		Map<String, String> loginParam = new HashMap<String, String>();
		loginParam.put("username", "admins");	// 登陆账号
		loginParam.put("password", "000000");	// 登陆密码
		loginParam.put("returnText", "true");	// 返回文本，好识别
		
		
		// 2.登陆后构建cookie认证对象,有效期是15天，过期失效需要重新登录获取cookie对象
		String authmark = ToolHttp.mockHeader("http://127.0.0.1:99/platform/login/vali", loginParam);
		if(authmark == null){
			log.error("登陆失败");
		}
		
		// 3.构造数据请求参数
		Map<String, String> postParam = new HashMap<String, String>();
		//postParam.put("xxx", "xxx");
		//postParam.put("xxx", "xxx");
		
		// 4.进行数据请求
		String content = ToolHttp.mockPostByHeader(authmark, "http://127.0.0.1:99/platform/index", postParam);
		if(content.indexOf("/platform/login/login.html") != -1){
			log.error("需要重新登录，认证码失效");
		}
		
		// 5.输出响应正文数据
		System.out.println("----------------------");
		System.out.println(content);
		System.out.println("----------------------");
	}

	/**
	 * 方法3：不建议这样使用
	 * 保存登陆后的CloseableHttpClient对象，里面包含cookie认证信息，可以继续访问其他url，无需再自己构造cookie
	 * CloseableHttpClient中的cookie的有效期也是15天，过期失效需要重新登录获取CloseableHttpClient对象
	 */
	@Test
	public void closeableHttpClient(){
		Map<String, String> loginParam = new HashMap<String, String>();
		loginParam.put("username", "admins");	// 登陆账号
		loginParam.put("password", "000000");	// 登陆密码
		loginParam.put("returnText", "true");	// 返回文本，好识别
		
		CloseableHttpClient client = ToolHttp.mocklogin("http://127.0.0.1:99/platform/login/vali", loginParam);
		if(client == null){
			log.error("登陆失败");
		}

		Map<String, String> postParam = new HashMap<String, String>();
//		postParam.put("xxx", "xxx");
//		postParam.put("xxx", "xxx");
		String content = ToolHttp.mockPostByClient(client, "http://127.0.0.1:99/platform/index", postParam);
		if(content.indexOf("/platform/login/login.html") != -1){
			log.error("需要重新登录，认证码失效");
		}
		
		// 输出响应正文数据
		System.out.println("----------------------");
		System.out.println(content);
		System.out.println("----------------------");
		
		try {
			client.close(); // 记得关闭CloseableHttpClient
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

}
