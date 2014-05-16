package little.ant.weixin.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import little.ant.pingtai.service.BaseService;
import little.ant.pingtai.utils.ToolXml;
import little.ant.weixin.utils.ToolWeiXin;
import little.ant.weixin.vo.RecevieEventLocation;
import little.ant.weixin.vo.RecevieEventMenu;
import little.ant.weixin.vo.RecevieEventQRCode;
import little.ant.weixin.vo.RecevieEventSubscribe;
import little.ant.weixin.vo.RecevieMsgImage;
import little.ant.weixin.vo.RecevieMsgLink;
import little.ant.weixin.vo.RecevieMsgLocation;
import little.ant.weixin.vo.RecevieMsgText;
import little.ant.weixin.vo.RecevieMsgVideo;
import little.ant.weixin.vo.RecevieMsgVoice;

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
	 * 消息处理
	 * @param recverMsg
	 * @return
	 */
	public String messageProcess(String recverMsg) {
		// 消息类型
		String msgType = ToolXml.getStairText(recverMsg, "msgType");

		StringBuffer sb = new StringBuffer();

		// 1.事件推送
		if (msgType.equals(ToolWeiXin.recevie_event)) {
			String event = ToolXml.getStairText(recverMsg, "Event");
			if(event.equals(ToolWeiXin.recevie_event_subscribe)){//订阅
				String eventKey = ToolXml.getStairText(recverMsg, "EventKey");
				if(null == eventKey){//订阅
					RecevieEventSubscribe subscribe = (RecevieEventSubscribe) ToolXml.xmlToBean(recverMsg, RecevieEventSubscribe.class);
					String toUserName = subscribe.getToUserName();// 开发者
					String fromUserName = subscribe.getFromUserName();// 发送者
					sb.append("<xml>");
					sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
					sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
					sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
					sb.append("<MsgType><![CDATA[text]]></MsgType>");
					sb.append("<Content><![CDATA[订阅]]></Content>");
					sb.append("</xml>");
					
				}else{// 扫描二维码事件1：如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
					RecevieEventQRCode qrCode = (RecevieEventQRCode) ToolXml.xmlToBean(recverMsg, RecevieEventQRCode.class);
					String toUserName = qrCode.getToUserName();// 开发者
					String fromUserName = qrCode.getFromUserName();// 发送者
					sb.append("<xml>");
					sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
					sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
					sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
					sb.append("<MsgType><![CDATA[text]]></MsgType>");
					sb.append("<Content><![CDATA[扫描二维码事件1]]></Content>");
					sb.append("</xml>");
				}
				
			}else if(event.equals(ToolWeiXin.recevie_event_unsubscribe)){//取消订阅
				RecevieEventSubscribe subscribe = (RecevieEventSubscribe) ToolXml.xmlToBean(recverMsg, RecevieEventSubscribe.class);
				String toUserName = subscribe.getToUserName();// 开发者
				String fromUserName = subscribe.getFromUserName();// 发送者
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[取消订阅]]></Content>");
				sb.append("</xml>");
				
			}else if(event.equals(ToolWeiXin.recevie_event_scan)){//扫描二维码事件2：如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
				RecevieEventQRCode qrCode = (RecevieEventQRCode) ToolXml.xmlToBean(recverMsg, RecevieEventQRCode.class);
				String toUserName = qrCode.getToUserName();// 开发者
				String fromUserName = qrCode.getFromUserName();// 发送者
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[扫描二维码事件2]]></Content>");
				sb.append("</xml>");
				
			}else if(event.equals(ToolWeiXin.recevie_event_location)){//上报地理位置事件
				RecevieEventLocation location = (RecevieEventLocation) ToolXml.xmlToBean(recverMsg, RecevieEventLocation.class);
				String toUserName = location.getToUserName();// 开发者
				String fromUserName = location.getFromUserName();// 发送者
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[扫描二维码事件2]]></Content>");
				sb.append("</xml>");
				
			}else if(event.equals(ToolWeiXin.recevie_event_click)){//点击菜单拉取消息时的事件推送
				RecevieEventMenu menu = (RecevieEventMenu) ToolXml.xmlToBean(recverMsg, RecevieEventMenu.class);
				String toUserName = menu.getToUserName();// 开发者
				String fromUserName = menu.getFromUserName();// 发送者
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[点击菜单拉取消息]]></Content>");
				sb.append("</xml>");
				
			}else if(event.equals(ToolWeiXin.recevie_event_view)){//点击菜单跳转链接时的事件推送
				RecevieEventMenu menu = (RecevieEventMenu) ToolXml.xmlToBean(recverMsg, RecevieEventMenu.class);
				String toUserName = menu.getToUserName();// 开发者
				String fromUserName = menu.getFromUserName();// 发送者
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[点击菜单跳转链接]]></Content>");
				sb.append("</xml>");
			}
			
		} else {
			// 接收普通消息
			if (msgType.equals(ToolWeiXin.recevie_msg_text)) {// 文本消息
				RecevieMsgText text = (RecevieMsgText) ToolXml.xmlToBean(recverMsg, RecevieMsgText.class);
				String toUserName = text.getToUserName();// 开发者
				String fromUserName = text.getFromUserName();// 发送者
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[文本消息]]></Content>");
				sb.append("</xml>");

			} else if (msgType.equals(ToolWeiXin.recevie_msg_image)) {// 图片消息
				RecevieMsgImage image = (RecevieMsgImage) ToolXml.xmlToBean(recverMsg, RecevieMsgImage.class);
				String toUserName = image.getToUserName();// 开发者
				String fromUserName = image.getFromUserName();// 发送者
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[图片消息]]></Content>");
				sb.append("</xml>");

			} else if (msgType.equals(ToolWeiXin.recevie_msg_voice)) {// 语音消息
				RecevieMsgVoice voice = (RecevieMsgVoice) ToolXml.xmlToBean(recverMsg, RecevieMsgVoice.class);
				String toUserName = voice.getToUserName();// 开发者
				String fromUserName = voice.getFromUserName();// 发送者
				String recognition = voice.getRecognition();// 语音识别结果
				if (null != recognition) {// 接收语音识别结果

				} else {

				}
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[语音消息]]></Content>");
				sb.append("</xml>");

			} else if (msgType.equals(ToolWeiXin.recevie_msg_video)) {// 视频消息
				RecevieMsgVideo video = (RecevieMsgVideo) ToolXml.xmlToBean(recverMsg, RecevieMsgVideo.class);
				String toUserName = video.getToUserName();// 开发者
				String fromUserName = video.getFromUserName();// 发送者
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[视频消息]]></Content>");
				sb.append("</xml>");

			} else if (msgType.equals(ToolWeiXin.recevie_msg_location)) {// 地理位置消息
				RecevieMsgLocation location = (RecevieMsgLocation) ToolXml.xmlToBean(recverMsg, RecevieMsgLocation.class);
				String toUserName = location.getToUserName();// 开发者
				String fromUserName = location.getFromUserName();// 发送者
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[地理位置消息]]></Content>");
				sb.append("</xml>");

			} else if (msgType.equals(ToolWeiXin.recevie_msg_link)) {// 链接消息
				RecevieMsgLink link = (RecevieMsgLink) ToolXml.xmlToBean(recverMsg, RecevieMsgLink.class);
				String toUserName = link.getToUserName();// 开发者
				String fromUserName = link.getFromUserName();// 发送者
				sb.append("<xml>");
				sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
				sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
				sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
				sb.append("<MsgType><![CDATA[text]]></MsgType>");
				sb.append("<Content><![CDATA[链接消息]]></Content>");
				sb.append("</xml>");
			}
		}

		return sb.toString();
	}

}
