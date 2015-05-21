package little.ant.weixin.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolXml;
import little.ant.weixin.tools.ToolMessage;

import org.apache.log4j.Logger;

public class MessageService extends BaseService {

	private static Logger log = Logger.getLogger(MessageService.class);

	public static final MessageService service = MyTxProxy.newProxy(MessageService.class);
	
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
		
		if(event.equals(ToolMessage.recevie_event_subscribe)){//订阅
			String eventKey = ToolXml.getStairText(recverMsg, "EventKey");
			if(null == eventKey){//订阅
				responseMsg = ToolMessage.recevie_event_subscribe(recverMsg);
				
			}else{// 扫描二维码事件1：如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
				responseMsg = ToolMessage.recevie_event_subscribe_scan(recverMsg);
				
			}
			
		}else if(event.equals(ToolMessage.recevie_event_unsubscribe)){//取消订阅
			responseMsg = ToolMessage.recevie_event_unsubscribe(recverMsg);
			
		}else if(event.equals(ToolMessage.recevie_event_scan)){//扫描二维码事件2：如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
			responseMsg = ToolMessage.recevie_event_scan(recverMsg);
			
		}else if(event.equals(ToolMessage.recevie_event_location)){//上报地理位置事件
			responseMsg = ToolMessage.recevie_event_location(recverMsg);
			
		}else if(event.equals(ToolMessage.recevie_event_click)){//点击菜单拉取消息时的事件推送
			responseMsg = ToolMessage.recevie_event_click(recverMsg);
			
		}else if(event.equals(ToolMessage.recevie_event_view)){//点击菜单跳转链接时的事件推送
			responseMsg = ToolMessage.recevie_event_view(recverMsg);
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
		
		if (msgType.equals(ToolMessage.recevie_msg_text)) {// 文本消息
			responseMsg = ToolMessage.recevie_msg_text(recverMsg);

		} else if (msgType.equals(ToolMessage.recevie_msg_image)) {// 图片消息
			responseMsg = ToolMessage.recevie_msg_image(recverMsg);

		} else if (msgType.equals(ToolMessage.recevie_msg_voice)) {// 语音消息
			responseMsg = ToolMessage.recevie_msg_voice(recverMsg);
			
		} else if (msgType.equals(ToolMessage.recevie_msg_video)) {// 视频消息
			responseMsg = ToolMessage.recevie_msg_video(recverMsg);
			
		} else if (msgType.equals(ToolMessage.recevie_msg_location)) {// 地理位置消息
			responseMsg = ToolMessage.recevie_msg_location(recverMsg);
			
		} else if (msgType.equals(ToolMessage.recevie_msg_link)) {// 链接消息
			responseMsg = ToolMessage.recevie_msg_link(recverMsg);
		}
		
		return responseMsg;
	}

}
