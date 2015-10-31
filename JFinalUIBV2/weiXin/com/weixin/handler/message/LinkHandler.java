package com.weixin.handler.message;

import java.util.HashMap;
import java.util.Map;

import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolXml;
import com.weixin.constant.ConstantTable;
import com.weixin.dto.message.RecevieMsgLink;
import com.weixin.dto.message.ResponseMsgText;
import com.weixin.handler.BaseHandler;
import com.weixin.mvc.message.Message;

/**
 * 链接消息
 * @author 董华健  dongcb678@163.com
 */
public class LinkHandler implements BaseHandler {

	@Override
	public Object handle(String message) {
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgLink.class);
		RecevieMsgLink link = (RecevieMsgLink) ToolXml.xmlToBean(message, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("inouts", ConstantTable.message_inouts_in);
		messageIn.set("datatype", ConstantTable.message_datatype_xml);
		messageIn.set("datacontent", message);//请求数据
		messageIn.set("createdate", ToolDateTime.getSqlTimestamp(null));//数据创建时间
		
		messageIn.set("ToUserName", link.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", link.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",link.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", link.getMsgType());// 消息类型，event
		
		messageIn.set("Title", link.getTitle());//消息标题
		messageIn.set("Description", link.getDescription());//消息描述
		messageIn.set("Url", link.getUrl());//消息链接	 
		messageIn.save();

		//回显信息
		StringBuilder contentBuffer = new StringBuilder();
		contentBuffer.append("您点击的啥链接呢？");
		
		//返回xml
		ResponseMsgText responseText = new ResponseMsgText();
		responseText.setToUserName(link.getFromUserName());
		responseText.setFromUserName(link.getToUserName());
		responseText.setCreateTime(String.valueOf(ToolDateTime.getDateByTime()));
		responseText.setMsgType("text");
		responseText.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(responseText, ResponseMsgText.class);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("inouts", ConstantTable.message_inouts_out);
		messageOut.set("datatype", ConstantTable.message_datatype_xml);
		messageOut.set("datacontent", responseXml);//返回数据
		messageOut.set("createdate", ToolDateTime.getSqlTimestamp(null));//数据创建时间
		messageOut.set("ToUserName", responseText.getToUserName());	// 开发者微信号
		messageOut.set("FromUserName", responseText.getFromUserName());// 发送方帐号（一个OpenID）
		messageOut.set("CreateTime",responseText.getCreateTime());// 消息创建时间 （整型）
		messageOut.set("MsgType", responseText.getMsgType());// 消息类型
		messageOut.set("content", responseText.getContent());// 消息内容
		messageOut.save();
		
		return responseXml;
	}

}
