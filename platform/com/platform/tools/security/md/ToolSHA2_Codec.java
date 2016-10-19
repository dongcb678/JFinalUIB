package com.platform.tools.security.md;

import org.apache.commons.codec.digest.DigestUtils;

import com.jfinal.log.Log;

/**
 * SHA加密组件
 */
public abstract class ToolSHA2_Codec {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolSHA2_Codec.class);

	/**
	 * SHA256加密
	 * 
	 * @param data 待加密数据
	 * @return byte[] 消息摘要
	 * @throws Exception
	 */
	public static byte[] encodeSHA256(String data) throws Exception {

		// 执行消息摘要
		return DigestUtils.sha256(data);
	}

	/**
	 * SHA256Hex加密
	 * 
	 * @param data 待加密数据
	 * @return String 消息摘要
	 * @throws Exception
	 */
	public static String encodeSHA256Hex(String data) throws Exception {

		// 执行消息摘要
		return DigestUtils.sha256Hex(data);
	}

	/**
	 * SHA384加密
	 * 
	 * @param data 待加密数据
	 * @return byte[] 消息摘要 
	 * @throws Exception
	 */
	public static byte[] encodeSHA384(String data) throws Exception {

		// 执行消息摘要
		return DigestUtils.sha384(data);
	}

	/**
	 * SHA384Hex加密
	 * 
	 * @param data 待加密数据
	 * @return String 消息摘要 
	 * @throws Exception
	 */
	public static String encodeSHA384Hex(String data) throws Exception {

		// 执行消息摘要
		return DigestUtils.sha384Hex(data);
	}

	/**
	 * SHA512Hex加密
	 * 
	 * @param data 待加密数据
	 * @return byte[] 消息摘要
	 * @throws Exception
	 */
	public static byte[] encodeSHA512(String data) throws Exception {

		// 执行消息摘要
		return DigestUtils.sha512(data);
	}

	/**
	 * SHA512Hex加密
	 * 
	 * @param data 待加密数据
	 * @return String 消息摘要
	 * @throws Exception
	 */
	public static String encodeSHA512Hex(String data) throws Exception {

		// 执行消息摘要
		return DigestUtils.sha512Hex(data);
	}

}
