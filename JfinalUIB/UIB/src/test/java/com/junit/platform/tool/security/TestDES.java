package com.junit.platform.tool.security;

import static org.junit.Assert.assertEquals;

import org.apache.commons.codec.binary.Base64;
import org.junit.Test;

import com.platform.tools.security.ToolDES;

/**
 * DES安全编码组件校验
 */
public class TestDES {

	/**
	 * 测试
	 * 
	 * @throws Exception
	 */
	@Test
	public final void test() throws Exception {
		String inputStr = "DES";
		byte[] inputData = inputStr.getBytes();
		System.err.println("原文:\t" + inputStr);

		// 初始化密钥
		byte[] key = ToolDES.initKey();
		System.err.println("密钥:\t" + Base64.encodeBase64String(key));

		// 加密
		inputData = ToolDES.encrypt(inputData, key);
		System.err.println("加密后:\t" + Base64.encodeBase64String(inputData));

		// 解密
		byte[] outputData = ToolDES.decrypt(inputData, key);

		String outputStr = new String(outputData);
		System.err.println("解密后:\t" + outputStr);

		// 校验
		assertEquals(inputStr, outputStr);
	}
}
