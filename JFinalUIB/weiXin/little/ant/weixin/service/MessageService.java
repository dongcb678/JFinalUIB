package little.ant.weixin.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import little.ant.pingtai.common.ContextBase;
import little.ant.pingtai.model.User;
import little.ant.pingtai.service.BaseService;
import little.ant.weixin.model.RecevieOrdinary;
import little.ant.weixin.utils.ToolWeiXin;

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
			String[] strSet = new String[] { ToolWeiXin.token, timestamp, nonce };
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
	public String getParseMessage(HttpServletRequest request) {
		String recverMsg = ContextBase.requestStream(request);
		log.info("接收的微信消息内容：" + recverMsg);
		RecevieOrdinary recevie = JSON.parseObject(recverMsg, RecevieOrdinary.class);
		log.info("接收内容解析成对象");
		
		String fromUserName = recevie.getFromUserName();
		log.info("获取客户微信账号" + fromUserName);
		
		log.info("根据微信号查询用户信息");
		User user = User.dao.findFirst(" select * form pt_user where weixin=? ", fromUserName);
		
		String returnMsg = "";
		String msgType = recevie.getMsgType();
		if(msgType == null || msgType.isEmpty()){
			return returnMsg;
		}
		
		if(msgType.equals("event")){//事件推送
			
		}else if(msgType.equals("text")){// 文本消息
			
		}else if(msgType.equals("image")){// 图片消息
			
		}else if(msgType.equals("voice")){// 语音消息
			
		}else if(msgType.equals("video")){// 视频消息
			
		}else if(msgType.equals("location")){// 地理位置消息
			
		}else if(msgType.equals("link")){// 链接消息
			
		}

		return returnMsg;
	}
	
}
