package little.ant.pingtai.tools;

import java.io.UnsupportedEncodingException;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;

/**
 * Url组件
 */
public abstract class ToolString {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ToolString.class);

	/**
	 * 常用正则表达式
	 */
	public final static String regExp_integer_1 = "^\\d+$"; // 匹配非负整数（正整数 + 0）
	public final static String regExp_integer_2 = "^[0-9]*[1-9][0-9]*$"; // 匹配正整数
	public final static String regExp_integer_3 = "^((-\\d+) ?(0+))$"; // 匹配非正整数（负整数  + 0）
	public final static String regExp_integer_4 = "^-[0-9]*[1-9][0-9]*$"; // 匹配负整数
	public final static String regExp_integer_5 = "^-?\\d+$"; // 匹配整数

	public final static String regExp_float_1 = "^\\d+(\\.\\d+)?$"; // 匹配非负浮点数（正浮点数 + 0）
	public final static String regExp_float_2 = "^(([0-9]+\\.[0-9]*[1-9][0-9]*) ?([0-9]*[1-9][0-9]*\\.[0-9]+) ?([0-9]*[1-9][0-9]*))$"; // 匹配正浮点数
	public final static String regExp_float_3 = "^((-\\d+(\\.\\d+)?) ?(0+(\\.0+)?))$"; // 匹配非正浮点数（负浮点数 + 0）
	public final static String regExp_float_4 = "^(-(([0-9]+\\.[0-9]*[1-9][0-9]*) ?([0-9]*[1-9][0-9]*\\.[0-9]+) ?([0-9]*[1-9][0-9]*)))$"; // 匹配负浮点数
	public final static String regExp_float_5 = "^(-?\\d+)(\\.\\d+)?$"; // 匹配浮点数

	public final static String regExp_letter_1 = "^[A-Za-z]+$";// 匹配由26个英文字母组成的字符串
	public final static String regExp_letter_2 = "^[A-Z]+$";// 匹配由26个英文字母的大写组成的字符串
	public final static String regExp_letter_3 = "^[a-z]+$";// 匹配由26个英文字母的小写组成的字符串
	public final static String regExp_letter_4 = "^[A-Za-z0-9]+$";// 匹配由数字和26个英文字母组成的字符串
	public final static String regExp_letter_5 = "^\\w+$";// 匹配由数字、26个英文字母或者下划线组成的字符串

	public final static String regExp_email = "^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$"; // 匹配email地址
	
	public final static String regExp_url_1 = "^[a-zA-z]+://(\\w+(-\\w+)*)(\\.(\\w+(-\\w+)*))*(\\?\\S*)?$"; // 匹配url
	public final static String regExp_url_2 = "[a-zA-z]+://[^\\s]*"; // 匹配url
		
	public final static String regExp_chinese_1 = "[\\u4e00-\\u9fa5]"; // 匹配中文字符
	public final static String regExp_chinese_2 = "[^\\x00-\\xff]"; // 匹配双字节字符(包括汉字在内)

	public final static String regExp_line = "\\n[\\s ? ]*\\r"; // 匹配空行：

	public final static String regExp_html_1 = "/ <(.*)>.* <\\/\\1> ? <(.*) \\/>/"; // 匹配HTML标记
	public final static String regExp_startEndEmpty = "(^\\s*) ?(\\s*$)"; // 匹配首尾空格

	public final static String regExp_accountNumber = "^[a-zA-Z][a-zA-Z0-9_]{4,15}$"; //匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)
	
	public final static String regExp_telephone = "\\d{3}-\\d{8} ?\\d{4}-\\d{7}"; //匹配国内电话号码，匹配形式如 0511-4405222 或 021-87888822 
	
	public final static String regExp_qq = "[1-9][0-9]{4,}"; // 腾讯QQ号, 腾讯QQ号从10000开始
	
	public final static String regExp_postbody = "[1-9]\\d{5}(?!\\d)"; // 匹配中国邮政编码
	
	public final static String regExp_idCard = "\\d{15} ?\\d{18}"; // 匹配身份证, 中国的身份证为15位或18位

	public final static String regExp_ip = "\\d+\\.\\d+\\.\\d+\\.\\d+";//IP
	
	/**
	 * 字符编码
	 */
	public final static String encoding = "UTF-8";

	/**
	 * Url Base64编码
	 * 
	 * @param data
	 *            待编码数据
	 * @return String 编码数据
	 * @throws Exception
	 */
	public static String encode(String data) throws Exception {
		// 执行编码
		byte[] b = Base64.encodeBase64URLSafe(data.getBytes(encoding));

		return new String(b, encoding);
	}

	/**
	 * Url Base64解码
	 * 
	 * @param data
	 *            待解码数据
	 * @return String 解码数据
	 * @throws Exception
	 */
	public static String decode(String data) throws Exception {
		// 执行解码
		byte[] b = Base64.decodeBase64(data.getBytes(encoding));

		return new String(b, encoding);
	}

	/**
	 * URL编码（utf-8）
	 * 
	 * @param source
	 * @return
	 */
	public static String urlEncode(String source) {
		String result = source;
		try {
			result = java.net.URLEncoder.encode(source, encoding);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 根据内容类型判断文件扩展名
	 * 
	 * @param contentType
	 *            内容类型
	 * @return
	 */
	public static String getFileExt(String contentType) {
		String fileExt = "";
		if ("image/jpeg".equals(contentType))
			fileExt = ".jpg";
		else if ("audio/mpeg".equals(contentType))
			fileExt = ".mp3";
		else if ("audio/amr".equals(contentType))
			fileExt = ".amr";
		else if ("video/mp4".equals(contentType))
			fileExt = ".mp4";
		else if ("video/mpeg4".equals(contentType))
			fileExt = ".mp4";
		return fileExt;
	}

	/**
	 * 获取bean名称
	 * 
	 * @param bean
	 * @return
	 */
	public static String beanName(Object bean) {
		String fullClassName = bean.getClass().getName();
		String classNameTemp = fullClassName.substring(fullClassName.lastIndexOf(".") + 1, fullClassName.length());
		return classNameTemp.substring(0, 1) + classNameTemp.substring(1);
	}

}
