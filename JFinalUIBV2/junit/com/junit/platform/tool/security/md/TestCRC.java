package com.junit.platform.tool.security.md;

import java.util.zip.CRC32;

import org.junit.Test;

/**
 * 测试CRC-32
 */
public class TestCRC {
	
	/**
	 * 测试CRC-32
	 * 
	 * @throws Exception
	 */
	@Test
	public void testCRC32() throws Exception {
		String str = "测试CRC-32";

		CRC32 crc32 = new CRC32();

		crc32.update(str.getBytes());
		
		String hex = Long.toHexString(crc32.getValue());

		System.err.println("原文：\t" + str);
		System.err.println("CRC-32：\t" + hex);
	}

}
