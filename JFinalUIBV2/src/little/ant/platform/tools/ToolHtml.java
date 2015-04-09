package little.ant.platform.tools;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

/**
 * Html处理
 * @author 董华健
 */
public class ToolHtml {
	
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
