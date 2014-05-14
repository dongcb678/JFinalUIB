/**
 * 2009-8-20
 */
package little.ant.pingtai.utils;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;

/**
 * Url Base64组件
 */
public abstract class ToolUrlBase64 {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ToolUrlBase64.class);

	/**
	 * 字符编码
	 */
	public final static String ENCODING = "UTF-8";

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
		byte[] b =  Base64.encodeBase64URLSafe(data.getBytes(ENCODING));

		return new String(b, ENCODING);
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
		byte[] b = Base64.decodeBase64(data.getBytes(ENCODING));

		return new String(b, ENCODING);
	}

}
