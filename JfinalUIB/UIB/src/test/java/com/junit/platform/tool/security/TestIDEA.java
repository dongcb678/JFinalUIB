package com.junit.platform.tool.security;

import org.apache.commons.codec.binary.Base64;
import org.junit.Test;

import com.platform.tools.security.ToolIDEA;

public class TestIDEA { // extends TestBase  {

	@Test
    public void test() throws Exception{
		String inputStr = "IDEA";
		byte[] inputData = inputStr.getBytes();
		System.err.println("原文:\t" + inputStr);

		// 初始化密钥
		byte[] key = ToolIDEA.initKey();
		System.err.println("密钥:\t" + Base64.encodeBase64String(key));

		// 加密
		inputData = ToolIDEA.encrypt(inputData, key);
		System.err.println("加密后:\t" + Base64.encodeBase64String(inputData));

		// 解密
		byte[] outputData = ToolIDEA.decrypt(inputData, key);

		String outputStr = new String(outputData);
		System.err.println("解密后:\t" + outputStr);
	}

}
