package com.junit.platform.tool.security;

import static org.junit.Assert.assertEquals;

import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.junit.Before;
import org.junit.Test;

import com.platform.tools.security.ToolElGamal;

/**
 * ElGamal校验
 */
public class TestElGamal {

	/**
	 * 公钥
	 */
	private byte[] publicKey;

	/**
	 * 私钥
	 */
	private byte[] privateKey;

	/**
	 * 初始化密钥
	 * 
	 * @throws Exception
	 */
	@Before
	public void initKey() throws Exception {
		Map<String, Object> keyMap = ToolElGamal.initKey();

		publicKey = ToolElGamal.getPublicKey(keyMap);
		privateKey = ToolElGamal.getPrivateKey(keyMap);

		System.err.println("公钥: \n" + Base64.encodeBase64String(publicKey));
		System.err.println("私钥： \n" + Base64.encodeBase64String(privateKey));
	}

	/**
	 * 校验
	 * 
	 * @throws Exception
	 */
	@Test
	public void test() throws Exception {
		String inputStr = "ElGamal加密";

		byte[] data = inputStr.getBytes();

		System.err.println("原文: \n" + inputStr);

		byte[] encodedData = ToolElGamal.encryptByPublicKey(data, publicKey);

		System.err.println("加密后: \n" + Base64.encodeBase64String(encodedData));

		byte[] decodedData = ToolElGamal.decryptByPrivateKey(encodedData, privateKey);

		String outputStr = new String(decodedData);

		System.err.println("解密后: \n" + outputStr);

		assertEquals(inputStr, outputStr);
	}

}
