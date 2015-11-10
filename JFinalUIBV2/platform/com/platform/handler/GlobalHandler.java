package com.platform.handler;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.jfinal.handler.Handler;
import com.jfinal.kit.PropKit;
import com.platform.constant.ConstantInit;
import com.platform.constant.ConstantWebContext;
import com.platform.mvc.syslog.Syslog;
import com.platform.plugin.I18NPlugin;
import com.platform.thread.ThreadSysLog;
import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolRandoms;
import com.platform.tools.ToolWeb;

/**
 * 全局Handler，设置一些通用功能
 * @author 董华健
 * 描述：主要是一些全局变量的设置，再就是日志记录开始和结束操作
 */
public class GlobalHandler extends Handler {
	
	private static Logger log = Logger.getLogger(GlobalHandler.class);

	@Override
	public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
		log.info("初始化访问系统功能日志");
		Syslog reqSysLog = getSysLog(request);
		long starttime = ToolDateTime.getDateByTime();
		reqSysLog.set(Syslog.column_startdate, ToolDateTime.getSqlTimestamp(starttime));//开始时间
		request.setAttribute(ConstantWebContext.reqSysLogKey, reqSysLog);
		
		log.info("设置 web 路径");
		String cxt = ToolWeb.getContextPath(request);
		request.setAttribute(ConstantWebContext.request_cxt, cxt);

		log.info("request 随机分配一个请求id");
		request.setAttribute(ConstantWebContext.request_id, ToolRandoms.getUuid(true));
		
		log.debug("request cookie 处理");
		Map<String, Cookie> cookieMap = ToolWeb.readCookieMap(request);
		request.setAttribute(ConstantWebContext.request_cookieMap, cookieMap);

		log.debug("request param 请求参数处理");
		request.setAttribute(ConstantWebContext.request_paramMap, ToolWeb.getParamMap(request));

		log.debug("request 国际化");
		String localePram = request.getParameter(ConstantWebContext.request_localePram);
		if(null != localePram && !localePram.isEmpty()){
			int maxAge = PropKit.getInt(ConstantInit.config_maxAge_key);
			ToolWeb.addCookie(response,  "", "/", true, ConstantWebContext.cookie_language, localePram, maxAge);
		}else {
			localePram = ToolWeb.getCookieValueByName(request, ConstantWebContext.cookie_language);
			if(null == localePram || localePram.isEmpty()){
				Locale locale = request.getLocale();
				String language = locale.getLanguage();
				localePram = language;
				String country = locale.getCountry();
				if(null != country && !country.isEmpty()){
					localePram += "_" + country;
				}
			}
		}
		localePram = localePram.toLowerCase();
		Map<String, String> i18nMap = I18NPlugin.get(localePram);
		request.setAttribute(ConstantWebContext.request_localePram, localePram);
		request.setAttribute(ConstantWebContext.request_i18nMap, i18nMap);
		
		log.info("设置Header");
		request.setAttribute("decorator", "none");
		response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
		
		nextHandler.handle(target, request, response, isHandled);
		
		log.info("请求处理完毕，计算耗时");
		
		// 结束时间
		long endtime = ToolDateTime.getDateByTime();
		reqSysLog.set(Syslog.column_enddate, ToolDateTime.getSqlTimestamp(endtime));
		
		// 总耗时
		Long haoshi = endtime - starttime;
		reqSysLog.set(Syslog.column_haoshi, haoshi);
		
		// 视图耗时
		long renderTime = 0;
		if(null != request.getAttribute(ConstantWebContext.renderTimeKey)){
			renderTime = (long) request.getAttribute(ConstantWebContext.renderTimeKey);
		}
		reqSysLog.set(Syslog.column_viewhaoshi, renderTime);
		
		// action耗时
		reqSysLog.set(Syslog.column_actionhaoshi, haoshi - renderTime);
		
		log.info("日志添加到入库队列");
		ThreadSysLog.add(reqSysLog);
	}
	
	/**
	 * 创建日志对象,并初始化一些属性值
	 * @param request
	 * @return
	 */
	public Syslog getSysLog(HttpServletRequest request){
		String requestPath = ToolWeb.getRequestURIWithParam(request); 
		String ip = ToolWeb.getIpAddr(request);
		String referer = request.getHeader("Referer"); 
		String userAgent = request.getHeader("User-Agent");
		String cookie = request.getHeader("Cookie");
		String method = request.getMethod();
		String xRequestedWith = request.getHeader("X-Requested-With");
		String host = request.getHeader("Host");
		String acceptLanguage = request.getHeader("Accept-Language");
		String acceptEncoding = request.getHeader("Accept-Encoding");
		String accept = request.getHeader("Accept");
		String connection = request.getHeader("Connection");

		Syslog reqSysLog = new Syslog();
		
		reqSysLog.set(Syslog.column_ips, ip);
		reqSysLog.set(Syslog.column_requestpath, requestPath);
		reqSysLog.set(Syslog.column_referer, referer);
		reqSysLog.set(Syslog.column_useragent, userAgent);
		reqSysLog.set(Syslog.column_cookie, cookie);
		reqSysLog.set(Syslog.column_method, method);
		reqSysLog.set(Syslog.column_xrequestedwith, xRequestedWith);
		reqSysLog.set(Syslog.column_host, host);
		reqSysLog.set(Syslog.column_acceptlanguage, acceptLanguage);
		reqSysLog.set(Syslog.column_acceptencoding, acceptEncoding);
		reqSysLog.set(Syslog.column_accept, accept);
		reqSysLog.set(Syslog.column_connection, connection);

		return reqSysLog;
	}
	
}
