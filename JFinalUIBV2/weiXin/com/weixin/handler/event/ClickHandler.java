package com.weixin.handler.event;

import java.util.HashMap;
import java.util.Map;

import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolXml;
import com.weixin.constant.ConstantTable;
import com.weixin.dto.message.RecevieEventMenu;
import com.weixin.dto.message.ResponseMsgText;
import com.weixin.handler.BaseHandler;
import com.weixin.mvc.message.Message;

/**
 * 点击菜单拉取消息时的事件推送
 * @author 董华健  dongcb678@163.com
 */
public class ClickHandler implements BaseHandler {

	@Override
	public Object handle(String message) {
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieEventMenu.class);
		RecevieEventMenu menu = (RecevieEventMenu) ToolXml.xmlToBean(message, map);
		
		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("inouts", ConstantTable.message_inouts_in);
		messageIn.set("datatype", ConstantTable.message_datatype_xml);
		messageIn.set("datacontent", message);//请求数据
		messageIn.set("createdate", ToolDateTime.getSqlTimestamp(null));//数据创建时间
		
		messageIn.set("ToUserName", menu.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", menu.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",menu.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", menu.getMsgType());// 消息类型，event
		messageIn.set("Event", menu.getEvent());// 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
		messageIn.set("EventKey", menu.getEventKey());//事件KEY值，与自定义菜单接口中KEY值对应
		messageIn.save();
		
		//关注提示语
		StringBuilder contentBuffer = new StringBuilder();
		contentBuffer.append("您的位置已经收录！").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText text = new ResponseMsgText();
		text.setToUserName(menu.getFromUserName());
		text.setFromUserName(menu.getToUserName());
		text.setCreateTime(String.valueOf(ToolDateTime.getDateByTime()));
		text.setMsgType("text");
		text.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(text, ResponseMsgText.class);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("inouts", ConstantTable.message_inouts_out);
		messageOut.set("datatype", ConstantTable.message_datatype_xml);
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
