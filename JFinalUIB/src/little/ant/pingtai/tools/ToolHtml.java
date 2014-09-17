package little.ant.pingtai.tools;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

public class ToolHtml {

	public static void main(String[] args) {
		String unsafe = "<p><a href='http://example.com/' onclick='stealCookies()'>Link</a></p>";
		
		// 安全输出
		String safe = Jsoup.clean(unsafe, Whitelist.basic());
		System.out.println(safe);

		// 纯文本
		String clear = Jsoup.clean(unsafe, Whitelist.simpleText());
		System.out.println(clear);
	}

}
