package little.ant.platform.tools;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * WEB工具类
 * @author 董华健 2012-9-3 下午7:39:43
 */
public class ToolWeb {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ToolWeb.class);

	/**
	 * 获取客户端IP地址
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	/**
	 * 获取上下文URL全路径
	 * 
	 * @param request
	 * @return
	 */
	public static String getContextPath(HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		sb.append(request.getScheme()).append("://").append(request.getServerName()).append(":").append(request.getServerPort()).append(request.getContextPath());
		String path = sb.toString();
		sb = null;
		return path;
	}

	/**
	 * 获取完整请求路径(含内容路径及请求参数)
	 * 
	 * @param request
	 * @return
	 */
	public static String getRequestURIWithParam(HttpServletRequest request) {
		return request.getRequestURI() + (request.getQueryString() == null ? "" : "?" + request.getQueryString());
	}
	
	/**
	 * 获取ParameterMap
	 * @param request
	 * @return
	 */
	public static Map<String, String> getParamMap(HttpServletRequest request){
		Map<String, String> map = new HashMap<String, String>();
		Enumeration<String> enume = request.getParameterNames();
		while (enume.hasMoreElements()) {
			String name = (String) enume.nextElement();
			map.put(name, request.getParameter(name));
		}
		return map;
	}

	/**
	 * 
	 * @param response
	 * @param domain		设置cookie所在域
	 * @param path			设置cookie所在路径
	 * @param isHttpOnly	是否只读
	 * @param name			cookie的名称
	 * @param value			cookie的值
	 * @param maxAge		cookie存放的时间(以秒为单位,假如存放三天,即3*24*60*60; 如果值为0,cookie将随浏览器关闭而清除)
	 */
	public static void addCookie(HttpServletResponse response, 
			String domain, String path, boolean isHttpOnly, 
			String name, String value, int maxAge) {
		Cookie cookie = new Cookie(name, value);

		// 所在域：比如a1.4bu4.com 和 a2.4bu4.com 共享cookie
		if(null != domain && !domain.isEmpty()){
			cookie.setDomain(domain);			
		}
		
		// 设置cookie所在路径
		cookie.setPath("/");
		if(null != path && !path.isEmpty()){
			cookie.setPath(path);				
		}
		
		// 是否只读
		cookie.setHttpOnly(isHttpOnly);
		
		// 设置cookie的过期时间
		if (maxAge > 0){
			cookie.setMaxAge(maxAge);
		}
		
		// 添加cookie
		response.addCookie(cookie);
	}

	/**
	 * 获取cookie的值
	 * 
	 * @param request
	 * @param name
	 *            cookie的名称
	 * @return
	 */
	public static String getCookieValueByName(HttpServletRequest request, String name) {
		Map<String, Cookie> cookieMap = ToolWeb.readCookieMap(request);
		// 判断cookie集合中是否有我们像要的cookie对象 如果有返回它的值
		if (cookieMap.containsKey(name)) {
			Cookie cookie = (Cookie) cookieMap.get(name);
			return cookie.getValue();
		} else {
			return null;
		}
	}

	/**
	 * 获得cookie
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	public static Cookie getCookieByName(HttpServletRequest request, String name) {
		Map<String, Cookie> cookieMap = ToolWeb.readCookieMap(request);
		// 判断cookie集合中是否有我们像要的cookie对象 如果有返回它的值
		if (cookieMap.containsKey(name)) {
			Cookie cookie = (Cookie) cookieMap.get(name);
			return cookie;
		} else {
			return null;
		}
	}

	/**
	 * 获得所有cookie
	 * 
	 * @param request
	 * @return
	 */
	public static Map<String, Cookie> readCookieMap(HttpServletRequest request) {
		Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
		// 从request范围中得到cookie数组 然后遍历放入map集合中
		Cookie[] cookies = request.getCookies();
		if (null != cookies) {
			for (int i = 0; i < cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
		return cookieMap;
	}

	/**
	 * 去除HTML代码
	 * 
	 * @param inputString
	 * @return
	 */
	public static String HtmltoText(String inputString) {
		String htmlStr = inputString; // 含HTML标签的字符串
		String textStr = "";
		java.util.regex.Pattern p_script;
		java.util.regex.Matcher m_script;
		java.util.regex.Pattern p_style;
		java.util.regex.Matcher m_style;
		java.util.regex.Pattern p_html;
		java.util.regex.Matcher m_html;
		java.util.regex.Pattern p_ba;
		java.util.regex.Matcher m_ba;

		try {
			String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; // 定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script>
																										// }
			String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; // 定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style>
																									// }
			String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
			String patternStr = "\\s+";

			p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
			m_script = p_script.matcher(htmlStr);
			htmlStr = m_script.replaceAll(""); // 过滤script标签

			p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
			m_style = p_style.matcher(htmlStr);
			htmlStr = m_style.replaceAll(""); // 过滤style标签

			p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
			m_html = p_html.matcher(htmlStr);
			htmlStr = m_html.replaceAll(""); // 过滤html标签

			p_ba = Pattern.compile(patternStr, Pattern.CASE_INSENSITIVE);
			m_ba = p_ba.matcher(htmlStr);
			htmlStr = m_ba.replaceAll(""); // 过滤空格

			textStr = htmlStr;

		} catch (Exception e) {
			System.err.println("Html2Text: " + e.getMessage());
		}
		return textStr;// 返回文本字符串
	}

	/**
	 * 把页面的信息替换成我们想要的信息存放数据库里面
	 * 
	 * @param sourcestr
	 *            页面得到的信息
	 * @return
	 */
	public static String getHTMLToString(String sourcestr) {
		if (sourcestr == null) {
			return "";
		}
		sourcestr = sourcestr.replaceAll("\\x26", "&amp;");// &
		sourcestr = sourcestr.replaceAll("\\x3c", "&lt;");// <
		sourcestr = sourcestr.replaceAll("\\x3e", "&gt;");// >
		sourcestr = sourcestr.replaceAll("\\x09", "&nbsp;&nbsp;&nbsp;&nbsp;");// tab键
		sourcestr = sourcestr.replaceAll("\\x20", "&nbsp;");// 空格
		sourcestr = sourcestr.replaceAll("\\x22", "&quot;");// "

		sourcestr = sourcestr.replaceAll("\r\n", "<br>");// 回车换行
		sourcestr = sourcestr.replaceAll("\r", "<br>");// 回车
		sourcestr = sourcestr.replaceAll("\n", "<br>");// 换行
		return sourcestr;
	}

	/**
	 * 把数据库里面的信息回显到页面上
	 * 
	 * @param sourcestr
	 *            数据库取得的信息
	 * @return
	 */
	public static String getStringToHTML(String sourcestr) {
		if (sourcestr == null) {
			return "";
		}
		sourcestr = sourcestr.replaceAll("&amp;", "\\x26");// &
		sourcestr = sourcestr.replaceAll("&lt;", "\\x3c");// <
		sourcestr = sourcestr.replaceAll("&gt;", "\\x3e");// >
		sourcestr = sourcestr.replaceAll("&nbsp;&nbsp;&nbsp;&nbsp;", "\\x09");// tab键
		sourcestr = sourcestr.replaceAll("&nbsp;", "\\x20");// 空格
		sourcestr = sourcestr.replaceAll("&quot;", "\\x22");// "

		sourcestr = sourcestr.replaceAll("<br>", "\r\n");// 回车换行
		sourcestr = sourcestr.replaceAll("<br>", "\r");// 回车
		sourcestr = sourcestr.replaceAll("<br>", "\n");// 换行
		return sourcestr;
	}

}
