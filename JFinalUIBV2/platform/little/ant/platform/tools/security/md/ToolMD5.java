package little.ant.platform.tools.security.md;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * MD5加密组件
 */
public class ToolMD5 {

	/**
	 * MD5加密
	 * 
	 * @param data
	 *            待加密数据
	 * @return byte[] 消息摘要
	 * 
	 * @throws Exception
	 */
	public static byte[] encodeMD5(String data) throws Exception {

		// 执行消息摘要
		return DigestUtils.md5(data);
	}

	/**
	 * MD5加密
	 * 
	 * @param data
	 *            待加密数据
	 * @return byte[] 消息摘要
	 * 
	 * @throws Exception
	 */
	public static String encodeMD5Hex(String data) throws Exception {

		// 执行消息摘要
		return DigestUtils.md5Hex(data);
	}
	
}
