package little.ant.junit.platform.tool.security.md;

import static org.junit.Assert.assertEquals;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.security.MessageDigest;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

public class TestSHA {
	
	/**
	 * 验证文件的SHA值
	 * 
	 * @throws Exception
	 */
	@Test
	public void testByMessageDigest() throws Exception {

		// 文件路径
		String path = "D:\\mysql-essential-5.1.37-win32.msi";

		// 构建文件输入流
		FileInputStream fis = new FileInputStream(new File(path));

		// 使用DataInputStream包装文件输入流
		DataInputStream dis = new DataInputStream(fis);

		// 获得可用的流字节长度，这里指文件长度
		int len = dis.available();

		// 初始化用于存储文件数据的字节数组
		byte[] data = new byte[len];

		// 一次性将文件信息读取到字节数组中
		dis.readFully(data);

		// 关闭流
		dis.close();

		// 初始化MessageDigest，并指定MD5算法
		MessageDigest md = MessageDigest.getInstance("SHA");

		// 摘要处理
		byte[] b = md.digest(data);

		// 十六进制转换
		String md5hex = Hex.encodeHexString(b);

		// 验证
		assertEquals(md5hex, "a7c6e483af48273638416e1d3fca52b7");
	}

	/**
	 * 验证文件的SHA值
	 * 
	 * @throws Exception
	 */
	@Test
	public void testByDigestUtils() throws Exception {
		// 文件路径
		String path = "D:\\mysql-essential-5.1.37-win32.msi";

		// 构建文件输入流
		FileInputStream fis = new FileInputStream(new File(path));

		// 使用DataInputStream包装文件输入流
		DataInputStream dis = new DataInputStream(fis);

		// 获得可用的流字节长度，这里指文件长度
		int len = dis.available();

		// 初始化用于存储文件数据的字节数组
		byte[] data = new byte[len];

		// 一次性将文件信息读取到字节数组中
		dis.readFully(data);

		// 关闭流
		dis.close();

		// 使用DigestUtils做SHAHex处理
		String shahex = DigestUtils.shaHex(data);

		// 验证
		assertEquals(shahex, "a7c6e483af48273638416e1d3fca52b7");
	}

}
