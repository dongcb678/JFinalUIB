package com.platform.tools.security.md;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.commons.codec.digest.DigestUtils;

import com.jfinal.log.Log;

/**
 * MD5加密组件
 */
public abstract class ToolMD5 {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolMD5.class);

	/**
	 * MD5加密
	 * @param data 待加密数据
	 * @return byte[] 消息摘要
	 * @throws Exception
	 */
	public static byte[] encodeMD5(String data) {
		return DigestUtils.md5(data);
	}

	/**
	 * MD5加密
	 * @param data  待加密数据
	 * @return String 消息摘要
	 * @throws Exception
	 */
	public static String encodeMD5Hex(String data) {
		return DigestUtils.md5Hex(data);
	}
	
	/**
	 * MD5加密
	 * @param filePath  待加密文件路径
	 * @return String 消息摘要
	 * @throws Exception
	 */
	public static String encodeMD5HexFile(String filePath)  {
		FileInputStream fis = null;
		String hex = null;
		try {
			fis = new FileInputStream(new File(filePath));
			hex = DigestUtils.md5Hex(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(fis != null){
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return hex;
	}
	
}
