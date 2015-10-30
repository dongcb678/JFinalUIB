package com.weixin.handler.event;

import java.util.HashMap;
import java.util.Map;

import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolXml;
import com.weixin.constant.ConstantMsg;
import com.weixin.dto.message.RecevieEventSubscribe;
import com.weixin.dto.message.ResponseMsgText;
import com.weixin.handler.BaseHandler;
import com.weixin.mvc.message.Message;

/**
 * 订阅
 * @author 董华健  dongcb678@163.com
 */
public class SubscribeHandler implements BaseHandler {

	@Override
	public Object handle(String message) {
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieEventSubscribe.class);
		RecevieEventSubscribe subscribe = (RecevieEventSubscribe) ToolXml.xmlToBean(message, map);
		
		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("inouts", ConstantMsg.message_inouts_in);
		messageIn.set("datatype", ConstantMsg.message_datatype_xml);
		messageIn.set("datacontent", message);//请求数据
		messageIn.set("createdate", ToolDateTime.getSqlTimestamp(null));//数据创建时间
		
		messageIn.set("ToUserName", subscribe.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", subscribe.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",subscribe.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", subscribe.getMsgType());// 消息类型，event
		messageIn.set("Event", subscribe.getEvent());// 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
		messageIn.save();

		//关注提示语
		StringBuilder contentBuffer = new StringBuilder();
		contentBuffer.append("您是否有过出门在外四处找ATM或厕所的经历？").append("\n\n");
		contentBuffer.append("您是否有过出差在外搜寻美食或娱乐场所的经历？").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(subscribe.getFromUserName());
		text.setFromUserName(subscribe.getToUserName());
		text.setCreateTime(String.valueOf(ToolDateTime.getDateByTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(text, ResponseMsgText.class);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("inouts", ConstantMsg.message_inouts_out);
		messageOut.set("datatype", ConstantMsg.message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", ToolDateTime.getSqlTimestamp(null));//数据创建时间
		messageOut.set("ToUserName", text.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", text.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",text.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", text.getMsgType());// 消息类型
		messageOut.set("content", text.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}

}
