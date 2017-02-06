package com.junit.platform.tool.security;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.apache.commons.codec.binary.Hex;
import org.junit.Test;

import com.platform.tools.security.ToolCertificate2;

/**
 * 证书校验
 */
public class TestCertificate2 {

	private String password = "678789";

	private String alias = "1";

	private String certificatePath = "D:/DevelopmentTool/openssl-0.9.8k_X64/demoCA/certs/ca.cer";

	private String keyStorePath = "D:/DevelopmentTool/openssl-0.9.8k_X64/demoCA/certs/ca.p12";

	/**
	 * 公钥加密——私钥解密
	 * 
	 * @throws Exception
	 */
	@Test
	public void test1() {
		try {
			System.err.println("公钥加密——私钥解密");
			String inputStr = "Ceritifcate";
			byte[] data = inputStr.getBytes();

			// 公钥加密
			byte[] encrypt = ToolCertificate2.encryptByPublicKey(data, certificatePath);

			// 私钥解密
			byte[] decrypt = ToolCertificate2.decryptByPrivateKey(encrypt, keyStorePath, alias, password);

			String outputStr = new String(decrypt);

			System.err.println("加密前:\n" + inputStr);

			System.err.println("解密后:\n" + outputStr);

			// 验证数据一致
			assertArrayEquals(data, decrypt);
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.getMessage());
		}
	}

	/**
	 * 私钥加密——公钥解密
	 * 
	 * @throws Exception
	 */
	@Test
	public void test2() {
		System.err.println("私钥加密——公钥解密");

		String inputStr = "sign";
		byte[] data = inputStr.getBytes();

		try {
			// 私钥加密
			byte[] encodedData = ToolCertificate2.encryptByPrivateKey(data, keyStorePath, alias, password);

			// 公钥加密
			byte[] decodedData = ToolCertificate2.decryptByPublicKey(encodedData, certificatePath);

			String outputStr = new String(decodedData);

			System.err.println("加密前:\n" + inputStr);
			System.err.println("解密后:\n" + outputStr);

			// 校验
			assertEquals(inputStr, outputStr);
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.getMessage());
		}
	}

	/**
	 * 签名验证
	 * 
	 * @throws Exception
	 */
	@Test
	public void testSign() {
		try {
			String inputStr = "签名";
			byte[] data = inputStr.getBytes();
			System.err.println("私钥签名——公钥验证");

			// 产生签名
			byte[] sign = ToolCertificate2.sign(data, keyStorePath, alias, password, certificatePath);
			System.err.println("签名:\n" + Hex.encodeHexString(sign));

			// 验证签名
			boolean status = ToolCertificate2.verify(data, sign, certificatePath);
			System.err.println("状态:\n" + status);

			// 校验
			assertTrue(status);
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.getMessage());
		}
	}

}
