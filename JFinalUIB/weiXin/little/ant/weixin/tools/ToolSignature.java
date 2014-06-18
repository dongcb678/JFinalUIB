package little.ant.weixin.tools;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import little.ant.pingtai.tools.ToolEhcacheFactory;

import org.apache.log4j.Logger;

public class ToolSignature {

	private static Logger log = Logger.getLogger(ToolSignature.class);

	/**
	 * 对微信传过来的数据进行SHA1的验证
	 * 
	 * @param signature
	 * @param timestamp
	 * @param nonce
	 * @return
	 */
	public static boolean checkSignature(String signature, String timestamp, String nonce) {
		try {
			String weixin_token = (String) ToolEhcacheFactory.getInstance().get("system", ToolWeiXin.weixin_token_key);
			String[] strSet = new String[] { weixin_token, timestamp, nonce };
			java.util.Arrays.sort(strSet);
			String total = "";
			for (String string : strSet) {
				total = total + string;
			}
			// SHA-1加密实例
			MessageDigest sha1 = MessageDigest.getInstance("SHA-1");
			sha1.update(total.getBytes());
			byte[] codedBytes = sha1.digest();
			// 将加密后的字节数组转换成字符串
			String codedString = new BigInteger(1, codedBytes).toString(16);
			// 将加密的结果与请求参数中的signature比对，如果相同，原样返回echostr参数内容
			if (codedString.equals(signature)) {
				return true;
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			log.error("验证签名信息失败");
		}
		return false;
	}

}
