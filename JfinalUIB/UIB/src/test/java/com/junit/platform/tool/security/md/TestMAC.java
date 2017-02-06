package com.junit.platform.tool.security.md;

import static org.junit.Assert.assertArrayEquals;

import org.junit.Test;

import com.platform.tools.security.md.ToolMAC;

/**
 * MAC加密组件
 */
public abstract class TestMAC {

	/**
	 * 测试HmacMD5
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeHmacMD5() throws Exception {
		String str = "HmacMD5消息摘要";

		// 初始化密钥
		byte[] key = ToolMAC.initHmacMD5Key();

		// 获得摘要信息
		byte[] data1 = ToolMAC.encodeHmacMD5(str.getBytes(), key);
		byte[] data2 = ToolMAC.encodeHmacMD5(str.getBytes(), key);

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试HmacSHA1
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeHmacSHA() throws Exception {
		String str = "HmacSHA1消息摘要";

		// 初始化密钥
		byte[] key = ToolMAC.initHmacSHAKey();

		// 获得摘要信息
		byte[] data1 = ToolMAC.encodeHmacSHA(str.getBytes(), key);
		byte[] data2 = ToolMAC.encodeHmacSHA(str.getBytes(), key);

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试HmacSHA256
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeHmacSHA256() throws Exception {
		String str = "HmacSHA256消息摘要";

		// 初始化密钥
		byte[] key = ToolMAC.initHmacSHA256Key();

		// 获得摘要信息
		byte[] data1 = ToolMAC.encodeHmacSHA256(str.getBytes(), key);
		byte[] data2 = ToolMAC.encodeHmacSHA256(str.getBytes(), key);

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试HmacSHA384
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeHmacSHA384() throws Exception {
		String str = "HmacSHA384消息摘要";

		// 初始化密钥
		byte[] key = ToolMAC.initHmacSHA384Key();

		// 获得摘要信息
		byte[] data1 = ToolMAC.encodeHmacSHA384(str.getBytes(), key);
		byte[] data2 = ToolMAC.encodeHmacSHA384(str.getBytes(), key);

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试HmacSHA512
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeHmacSHA512() throws Exception {
		String str = "HmacSHA512消息摘要";

		// 初始化密钥
		byte[] key = ToolMAC.initHmacSHA512Key();

		// 获得摘要信息
		byte[] data1 = ToolMAC.encodeHmacSHA512(str.getBytes(), key);
		byte[] data2 = ToolMAC.encodeHmacSHA512(str.getBytes(), key);

		// 校验
		assertArrayEquals(data1, data2);
	}
}
