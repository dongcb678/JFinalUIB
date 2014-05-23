package little.ant.weixin.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import little.ant.pingtai.service.BaseService;
import little.ant.pingtai.utils.ToolXml;
import little.ant.weixin.utils.ToolRecevie;
import little.ant.weixin.utils.ToolWeiXin;
import little.ant.weixin.vo.message.RecevieEventLocation;
import little.ant.weixin.vo.message.RecevieEventMenu;
import little.ant.weixin.vo.message.RecevieEventQRCode;
import little.ant.weixin.vo.message.RecevieEventSubscribe;
import little.ant.weixin.vo.message.RecevieMsgImage;
import little.ant.weixin.vo.message.RecevieMsgLink;
import little.ant.weixin.vo.message.RecevieMsgLocation;
import little.ant.weixin.vo.message.RecevieMsgText;
import little.ant.weixin.vo.message.RecevieMsgVideo;
import little.ant.weixin.vo.message.RecevieMsgVoice;

import org.apache.log4j.Logger;

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
			String[] strSet = new String[] { ToolWeiXin.weixin_token, timestamp, nonce };
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
	 * 消息处理
	 * @param recverMsg
	 * @return
	 */
	public String messageProcess(String recverMsg) {
		// 消息类型
		String msgType = ToolXml.getStairText(recverMsg, "msgType");

		String responseMsg = null;
		
		// 1.事件推送
		if (msgType.equals(ToolRecevie.recevie_event)) {
			String event = ToolXml.getStairText(recverMsg, "Event");
			if(event.equals(ToolRecevie.recevie_event_subscribe)){//订阅
				String eventKey = ToolXml.getStairText(recverMsg, "EventKey");
				if(null == eventKey){//订阅
					RecevieEventSubscribe subscribe = (RecevieEventSubscribe) ToolXml.xmlToBean(recverMsg, RecevieEventSubscribe.class);
					responseMsg = ToolRecevie.recevie_event_subscribe(subscribe);
					
				}else{// 扫描二维码事件1：如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
					RecevieEventQRCode qrCode = (RecevieEventQRCode) ToolXml.xmlToBean(recverMsg, RecevieEventQRCode.class);
					responseMsg = ToolRecevie.recevie_event_subscribe_scan(qrCode);
					
				}
				
			}else if(event.equals(ToolRecevie.recevie_event_unsubscribe)){//取消订阅
				RecevieEventSubscribe subscribe = (RecevieEventSubscribe) ToolXml.xmlToBean(recverMsg, RecevieEventSubscribe.class);
				responseMsg = ToolRecevie.recevie_event_unsubscribe(subscribe);
				
			}else if(event.equals(ToolRecevie.recevie_event_scan)){//扫描二维码事件2：如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
				RecevieEventQRCode qrCode = (RecevieEventQRCode) ToolXml.xmlToBean(recverMsg, RecevieEventQRCode.class);
				responseMsg = ToolRecevie.recevie_event_scan(qrCode);
				
			}else if(event.equals(ToolRecevie.recevie_event_location)){//上报地理位置事件
				RecevieEventLocation location = (RecevieEventLocation) ToolXml.xmlToBean(recverMsg, RecevieEventLocation.class);
				responseMsg = ToolRecevie.recevie_event_location(location);
				
			}else if(event.equals(ToolRecevie.recevie_event_click)){//点击菜单拉取消息时的事件推送
				RecevieEventMenu menu = (RecevieEventMenu) ToolXml.xmlToBean(recverMsg, RecevieEventMenu.class);
				responseMsg = ToolRecevie.recevie_event_click(menu);
				
			}else if(event.equals(ToolRecevie.recevie_event_view)){//点击菜单跳转链接时的事件推送
				RecevieEventMenu menu = (RecevieEventMenu) ToolXml.xmlToBean(recverMsg, RecevieEventMenu.class);
				responseMsg = ToolRecevie.recevie_event_view(menu);
			}
			
		} else {
			//接收普通消息
			if (msgType.equals(ToolRecevie.recevie_msg_text)) {// 文本消息
				RecevieMsgText text = (RecevieMsgText) ToolXml.xmlToBean(recverMsg, RecevieMsgText.class);
				responseMsg = ToolRecevie.recevie_msg_text(text);

			} else if (msgType.equals(ToolRecevie.recevie_msg_image)) {// 图片消息
				RecevieMsgImage image = (RecevieMsgImage) ToolXml.xmlToBean(recverMsg, RecevieMsgImage.class);
				responseMsg = ToolRecevie.recevie_msg_image(image);

			} else if (msgType.equals(ToolRecevie.recevie_msg_voice)) {// 语音消息
				RecevieMsgVoice voice = (RecevieMsgVoice) ToolXml.xmlToBean(recverMsg, RecevieMsgVoice.class);
				responseMsg = ToolRecevie.recevie_msg_voice(voice);
				
			} else if (msgType.equals(ToolRecevie.recevie_msg_video)) {// 视频消息
				RecevieMsgVideo video = (RecevieMsgVideo) ToolXml.xmlToBean(recverMsg, RecevieMsgVideo.class);
				responseMsg = ToolRecevie.recevie_msg_video(video);
				
			} else if (msgType.equals(ToolRecevie.recevie_msg_location)) {// 地理位置消息
				RecevieMsgLocation location = (RecevieMsgLocation) ToolXml.xmlToBean(recverMsg, RecevieMsgLocation.class);
				responseMsg = ToolRecevie.recevie_msg_location(location);
				
			} else if (msgType.equals(ToolRecevie.recevie_msg_link)) {// 链接消息
				RecevieMsgLink link = (RecevieMsgLink) ToolXml.xmlToBean(recverMsg, RecevieMsgLink.class);
				responseMsg = ToolRecevie.recevie_msg_link(link);
			}
		}
		
		return responseMsg;
	}

}
