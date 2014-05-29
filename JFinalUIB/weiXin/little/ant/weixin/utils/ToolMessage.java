package little.ant.weixin.utils;

import java.util.Date;
import java.util.List;

import little.ant.pingtai.utils.ToolUtils;
import little.ant.pingtai.utils.ToolXml;
import little.ant.weixin.vo.map.RecevieBaiduPlace;
import little.ant.weixin.vo.map.RecevieUserLocation;
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
import little.ant.weixin.vo.message.ResponseMsgArticle;
import little.ant.weixin.vo.message.ResponseMsgNews;
import little.ant.weixin.vo.message.ResponseMsgText;

/**
 * 接收消息处理
 * @author 董华健
 */
public class ToolMessage {

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
		String toUserName = subscribe.getToUserName();//开发者
		String fromUserName = subscribe.getFromUserName();//发送者
		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("您是否有过出门在外四处找ATM或厕所的经历？").append("\n\n");
		contentBuffer.append("您是否有过出差在外搜寻美食或娱乐场所的经历？").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(fromUserName);
		text.setFromUserName(toUserName);
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		return ToolXml.beanToXml(text);
	}
	
	/**
	 * 订阅：扫描二维码事件1：如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
	 * @param subscribe
	 * @return
	 */
	public static String recevie_event_subscribe_scan(RecevieEventQRCode qrCode){
		String toUserName = qrCode.getToUserName();// 开发者
		String fromUserName = qrCode.getFromUserName();// 发送者
		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("您是否有过出门在外四处找ATM或厕所的经历？").append("\n\n");
		contentBuffer.append("您是否有过出差在外搜寻美食或娱乐场所的经历？").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(fromUserName);
		text.setFromUserName(toUserName);
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		return ToolXml.beanToXml(text);
	}
	
	/**
	 * 取消订阅
	 * @param subscribe
	 * @return
	 */
	public static String recevie_event_unsubscribe(RecevieEventSubscribe subscribe){
		String toUserName = subscribe.getToUserName();// 开发者
		String fromUserName = subscribe.getFromUserName();// 发送者
		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("谢谢！欢迎下次光临！:）").append("\n\n");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(fromUserName);
		text.setFromUserName(toUserName);
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		return ToolXml.beanToXml(text);
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
		String toUserName = text.getToUserName();//开发者
		String fromUserName = text.getFromUserName();//发送者
		String content = text.getContent();
		String responseContent = "文本消息";
		if (content.startsWith("附近")) {// 周边搜索
			String keyWord = content.replaceAll("附近", "").trim();
			// 获取用户最后一次发送的地理位置
			little.ant.weixin.model.Location location = little.ant.weixin.model.Location.dao.findFirst("select * form wx_userlocation where open_id=? order by createdate desc ", fromUserName);
			// 未获取到
			if (null == location) {
				responseContent = getUsage();
			} else {
				// 根据转换后（纠偏）的坐标搜索周边POI
				String bd09Lng = location.getStr("bd09_lng");
				String bd09Lat = location.getStr("bd09_lat");
				List<RecevieBaiduPlace> placeList = ToolBaiduMap.searchPlace(keyWord, bd09Lng, bd09Lat);
				// 未搜索到POI
				if (null == placeList || 0 == placeList.size()) {
					responseContent = String.format("/难过，您发送的位置附近未搜索到“%s”信息！", keyWord);
				} else {
					List<ResponseMsgArticle> articleList = ToolBaiduMap.makeArticleList(placeList, bd09Lng, bd09Lat);
					// 回复图文消息
					ResponseMsgNews newsMessage = new ResponseMsgNews();
					newsMessage.setToUserName(fromUserName);
					newsMessage.setFromUserName(toUserName);
					newsMessage.setCreateTime(String.valueOf(new Date().getTime()));
					newsMessage.setMsgType("news");
					newsMessage.setArticles(articleList);
					newsMessage.setArticleCount(String.valueOf(articleList.size()));
					return ToolXml.beanToXml(newsMessage);
				}
			}
		}
		
		// 返回xml
		StringBuffer sb = new StringBuffer();
		sb.append("<xml>");
		sb.append("<ToUserName><![CDATA["+fromUserName+"]]></ToUserName>");
		sb.append("<FromUserName><![CDATA["+toUserName+"]]></FromUserName>");
		sb.append("<CreateTime>"+new Date().getTime()+"</CreateTime>");
		sb.append("<MsgType><![CDATA[text]]></MsgType>");
		sb.append("<Content><![CDATA[").append(responseContent).append("]]></Content>");
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
		String toUserName = location.getToUserName();//开发者
		String fromUserName = location.getFromUserName();//发送者
		// 用户发送的经纬度
		String lng = location.getLocation_Y();
		String lat = location.getLocation_X();
		// 坐标转换后的经纬度
		String bd09Lng = null;
		String bd09Lat = null;
		// 调用接口转换坐标
		RecevieUserLocation userLocation = ToolBaiduMap.convertCoord(lng, lat);
		if (null != userLocation) {
			bd09Lng = userLocation.getBd09Lng();
			bd09Lat = userLocation.getBd09Lat();
		}
		
		// 保存用户地理位置
		little.ant.weixin.model.Location uLocation = new little.ant.weixin.model.Location();
		uLocation.set("ids", ToolUtils.getUuidByJdk(true));
		uLocation.set("open_id", fromUserName);
		uLocation.set("lng", lng);
		uLocation.set("lat", lat);
		uLocation.set("bd09_lng", bd09Lng);
		uLocation.set("bd09_lat", bd09Lat);
		long starttime = new Date().getTime();
		uLocation.set("createdate", new java.sql.Timestamp(starttime));//创建时间
		uLocation.save();
		
		//回显信息
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("[愉快]").append("成功接收您的位置！").append("\n\n");
		contentBuffer.append("您可以输入搜索关键词获取周边信息了，例如：").append("\n");
		contentBuffer.append("        附近ATM").append("\n");
		contentBuffer.append("        附近KTV").append("\n");
		contentBuffer.append("        附近厕所").append("\n");
		contentBuffer.append("必须以“附近”两个字开头！");
		String content = contentBuffer.toString();
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(fromUserName);
		text.setFromUserName(toUserName);
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(content);
		return ToolXml.beanToXml(text);
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
	
	/**
	 * 使用说明
	 * @return
	 */
	private static String getUsage() {
		StringBuffer buffer = new StringBuffer();
		buffer.append("周边搜索使用说明").append("\n\n");
		buffer.append("1）发送地理位置").append("\n");
		buffer.append("点击窗口底部的“+”按钮，选择“位置”，点“发送”").append("\n\n");
		buffer.append("2）指定关键词搜索").append("\n");
		buffer.append("格式：附近+关键词\n例如：附近ATM、附近KTV、附近厕所");
		return buffer.toString();
	}
}
