package little.ant.weixin.tools;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.tools.ToolUtils;
import little.ant.pingtai.tools.ToolXml;
import little.ant.weixin.model.Location;
import little.ant.weixin.model.Message;
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
	 * wx_message表字段值
	 */
	public static final String message_inouts_in = "0";//接受的消息
	public static final String message_inouts_out = "1";//发出的消息
	public static final String message_datatype_xml = "0";//数据类型XML
	public static final String message_datatype_json = "1";//数据类型JSON
	
	/**
	 * 订阅
	 * @param recverMsg
	 * @return
	 */
	public static String recevie_event_subscribe(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieEventSubscribe.class);
		RecevieEventSubscribe subscribe = (RecevieEventSubscribe) ToolXml.xmlToBean(recverMsg, map);
		
		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", subscribe.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", subscribe.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",subscribe.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", subscribe.getMsgType());// 消息类型，event
		messageIn.set("Event", subscribe.getEvent());// 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
		messageIn.save();

		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("您是否有过出门在外四处找ATM或厕所的经历？").append("\n\n");
		contentBuffer.append("您是否有过出差在外搜寻美食或娱乐场所的经历？").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(subscribe.getFromUserName());
		text.setFromUserName(subscribe.getToUserName());
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(text);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", text.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", text.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",text.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", text.getMsgType());// 消息类型
		messageOut.set("content", text.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}
	
	/**
	 * 订阅：扫描二维码事件1：如果用户还未关注公众号，则用户可以关注公众号，关注后微信会将带场景值关注事件推送给开发者。
	 * @param recverMsg
	 * @return
	 */
	public static String recevie_event_subscribe_scan(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieEventQRCode.class);
		RecevieEventQRCode qrCode = (RecevieEventQRCode) ToolXml.xmlToBean(recverMsg, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", qrCode.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", qrCode.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",qrCode.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", qrCode.getMsgType());// 消息类型，event
		messageIn.set("Event", qrCode.getEvent());// 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
		messageIn.set("EventKey", qrCode.getEventKey());//事件KEY值，qrscene_为前缀，后面为二维码的参数值
		messageIn.set("Ticket", qrCode.getTicket());//二维码的ticket，可用来换取二维码图片
		messageIn.save();
		
		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("您是否有过出门在外四处找ATM或厕所的经历？").append("\n\n");
		contentBuffer.append("您是否有过出差在外搜寻美食或娱乐场所的经历？").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(qrCode.getFromUserName());
		text.setFromUserName(qrCode.getToUserName());
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(text);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", text.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", text.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",text.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", text.getMsgType());// 消息类型
		messageOut.set("content", text.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}
	
	/**
	 * 取消订阅
	 * @param recverMsg
	 * @return
	 */
	public static String recevie_event_unsubscribe(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieEventSubscribe.class);
		RecevieEventSubscribe subscribe = (RecevieEventSubscribe) ToolXml.xmlToBean(recverMsg, map);
		
		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", subscribe.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", subscribe.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",subscribe.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", subscribe.getMsgType());// 消息类型，event
		messageIn.set("Event", subscribe.getEvent());// 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
		messageIn.save();
		
		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("谢谢！欢迎下次光临！:）").append("\n\n");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(subscribe.getFromUserName());
		text.setFromUserName(subscribe.getToUserName());
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(text);

		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", text.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", text.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",text.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", text.getMsgType());// 消息类型
		messageOut.set("content", text.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}

	/**
	 * 扫描二维码事件2：如果用户已经关注公众号，则微信会将带场景值扫描事件推送给开发者。
	 * @param qrCode
	 * @return
	 */
	public static String recevie_event_scan(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieEventQRCode.class);
		RecevieEventQRCode qrCode = (RecevieEventQRCode) ToolXml.xmlToBean(recverMsg, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", qrCode.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", qrCode.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",qrCode.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", qrCode.getMsgType());// 消息类型，event
		messageIn.set("Event", qrCode.getEvent());// 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
		messageIn.set("EventKey", qrCode.getEventKey());//事件KEY值，qrscene_为前缀，后面为二维码的参数值
		messageIn.set("Ticket", qrCode.getTicket());//二维码的ticket，可用来换取二维码图片
		messageIn.save();
		
		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("您已经关注了哦！").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(qrCode.getFromUserName());
		text.setFromUserName(qrCode.getToUserName());
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(text);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", text.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", text.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",text.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", text.getMsgType());// 消息类型
		messageOut.set("content", text.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}
	
	/**
	 * 上报地理位置事件
	 * @param location
	 * @return
	 */
	public static String recevie_event_location(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieEventLocation.class);
		RecevieEventLocation location = (RecevieEventLocation) ToolXml.xmlToBean(recverMsg, map);
		
		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", location.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", location.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",location.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", location.getMsgType());// 消息类型，event
		messageIn.set("Event", location.getEvent());// 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
		messageIn.set("Latitude", location.getLatitude());//地理位置纬度
		messageIn.set("Longitude", location.getLongitude());//地理位置经度
		messageIn.set("Precisions", location.getPrecision());//地理位置精度
		messageIn.save();
		
		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("您的位置已经收录！").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(location.getFromUserName());
		text.setFromUserName(location.getToUserName());
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(text);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", text.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", text.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",text.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", text.getMsgType());// 消息类型
		messageOut.set("content", text.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}

	/**
	 * 点击菜单拉取消息时的事件推送
	 * @param menu
	 * @return
	 */
	public static String recevie_event_click(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieEventMenu.class);
		RecevieEventMenu menu = (RecevieEventMenu) ToolXml.xmlToBean(recverMsg, map);
		
		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", menu.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", menu.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",menu.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", menu.getMsgType());// 消息类型，event
		messageIn.set("Event", menu.getEvent());// 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
		messageIn.set("EventKey", menu.getEventKey());//事件KEY值，与自定义菜单接口中KEY值对应
		messageIn.save();
		
		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("您的位置已经收录！").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(menu.getFromUserName());
		text.setFromUserName(menu.getToUserName());
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(text);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", text.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", text.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",text.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", text.getMsgType());// 消息类型
		messageOut.set("content", text.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}

	/**
	 * 点击菜单跳转链接时的事件推送
	 * @param menu
	 * @return
	 */
	public static String recevie_event_view(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieEventMenu.class);
		RecevieEventMenu menu = (RecevieEventMenu) ToolXml.xmlToBean(recverMsg, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", menu.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", menu.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",menu.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", menu.getMsgType());// 消息类型，event
		messageIn.set("Event", menu.getEvent());// 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
		messageIn.set("EventKey", menu.getEventKey());//事件KEY值，与自定义菜单接口中KEY值对应
		messageIn.save();
		
		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("您的位置已经收录！").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(menu.getFromUserName());
		text.setFromUserName(menu.getToUserName());
		text.setCreateTime(String.valueOf(new Date().getTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(text);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", text.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", text.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",text.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", text.getMsgType());// 消息类型
		messageOut.set("content", text.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}

	/**
	 * 文本消息
	 * @param text
	 * @return
	 */
	public static String recevie_msg_text(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgText.class);
		RecevieMsgText recevieText = (RecevieMsgText) ToolXml.xmlToBean(recverMsg, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", recevieText.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", recevieText.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",recevieText.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", recevieText.getMsgType());// 消息类型，event
		messageIn.set("content", recevieText.getContent());// 文本消息内容
		messageIn.save();
		
		String responseXml = "";
		String responseContent = "文本消息";
		String content = recevieText.getContent();
		if (content.startsWith("附近")) {// 周边搜索
			String keyWord = content.replaceAll("附近", "").trim();
			// 获取用户最后一次发送的地理位置
			Location location = Location.dao.findFirst("select * form wx_userlocation where open_id=? order by createdate desc ", recevieText.getFromUserName());
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
					newsMessage.setToUserName(recevieText.getFromUserName());
					newsMessage.setFromUserName(recevieText.getToUserName());
					newsMessage.setCreateTime(String.valueOf(new Date().getTime()));
					newsMessage.setMsgType("news");
					newsMessage.setArticles(articleList);
					newsMessage.setArticleCount(String.valueOf(articleList.size()));
					responseXml = ToolXml.beanToXml(newsMessage);

					//返回数据入库
					Message messageOut = new Message();
					messageOut.set("ids", ToolUtils.getUuidByJdk(true));
					messageOut.set("inouts", message_inouts_out);
					messageOut.set("datatype", message_datatype_xml);
					messageOut.set("datacontent", responseXml);//返回数据
					messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
					messageOut.set("ToUserName", newsMessage.getToUserName());	// 开发者微信号
					messageOut.set("FromUserName", newsMessage.getFromUserName());// 发送方帐号（一个OpenID）
					messageOut.set("CreateTime",newsMessage.getCreateTime());// 消息创建时间 （整型）
					messageOut.set("MsgType", newsMessage.getMsgType());// 消息类型
					messageOut.save();
				}
			}
		}
		
		if(null == responseXml || responseXml.isEmpty()){
			//返回xml
			ResponseMsgText responseText = new ResponseMsgText();
			responseText.setToUserName(recevieText.getFromUserName());
			responseText.setFromUserName(recevieText.getToUserName());
			responseText.setCreateTime(String.valueOf(new Date().getTime()));
			responseText.setMsgType("text");
			responseText.setContent(responseContent);
			responseXml = ToolXml.beanToXml(responseText);
			
			//返回数据入库
			Message messageOut = new Message();
			messageOut.set("ids", ToolUtils.getUuidByJdk(true));
			messageOut.set("inouts", message_inouts_out);
			messageOut.set("datatype", message_datatype_xml);
			messageOut.set("datacontent", responseXml);//返回数据
			messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
			messageOut.set("ToUserName", responseText.getToUserName());	// 开发者微信号
			messageOut.set("FromUserName", responseText.getFromUserName());// 发送方帐号（一个OpenID）
			messageOut.set("CreateTime",responseText.getCreateTime());// 消息创建时间 （整型）
			messageOut.set("MsgType", responseText.getMsgType());// 消息类型
			messageOut.set("content", responseText.getContent());// 消息内容
			messageOut.save();
		}
		
		return responseXml;
	}

	/**
	 * 图片消息
	 * @param image
	 * @return
	 */
	public static String recevie_msg_image(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgImage.class);
		RecevieMsgImage image = (RecevieMsgImage) ToolXml.xmlToBean(recverMsg, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", image.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", image.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",image.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", image.getMsgType());// 消息类型，event
		messageIn.set("PicUrl", image.getPicUrl());//图片链接
		messageIn.set("MediaId", image.getMediaId());//图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
		messageIn.save();

		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("图片已经收到！").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText responseText = new ResponseMsgText();
		responseText.setToUserName(image.getFromUserName());
		responseText.setFromUserName(image.getToUserName());
		responseText.setCreateTime(String.valueOf(new Date().getTime()));
		responseText.setMsgType("text");
		responseText.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(responseText);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", responseText.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", responseText.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",responseText.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", responseText.getMsgType());// 消息类型
		messageOut.set("content", responseText.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}

	/**
	 * 语音消息
	 * @param voice
	 * @return
	 */
	public static String recevie_msg_voice(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgVoice.class);
		RecevieMsgVoice voice = (RecevieMsgVoice) ToolXml.xmlToBean(recverMsg, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", voice.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", voice.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",voice.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", voice.getMsgType());// 消息类型，event
		
		messageIn.set("Format", voice.getFormat());//语音格式，如amr，speex等
		messageIn.set("MediaId", voice.getMediaId());//语音消息媒体id，可以调用多媒体文件下载接口拉取数据。
		//开通语音识别功能，用户每次发送语音给公众号时，微信会在推送的语音消息XML数据包中，增加一个Recongnition字段
		messageIn.set("Recognition", voice.getRecognition());//语音识别结果，UTF8编码
		messageIn.save();

		// 返回xml
		StringBuffer contentBuffer = new StringBuffer();
		String recognition = voice.getRecognition();// 语音识别结果
		if(null != recognition){//接收语音识别结果
			
		}else{
			
		}
		
		//返回xml
		ResponseMsgText responseText = new ResponseMsgText();
		responseText.setToUserName(voice.getFromUserName());
		responseText.setFromUserName(voice.getToUserName());
		responseText.setCreateTime(String.valueOf(new Date().getTime()));
		responseText.setMsgType("text");
		responseText.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(responseText);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", responseText.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", responseText.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",responseText.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", responseText.getMsgType());// 消息类型
		messageOut.set("content", responseText.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}

	/**
	 * 视频消息
	 * @param video
	 * @return
	 */
	public static String recevie_msg_video(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgVideo.class);
		RecevieMsgVideo video = (RecevieMsgVideo) ToolXml.xmlToBean(recverMsg, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", video.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", video.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",video.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", video.getMsgType());// 消息类型，event
		
		messageIn.set("MediaId", video.getMediaId());//视频消息媒体id，可以调用多媒体文件下载接口拉取数据。
		messageIn.set("ThumbMediaId", video.getThumbMediaId());//视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
		messageIn.save();

		//关注提示语
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("图片已经收到！").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText responseText = new ResponseMsgText();
		responseText.setToUserName(video.getFromUserName());
		responseText.setFromUserName(video.getToUserName());
		responseText.setCreateTime(String.valueOf(new Date().getTime()));
		responseText.setMsgType("text");
		responseText.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(responseText);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", responseText.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", responseText.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",responseText.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", responseText.getMsgType());// 消息类型
		messageOut.set("content", responseText.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}

	/**
	 * 地理位置消息
	 * @param location
	 * @return
	 */
	public static String recevie_msg_location(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgLocation.class);
		RecevieMsgLocation location = (RecevieMsgLocation) ToolXml.xmlToBean(recverMsg, map);
		String lng = location.getLocation_Y();// 用户发送的经纬度
		String lat = location.getLocation_X();// 用户发送的经纬度
		
		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", location.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", location.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",location.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", location.getMsgType());// 消息类型，event
		
		messageIn.set("Location_X", location.getLocation_X());//地理位置维度
		messageIn.set("Location_Y", location.getLocation_Y());//地理位置经度
		messageIn.set("Scale", location.getScale());//地图缩放大小
		messageIn.set("Label", location.getLabel());//地理位置信息 
		messageIn.save();
		
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
		uLocation.set("open_id", location.getFromUserName());
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
		
		//返回xml
		ResponseMsgText responseText = new ResponseMsgText();
		responseText.setToUserName(location.getFromUserName());
		responseText.setFromUserName(location.getToUserName());
		responseText.setCreateTime(String.valueOf(new Date().getTime()));
		responseText.setMsgType("text");
		responseText.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(responseText);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", responseText.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", responseText.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",responseText.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", responseText.getMsgType());// 消息类型
		messageOut.set("content", responseText.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}

	/**
	 * 链接消息
	 * @param link
	 * @return
	 */
	public static String recevie_msg_link(String recverMsg){
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgLink.class);
		RecevieMsgLink link = (RecevieMsgLink) ToolXml.xmlToBean(recverMsg, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("ids", ToolUtils.getUuidByJdk(true));
		messageIn.set("inouts", message_inouts_in);
		messageIn.set("datatype", message_datatype_xml);
		messageIn.set("datacontent", recverMsg);//请求数据
		messageIn.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		
		messageIn.set("ToUserName", link.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", link.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",link.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", link.getMsgType());// 消息类型，event
		
		messageIn.set("Title", link.getTitle());//消息标题
		messageIn.set("Description", link.getDescription());//消息描述
		messageIn.set("Url", link.getUrl());//消息链接	 
		messageIn.save();

		//回显信息
		StringBuffer contentBuffer = new StringBuffer();
		contentBuffer.append("您点击的啥链接呢？");
		
		//返回xml
		ResponseMsgText responseText = new ResponseMsgText();
		responseText.setToUserName(link.getFromUserName());
		responseText.setFromUserName(link.getToUserName());
		responseText.setCreateTime(String.valueOf(new Date().getTime()));
		responseText.setMsgType("text");
		responseText.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(responseText);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("ids", ToolUtils.getUuidByJdk(true));
		messageOut.set("inouts", message_inouts_out);
		messageOut.set("datatype", message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", new java.sql.Timestamp(new Date().getTime()));//数据创建时间
		messageOut.set("ToUserName", responseText.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", responseText.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",responseText.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", responseText.getMsgType());// 消息类型
		messageOut.set("content", responseText.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
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
