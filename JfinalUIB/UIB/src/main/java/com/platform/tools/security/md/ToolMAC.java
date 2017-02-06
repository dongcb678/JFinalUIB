package com.platform.tools.security.md;

import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import com.jfinal.log.Log;

/**
 * MAC加密组件
 */
public abstract class ToolMAC {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolMAC.class);

	/**
	 * 初始化HmacMD5密钥
	 * 
	 * @return
	 * @throws Exception
	 */
	public static byte[] initHmacMD5Key() throws Exception {

		// 初始化KeyGenerator
		KeyGenerator keyGenerator = KeyGenerator.getInstance("HmacMD5");

		// 产生秘密密钥
		SecretKey secretKey = keyGenerator.generateKey();

		// 获得密钥
		return secretKey.getEncoded();
	}

	/**
	 * HmacMD5加密
	 * 
	 * @param data
	 *            待加密数据
	 * @param key
	 *            密钥
	 * @return byte[] 消息摘要
	 * 
	 * @throws Exception
	 */
	public static byte[] encodeHmacMD5(byte[] data, byte[] key)
			throws Exception {

		// 还原密钥
		SecretKey secretKey = new SecretKeySpec(key, "HmacMD5");

		// 实例化Mac "SslMacMD5"
		Mac mac = Mac.getInstance("SslMacMD5");//secretKey.getAlgorithm());

		// 初始化Mac
		mac.init(secretKey);

		// 执行消息摘要
		return mac.doFinal(data);
	}

	/**
	 * 初始化HmacSHA1密钥
	 * 
	 * @return
	 * @throws Exception
	 */
	public static byte[] initHmacSHAKey() throws Exception {

		// 初始化KeyGenerator
		KeyGenerator keyGenerator = KeyGenerator.getInstance("HMacTiger");

		// 产生秘密密钥
		SecretKey secretKey = keyGenerator.generateKey();

		// 获得密钥
		return secretKey.getEncoded();
	}

	/**
	 * HmacSHA1加密
	 * 
	 * @param data
	 *            待加密数据
	 * @param key
	 *            密钥
	 * @return byte[] 消息摘要
	 * 
	 * @throws Exception
	 */
	public static byte[] encodeHmacSHA(byte[] data, byte[] key)
			throws Exception {

		// 还原密钥
		SecretKey secretKey = new SecretKeySpec(key, "HMacTiger");
 
		// 实例化Mac SslMacMD5
		Mac mac = Mac.getInstance("SslMacMD5");//secretKey.getAlgorithm());

		// 初始化Mac
		mac.init(secretKey);

		// 执行消息摘要
		return mac.doFinal(data);
	}
	
//	// 根据所安装的 JCE 仲裁策略文件，返回指定转换的最大密钥长度。
//	public final static int getMaxAllowedKeyLength(String transformation) 

	/**
	 * 初始化HmacSHA256密钥
	 * 
	 * @return
	 * @throws Exception
	 */
	public static byte[] initHmacSHA256Key() throws Exception {

		// 初始化KeyGenerator
		KeyGenerator keyGenerator = KeyGenerator.getInstance("HmacSHA256");

		// 产生秘密密钥
		SecretKey secretKey = keyGenerator.generateKey();

		// 获得密钥
		return secretKey.getEncoded();
	}

	/**
	 * HmacSHA256加密
	 * 
	 * @param data
	 *            待加密数据
	 * @param key
	 *            密钥
	 * @return byte[] 消息摘要
	 * 
	 * @throws Exception
	 */
	public static byte[] encodeHmacSHA256(byte[] data, byte[] key)
			throws Exception {

		// 还原密钥
		SecretKey secretKey = new SecretKeySpec(key, "HmacSHA256");

		// 实例化Mac
		Mac mac = Mac.getInstance(secretKey.getAlgorithm());

		// 初始化Mac
		mac.init(secretKey);

		// 执行消息摘要
		return mac.doFinal(data);
	}

	/**
	 * 初始化HmacSHA384密钥
	 * 
	 * @return
	 * @throws Exception
	 */
	public static byte[] initHmacSHA384Key() throws Exception {

		// 初始化KeyGenerator
		KeyGenerator keyGenerator = KeyGenerator.getInstance("HmacSHA384");

		// 产生秘密密钥
		SecretKey secretKey = keyGenerator.generateKey();

		// 获得密钥
		return secretKey.getEncoded();
	}

	/**
	 * HmacSHA384加密
	 * 
	 * @param data
	 *            待加密数据
	 * @param key
	 *            密钥
	 * @return byte[] 消息摘要
	 * 
	 * @throws Exception
	 */
	public static byte[] encodeHmacSHA384(byte[] data, byte[] key)
			throws Exception {

		// 还原密钥
		SecretKey secretKey = new SecretKeySpec(key, "HmacSHA384");

		// 实例化Mac
		Mac mac = Mac.getInstance(secretKey.getAlgorithm());

		// 初始化Mac
		mac.init(secretKey);

		// 执行消息摘要
		return mac.doFinal(data);
	}

	/**
	 * 初始化HmacSHA512密钥
	 * 
	 * @return
	 * @throws Exception
	 */
	public static byte[] initHmacSHA512Key() throws Exception {

		// 初始化KeyGenerator
		KeyGenerator keyGenerator = KeyGenerator.getInstance("HmacSHA512");

		// 产生秘密密钥
		SecretKey secretKey = keyGenerator.generateKey();

		// 获得密钥
		return secretKey.getEncoded();
	}

	/**
	 * HmacSHA512加密
	 * 
	 * @param data
	 *            待加密数据
	 * @param key
	 *            密钥
	 * @return byte[] 消息摘要
	 * 
	 * @throws Exception
	 */
	public static byte[] encodeHmacSHA512(byte[] data, byte[] key)
			throws Exception {

		// 还原密钥
		SecretKey secretKey = new SecretKeySpec(key, "HmacSHA512");

		// 实例化Mac
		Mac mac = Mac.getInstance(secretKey.getAlgorithm());

		// 初始化Mac
		mac.init(secretKey);

		// 执行消息摘要
		return mac.doFinal(data);
	}
	
}
