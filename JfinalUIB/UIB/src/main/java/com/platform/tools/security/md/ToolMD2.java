package com.platform.tools.security.md;

import java.security.MessageDigest;

import org.bouncycastle.util.encoders.Hex;

import com.jfinal.log.Log;

/**
 * MD加密组件
 */
public abstract class ToolMD2 {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolMD2.class);

	/**
	 * MD2加密
	 * 
	 * @param data
	 *            待加密数据
	 * @return byte[] 消息摘要
	 * @throws Exception
	 */
	public static byte[] encodeMD2(byte[] data) throws Exception {
		// 初始化MessageDigest
		MessageDigest md = MessageDigest.getInstance("MD2");

		// 执行消息摘要
		return md.digest(data);
	}

	/**
	 * MD2加密
	 * 
	 * @param data
	 *            待加密数据
	 * @return byte[] 消息摘要
	 * @throws Exception
	 */
	public static String encodeMD2Hex(byte[] data) throws Exception {
		// 执行消息摘要
		byte[] b = encodeMD2(data);

		// 做十六进制编码处理
		return new String(Hex.encode(b));
	}

}
