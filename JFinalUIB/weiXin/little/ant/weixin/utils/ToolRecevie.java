package little.ant.weixin.utils;

import java.util.Date;

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

/**
 * 接收消息处理
 * @author 董华健
 */
public class ToolRecevie {

	/**
	 * 事件类型
	 */
	public static final String recevie_event = "event";
	public static final String recevie_event_subscribe = "subscribe";
	public static final String recevie_event_unsubscribe = "unsubscribe";
	public static final String recevie_event_scan = "SCAN";
	public static final String recevie_event_location = "LOCATION";
	public static final String recevie_event_click = "CLICK";
	public static final String recevie_event_view = "VIEW";
	
	/**
	 * 消息类型
	 */
	public static final String recevie_msg_text = "text";
	public static final String recevie_msg_image = "image";
	public static final String recevie_msg_voice = "voice";
	public static final String recevie_msg_video = "video";
	public static final String recevie_msg_location = "location";
	public static final String recevie_msg_link = "link";
	
	/**
	 * 订阅
	 * @param subscribe
	 * @return
	 */
	public static String recevie_event_subscribe(RecevieEventSubscribe subscribe){
		StringBuffer sb = new StringBuffer();
		String toUserName = subscribe.getToUserName();// 开发者
		String fromUserName = subscribe.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[订阅]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}
	
	/**
	 * 订阅：扫描二维码事件1：如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
	 * @param subscribe
	 * @return
	 */
	public static String recevie_event_subscribe_scan(RecevieEventQRCode qrCode){
		StringBuffer sb = new StringBuffer();
		String toUserName = qrCode.getToUserName();// 开发者
		String fromUserName = qrCode.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[扫描二维码事件1]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}
	
	/**
	 * 取消订阅
	 * @param subscribe
	 * @return
	 */
	public static String recevie_event_unsubscribe(RecevieEventSubscribe subscribe){
		StringBuffer sb = new StringBuffer();
		String toUserName = subscribe.getToUserName();// 开发者
		String fromUserName = subscribe.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[取消订阅]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 扫描二维码事件2：如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
	 * @param qrCode
	 * @return
	 */
	public static String recevie_event_scan(RecevieEventQRCode qrCode){
		StringBuffer sb = new StringBuffer();
		String toUserName = qrCode.getToUserName();// 开发者
		String fromUserName = qrCode.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[扫描二维码事件2]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}
	
	/**
	 * 上报地理位置事件
	 * @param location
	 * @return
	 */
	public static String recevie_event_location(RecevieEventLocation location){
		StringBuffer sb = new StringBuffer();
		String toUserName = location.getToUserName();// 开发者
		String fromUserName = location.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[扫描二维码事件2]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 点击菜单拉取消息时的事件推送
	 * @param menu
	 * @return
	 */
	public static String recevie_event_click(RecevieEventMenu menu){
		StringBuffer sb = new StringBuffer();
		String toUserName = menu.getToUserName();// 开发者
		String fromUserName = menu.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[点击菜单拉取消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 点击菜单跳转链接时的事件推送
	 * @param menu
	 * @return
	 */
	public static String recevie_event_view(RecevieEventMenu menu){
		StringBuffer sb = new StringBuffer();
		String toUserName = menu.getToUserName();// 开发者
		String fromUserName = menu.getFromUserName();// 发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA[" + fromUserName + "]]></ToUserName>");
		sb.append("<FromUserName><![CDATA[" + toUserName + "]]></FromUserName>");
		sb.append("<CreateTime>" + new Date().getTime() + "</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[点击菜单跳转链接]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 文本消息
	 * @param text
	 * @return
	 */
	public static String recevie_msg_text(RecevieMsgText text){
		StringBuffer sb = new StringBuffer();
		String toUserName = text.getToUserName();//开发者
		String fromUserName = text.getFromUserName();//发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[文本消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 图片消息
	 * @param image
	 * @return
	 */
	public static String recevie_msg_image(RecevieMsgImage image){
		StringBuffer sb = new StringBuffer();
		String toUserName = image.getToUserName();//开发者
		String fromUserName = image.getFromUserName();//发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[图片消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 语音消息
	 * @param voice
	 * @return
	 */
	public static String recevie_msg_voice(RecevieMsgVoice voice){
		StringBuffer sb = new StringBuffer();
		String toUserName = voice.getToUserName();//开发者
		String fromUserName = voice.getFromUserName();//发送者
		String recognition = voice.getRecognition();// 语音识别结果
		if(null != recognition){//接收语音识别结果
			
		}else{
			
		}
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[语音消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 视频消息
	 * @param video
	 * @return
	 */
	public static String recevie_msg_video(RecevieMsgVideo video){
		StringBuffer sb = new StringBuffer();
		String toUserName = video.getToUserName();//开发者
		String fromUserName = video.getFromUserName();//发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[视频消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 地理位置消息
	 * @param location
	 * @return
	 */
	public static String recevie_msg_location(RecevieMsgLocation location){
		StringBuffer sb = new StringBuffer();
		String toUserName = location.getToUserName();//开发者
		String fromUserName = location.getFromUserName();//发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[地理位置消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

	/**
	 * 链接消息
	 * @param link
	 * @return
	 */
	public static String recevie_msg_link(RecevieMsgLink link){
		StringBuffer sb = new StringBuffer();
		String toUserName = link.getToUserName();//开发者
		String fromUserName = link.getFromUserName();//发送者
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[链接消息]]></Content>");
		sb.append("</xml>");
		return sb.toString();
	}

}
