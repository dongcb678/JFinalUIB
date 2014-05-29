package little.ant.weixin.service;

import java.util.HashMap;
import java.util.Map;

import little.ant.pingtai.service.BaseService;
import little.ant.pingtai.utils.ToolXml;
import little.ant.weixin.utils.ToolMessage;
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

public class WeiXinService extends BaseService {

	private static Logger log = Logger.getLogger(WeiXinService.class);

	/**
	 * 消息处理
	 * @param accountId 公众账号标识
	 * @param recverMsg 接收的消息xml
	 * @return
	 */
	public String messageProcess(String accountId, String recverMsg) {
		// 消息类型
		String msgType = ToolXml.getStairText(recverMsg, "msgType");

		// 1.事件推送
		if (msgType.equals(ToolMessage.recevie_event)) {
			log.info("事件推送类型消息处理");
			String event = ToolXml.getStairText(recverMsg, "Event");
			return event(event, recverMsg);
			
		} else {// 2.普通消息
			log.info("普通消息处理");
			return message(msgType, recverMsg);
		}
	}
	
	/**
	 * 事件类型的消息
	 * @param event
	 * @param recverMsg
	 * @return
	 */
	public String event(String event, String recverMsg){
		String responseMsg = null;
		
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		
		if(event.equals(ToolMessage.recevie_event_subscribe)){//订阅
			String eventKey = ToolXml.getStairText(recverMsg, "EventKey");
			if(null == eventKey){//订阅
				map.put("xml", RecevieEventSubscribe.class);
				RecevieEventSubscribe subscribe = (RecevieEventSubscribe) ToolXml.xmlToBean(recverMsg, map);
				responseMsg = ToolMessage.recevie_event_subscribe(subscribe);
				
			}else{// 扫描二维码事件1：如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
				map.put("xml", RecevieEventQRCode.class);
				RecevieEventQRCode qrCode = (RecevieEventQRCode) ToolXml.xmlToBean(recverMsg, map);
				responseMsg = ToolMessage.recevie_event_subscribe_scan(qrCode);
				
			}
			
		}else if(event.equals(ToolMessage.recevie_event_unsubscribe)){//取消订阅
			map.put("xml", RecevieEventSubscribe.class);
			RecevieEventSubscribe subscribe = (RecevieEventSubscribe) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_event_unsubscribe(subscribe);
			
		}else if(event.equals(ToolMessage.recevie_event_scan)){//扫描二维码事件2：如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
			map.put("xml", RecevieEventQRCode.class);
			RecevieEventQRCode qrCode = (RecevieEventQRCode) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_event_scan(qrCode);
			
		}else if(event.equals(ToolMessage.recevie_event_location)){//上报地理位置事件
			map.put("xml", RecevieEventLocation.class);
			RecevieEventLocation location = (RecevieEventLocation) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_event_location(location);
			
		}else if(event.equals(ToolMessage.recevie_event_click)){//点击菜单拉取消息时的事件推送
			map.put("xml", RecevieEventMenu.class);
			RecevieEventMenu menu = (RecevieEventMenu) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_event_click(menu);
			
		}else if(event.equals(ToolMessage.recevie_event_view)){//点击菜单跳转链接时的事件推送
			map.put("xml", RecevieEventMenu.class);
			RecevieEventMenu menu = (RecevieEventMenu) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_event_view(menu);
		}
		
		return responseMsg;
	}
	
	/**
	 * 普通消息
	 * @param msgType
	 * @param recverMsg
	 * @return
	 */
	public String message(String msgType, String recverMsg){
		String responseMsg = null;
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		
		if (msgType.equals(ToolMessage.recevie_msg_text)) {// 文本消息
			map.put("xml", RecevieMsgText.class);
			RecevieMsgText text = (RecevieMsgText) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_msg_text(text);

		} else if (msgType.equals(ToolMessage.recevie_msg_image)) {// 图片消息
			map.put("xml", RecevieMsgImage.class);
			RecevieMsgImage image = (RecevieMsgImage) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_msg_image(image);

		} else if (msgType.equals(ToolMessage.recevie_msg_voice)) {// 语音消息
			map.put("xml", RecevieMsgVoice.class);
			RecevieMsgVoice voice = (RecevieMsgVoice) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_msg_voice(voice);
			
		} else if (msgType.equals(ToolMessage.recevie_msg_video)) {// 视频消息
			map.put("xml", RecevieMsgVideo.class);
			RecevieMsgVideo video = (RecevieMsgVideo) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_msg_video(video);
			
		} else if (msgType.equals(ToolMessage.recevie_msg_location)) {// 地理位置消息
			map.put("xml", RecevieMsgLocation.class);
			RecevieMsgLocation location = (RecevieMsgLocation) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_msg_location(location);
			
		} else if (msgType.equals(ToolMessage.recevie_msg_link)) {// 链接消息
			map.put("xml", RecevieMsgLink.class);
			RecevieMsgLink link = (RecevieMsgLink) ToolXml.xmlToBean(recverMsg, map);
			responseMsg = ToolMessage.recevie_msg_link(link);
		}
		
		return responseMsg;
	}

}
