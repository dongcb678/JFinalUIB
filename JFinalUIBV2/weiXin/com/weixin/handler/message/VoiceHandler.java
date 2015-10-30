package com.weixin.handler.message;

import java.util.HashMap;
import java.util.Map;

import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolXml;
import com.weixin.constant.ConstantMsg;
import com.weixin.dto.message.RecevieMsgVoice;
import com.weixin.dto.message.ResponseMsgText;
import com.weixin.handler.BaseHandler;
import com.weixin.mvc.message.Message;

/**
 * 语音消息
 * @author 董华健  dongcb678@163.com
 */
public class VoiceHandler implements BaseHandler {

	@Override
	public Object handle(String message) {
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgVoice.class);
		RecevieMsgVoice voice = (RecevieMsgVoice) ToolXml.xmlToBean(message, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("inouts", ConstantMsg.message_inouts_in);
		messageIn.set("datatype", ConstantMsg.message_datatype_xml);
		messageIn.set("datacontent", message);//请求数据
		messageIn.set("createdate", ToolDateTime.getSqlTimestamp(null));//数据创建时间
		
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
		StringBuilder contentBuffer = new StringBuilder();
		String recognition = voice.getRecognition();// 语音识别结果
		if(null != recognition){//接收语音识别结果
			
		}else{
			
		}
		
		//返回xml
		ResponseMsgText responseText = new ResponseMsgText();
		responseText.setToUserName(voice.getFromUserName());
		responseText.setFromUserName(voice.getToUserName());
		responseText.setCreateTime(String.valueOf(ToolDateTime.getDateByTime()));
		responseText.setMsgType("text");
		responseText.setContent(contentBuffer.toString());
		String responseXml = ToolXml.beanToXml(responseText, ResponseMsgText.class);
		
		//返回数据入库
		Message messageOut = new Message();
		messageOut.set("inouts", ConstantMsg.message_inouts_out);
		messageOut.set("datatype", ConstantMsg.message_datatype_xml);
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
