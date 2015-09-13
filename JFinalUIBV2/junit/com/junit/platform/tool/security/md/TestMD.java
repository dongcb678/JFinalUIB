package com.junit.platform.tool.security.md;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.platform.tools.security.md.ToolMD;

/**
 * MD系列加密组件<br>
 * Tiger、Whirlpool和GOST3411共3种算法
 */
public abstract class TestMD {

	/**
	 * 测试Tiger
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeTiger() throws Exception {
		String str = "Tiger消息摘要";

		// 获得摘要信息
		byte[] data1 = ToolMD.encodeTiger(str.getBytes());
		byte[] data2 = ToolMD.encodeTiger(str.getBytes());

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试RipeMD320Hex
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeTigerHex() throws Exception {
		String str = "TigerHex消息摘要";

		// 获得摘要信息
		String data1 = ToolMD.encodeTigerHex(str.getBytes());
		String data2 = ToolMD.encodeTigerHex(str.getBytes());

		System.err.println("原文：\t" + str);

		System.err.println("TigerHex-1：\t" + data1);
		System.err.println("TigerHex-2：\t" + data2);

		// 校验
		assertEquals(data1, data2);
	}

	/**
	 * 测试Whirlpool
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeWhirlpool() throws Exception {
		String str = "Tiger消息摘要";

		// 获得摘要信息
		byte[] data1 = ToolMD.encodeWhirlpool(str.getBytes());
		byte[] data2 = ToolMD.encodeWhirlpool(str.getBytes());

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试WhirlpoolHex
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeWhirlpoolHex() throws Exception {
		String str = "WhirlpoolHex消息摘要";

		// 获得摘要信息
		String data1 = ToolMD.encodeWhirlpoolHex(str.getBytes());
		String data2 = ToolMD.encodeWhirlpoolHex(str.getBytes());

		System.err.println("原文：\t" + str);

		System.err.println("WhirlpoolHex-1：\t" + data1);
		System.err.println("WhirlpoolHex-2：\t" + data2);

		// 校验
		assertEquals(data1, data2);
	}

	/**
	 * 测试GOST3411
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeGOST3411() throws Exception {
		String str = "GOST3411消息摘要";

		// 获得摘要信息
		byte[] data1 = ToolMD.encodeGOST3411(str.getBytes());
		byte[] data2 = ToolMD.encodeGOST3411(str.getBytes());

		// 校验
		assertArrayEquals(data1, data2);
	}

	/**
	 * 测试GOST3411Hex
	 * 
	 * @throws Exception
	 */
	@Test
	public final void testEncodeGOST3411Hex() throws Exception {
		String str = "GOST3411Hex消息摘要";

		// 获得摘要信息
		String data1 = ToolMD.encodeGOST3411Hex(str.getBytes());
		String data2 = ToolMD.encodeGOST3411Hex(str.getBytes());

		System.err.println("原文：\t" + str);

		System.err.println("GOST3411Hex-1：\t" + data1);
		System.err.println("GOST3411Hex-2：\t" + data2);

		// 校验
		assertEquals(data1, data2);
	}
}
