package little.ant.platform.tools.security.md;

import java.security.MessageDigest;
import java.security.Security;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.util.encoders.Hex;

/**
 * MD4加密组件
 */
public class ToolMD4 {

	/**
	 * MD4加密
	 * 
	 * @param data
	 *            待加密数据
	 * @return byte[] 消息摘要
	 * 
	 * @throws Exception
	 */
	public static byte[] encodeMD4(byte[] data) throws Exception {

		// 加入BouncyCastleProvider支持
		Security.addProvider(new BouncyCastleProvider());

		// 初始化MessageDigest
		MessageDigest md = MessageDigest.getInstance("MD4");

		// 执行消息摘要
		return md.digest(data);
	}

	/**
	 * MD4加密
	 * 
	 * @param data
	 *            待加密数据
	 * @return String 消息摘要
	 * 
	 * @throws Exception
	 */
	public static String encodeMD4Hex(byte[] data) throws Exception {

		// 执行消息摘要
		byte[] b = encodeMD4(data);

		// 做十六进制编码处理
		return new String(Hex.encode(b));
	}

}
