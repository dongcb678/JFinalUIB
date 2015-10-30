package com.weixin.mvc.message;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.platform.mvc.base.BaseService;
import com.platform.tools.ToolXml;
import com.weixin.constant.ConstantEvent;
import com.weixin.constant.ConstantMsg;
import com.weixin.handler.event.ClickHandler;
import com.weixin.handler.event.ScanHandler;
import com.weixin.handler.event.SubscribeHandler;
import com.weixin.handler.event.SubscribeScanHandler;
import com.weixin.handler.event.UnSubscribeHandler;
import com.weixin.handler.event.ViewHandler;
import com.weixin.handler.message.ImageHandler;
import com.weixin.handler.message.LinkHandler;
import com.weixin.handler.message.LocationHandler;
import com.weixin.handler.message.TextHandler;
import com.weixin.handler.message.VideoHandler;
import com.weixin.handler.message.VoiceHandler;

public class MessageService extends BaseService {

	private static Logger log = Logger.getLogger(MessageService.class);

	public static final MessageService service = Enhancer.enhance(MessageService.class);
	
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
		if (msgType.equals(ConstantEvent.recevie_event)) {
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
		
		if(event.equals(ConstantEvent.recevie_event_subscribe)){//订阅
			String eventKey = ToolXml.getStairText(recverMsg, "EventKey");
			if(null == eventKey){//订阅
				responseMsg = (String) new SubscribeHandler().handle(recverMsg);
				
			}else{// 扫描二维码事件1：如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
				responseMsg = (String) new SubscribeScanHandler().handle(recverMsg);
				
			}
			
		}else if(event.equals(ConstantEvent.recevie_event_unsubscribe)){//取消订阅
			responseMsg = (String) new UnSubscribeHandler().handle(recverMsg);
			
		}else if(event.equals(ConstantEvent.recevie_event_scan)){//扫描二维码事件2：如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
			responseMsg = (String) new ScanHandler().handle(recverMsg);
			
		}else if(event.equals(ConstantEvent.recevie_event_location)){//上报地理位置事件
			responseMsg = (String) new LocationHandler().handle(recverMsg);
			
		}else if(event.equals(ConstantEvent.recevie_event_click)){//点击菜单拉取消息时的事件推送
			responseMsg = (String) new ClickHandler().handle(recverMsg);
			
		}else if(event.equals(ConstantEvent.recevie_event_view)){//点击菜单跳转链接时的事件推送
			responseMsg = (String) new ViewHandler().handle(recverMsg);
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
		
		if (msgType.equals(ConstantMsg.recevie_msg_text)) {// 文本消息
			responseMsg = (String) new TextHandler().handle(recverMsg);

		} else if (msgType.equals(ConstantMsg.recevie_msg_image)) {// 图片消息
			responseMsg = (String) new ImageHandler().handle(recverMsg);

		} else if (msgType.equals(ConstantMsg.recevie_msg_voice)) {// 语音消息
			responseMsg = (String) new VoiceHandler().handle(recverMsg);
			
		} else if (msgType.equals(ConstantMsg.recevie_msg_video)) {// 视频消息
			responseMsg = (String) new VideoHandler().handle(recverMsg);
			
		} else if (msgType.equals(ConstantMsg.recevie_msg_location)) {// 地理位置消息
			responseMsg = (String) new LocationHandler().handle(recverMsg);
			
		} else if (msgType.equals(ConstantMsg.recevie_msg_link)) {// 链接消息
			responseMsg = (String) new LinkHandler().handle(recverMsg);
		}
		
		return responseMsg;
	}

}
