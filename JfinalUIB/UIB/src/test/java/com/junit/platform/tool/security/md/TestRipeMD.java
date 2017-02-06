package com.junit.platform.tool.security.md;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.platform.tools.security.md.ToolRipeMD;

/**
 * RipeMD系列消息摘要组件<br>
 * 包含RipeMD128、RipeMD160、RipeMD256和RipeMD320共4种RipeMD系列算法
 */
public abstract class TestRipeMD {

	/**
	 * 测试RipeMD128
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeRipeMD128() throws Exception {

		String str = "RipeMD128消息摘要";

		// 获得摘要信息
		byte[] data1 = ToolRipeMD.encodeRipeMD128(str.getBytes());
		byte[] data2 = ToolRipeMD.encodeRipeMD128(str.getBytes());

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试RipeMD128Hex
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeRipeMD128Hex() throws Exception {

		String str = "RipeMD128Hex消息摘要";

		// 获得摘要信息
		String data1 = ToolRipeMD.encodeRipeMD128Hex(str.getBytes());
		String data2 = ToolRipeMD.encodeRipeMD128Hex(str.getBytes());

		System.err.println("原文：\t" + str);

		System.err.println("RipeMD128Hex-1：\t" + data1);
		System.err.println("RipeMD128Hex-2：\t" + data2);

		// 校验
		assertEquals(data1, data2);
	}

	/**
	 * 测试RipeMD160
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeRipeMD160() throws Exception {

		String str = "RipeMD160消息摘要";

		// 获得摘要信息
		byte[] data1 = ToolRipeMD.encodeRipeMD160(str.getBytes());
		byte[] data2 = ToolRipeMD.encodeRipeMD160(str.getBytes());

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试RipeMD160Hex
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeRipeMD160Hex() throws Exception {

		String str = "RipeMD160Hex消息摘要";

		// 获得摘要信息
		String data1 = ToolRipeMD.encodeRipeMD160Hex(str.getBytes());
		String data2 = ToolRipeMD.encodeRipeMD160Hex(str.getBytes());

		System.err.println("原文：\t" + str);

		System.err.println("RipeMD160Hex-1：\t" + data1);
		System.err.println("RipeMD160Hex-2：\t" + data2);

		// 校验
		assertEquals(data1, data2);
	}

	/**
	 * 测试RipeMD256
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeRipeMD256() throws Exception {

		String str = "RipeMD256消息摘要";

		// 获得摘要信息
		byte[] data1 = ToolRipeMD.encodeRipeMD256(str.getBytes());
		byte[] data2 = ToolRipeMD.encodeRipeMD256(str.getBytes());

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试RipeMD256Hex
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeRipeMD256Hex() throws Exception {

		String str = "RipeMD256Hex消息摘要";

		// 获得摘要信息
		String data1 = ToolRipeMD.encodeRipeMD256Hex(str.getBytes());
		String data2 = ToolRipeMD.encodeRipeMD256Hex(str.getBytes());

		System.err.println("原文：\t" + str);

		System.err.println("RipeMD256Hex-1：\t" + data1);
		System.err.println("RipeMD256Hex-2：\t" + data2);

		// 校验
		assertEquals(data1, data2);
	}

	/**
	 * 测试RipeMD320
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeRipeMD320() throws Exception {
		
		String str = "RipeMD320消息摘要";

		// 获得摘要信息
		byte[] data1 = ToolRipeMD.encodeRipeMD320(str.getBytes());
		byte[] data2 = ToolRipeMD.encodeRipeMD320(str.getBytes());

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试RipeMD320Hex
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeRipeMD320Hex() throws Exception {
		
		String str = "RipeMD320Hex消息摘要";

		// 获得摘要信息
		String data1 = ToolRipeMD.encodeRipeMD320Hex(str.getBytes());
		String data2 = ToolRipeMD.encodeRipeMD320Hex(str.getBytes());

		System.err.println("原文：\t" + str);

		System.err.println("RipeMD320Hex-1：\t" + data1);
		System.err.println("RipeMD320Hex-2：\t" + data2);

		// 校验
		assertEquals(data1, data2);
	}

}
