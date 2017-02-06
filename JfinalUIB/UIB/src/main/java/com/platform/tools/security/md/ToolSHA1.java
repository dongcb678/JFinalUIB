package com.platform.tools.security.md;

import java.security.MessageDigest;

import org.bouncycastle.util.encoders.Hex;

import com.jfinal.log.Log;

/**
 * SHA-1加密
 */
public abstract class ToolSHA1 {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolSHA1.class);

	/**
	 * SHA-1加密
	 * 
	 * @param data
	 *            待加密数据
	 * @return byte[] 消息摘要
	 * 
	 * @throws Exception
	 */
	public static byte[] encodeSHA(byte[] data) throws Exception {
		// 初始化MessageDigest
		MessageDigest md = MessageDigest.getInstance("SHA");

		// 执行消息摘要
		return md.digest(data);
	}

	/**
	 * SHA-1加密
	 * 
	 * @param data
	 *            待加密数据
	 * @return byte[] 消息摘要
	 * 
	 * @throws Exception
	 */
	public static String encodeSHAHex(byte[] data) throws Exception {
		// 执行消息摘要
		byte[] b = encodeSHA(data);

		// 做十六进制编码处理
		return new String(Hex.encode(b));
	}
	
}
