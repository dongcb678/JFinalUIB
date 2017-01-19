package com.platform.tools;

import org.apache.commons.lang3.StringEscapeUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

import com.jfinal.log.Log;

/**
 * Html处理
 * @author 董华健
 */
public abstract class ToolHtml {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolHtml.class);

	/**
	 * 特殊字符转义，避免XSS
	 * @param content
	 * @return
	 */
	public static String escapehtml(String content){
		return StringEscapeUtils.escapeHtml4(content);
	}
	
	/**
	 * 特殊字符转义，避免XSS
	 * @param content
	 * @return
	 */
	public static String unescapehtml(String content){
		return StringEscapeUtils.unescapeHtml4(content);
	}

	/**
	 * 富文本内容处理返回纯文本
	 * @param unsafe
	 * @return
	 */
	public static String cleanHtml(String unsafe){
		String clear = Jsoup.clean(unsafe, Whitelist.simpleText());
		return clear;
	}

	/**
	 * 富文本内容处理返回安全文本
	 * @param unsafe
	 * @return
	 */
	public static String safeHtml(String unsafe){
		String safe = Jsoup.clean(unsafe, Whitelist.basic());
		return safe;
	}
	
}
