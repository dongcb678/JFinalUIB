package little.ant.weixin.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import little.ant.pingtai.common.ContextBase;
import little.ant.pingtai.model.User;
import little.ant.pingtai.service.BaseService;
import little.ant.weixin.model.Recevie;
import little.ant.weixin.utils.ToolConstant;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;

public class MessageService extends BaseService {

	private static Logger log = Logger.getLogger(MessageService.class);

	/**
	 * 对微信传过来的数据进行SHA1的验证
	 * 
	 * @param signature
	 * @param timestamp
	 * @param nonce
	 * @return
	 */
	public boolean checkSignature(String signature, String timestamp, String nonce) {
		try {
			String[] strSet = new String[] { ToolConstant.token, timestamp, nonce };
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

	/**
	 * 接受微信消息，并判断回复消息内容
	 * @param request
	 * @return
	 */
	public String getSendMessage(HttpServletRequest request) {
		// 接收内容
		String recverMsg = ContextBase.requestStream(request);
		Recevie recevie = JSON.parseObject(recverMsg, Recevie.class);
		
		// 获取客户微信账号
		String fromUserName = recevie.getFromUserName();
		
		// 根据微信号查询用户信息
		User user = User.dao.findFirst(" select * form pt_user where weixin=? ", fromUserName);
		
		String returnMsg = "";
		// 如果msgType不为空，并且为event 则为事件消息推送
		if (recevie.getMsgType() != null && recevie.getMsgType().equals("event")) {
			if (recevie.getEvent().equals("subscribe")) {
				// 事件订阅
				returnMsg = "";
			} else if (recevie.getEvent().equals("unsubscribe")) {
				// 取消事件订阅
				returnMsg = "";
			} else {
				// 自定义菜单
				returnMsg = "";
			}
		} else if (recevie.getContent().equals("余额")) {
			// 判断是否绑定
			if (user == null) {
				returnMsg = "";
			} else {
				//String idCard = user.getStr("idcard");//身份证号
				returnMsg = "";
			}
		} else if (recevie.getContent().equals("解除") || recevie.getContent().equals("解除绑定")) {
			
		} else if (recevie.getContent().equals("查询")) {
			
		} else if (recevie.getContent().equals("帮助")) {
			
		} else if (recevie.getContent().equals("绑定")) {
			
		} else if (recevie.getContent().equals("菜单")) {
			
		} else if (recevie.getContent().equals("地图")) {
			
		} else {
			
		}

		log.debug("接收的微信消息内容：" + recverMsg);
		log.debug("返回给微信消息内容：" + returnMsg);
		return returnMsg;
	}
	
}
