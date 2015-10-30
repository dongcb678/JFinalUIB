package com.weixin.handler.message;

import java.util.HashMap;
import java.util.Map;

import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolXml;
import com.weixin.constant.ConstantMsg;
import com.weixin.dto.message.RecevieMsgImage;
import com.weixin.dto.message.ResponseMsgText;
import com.weixin.handler.BaseHandler;
import com.weixin.mvc.message.Message;

/**
 * 图片消息
 * @author 董华健  dongcb678@163.com
 */
public class ImageHandler implements BaseHandler {

	@Override
	public Object handle(String message) {
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgImage.class);
		RecevieMsgImage image = (RecevieMsgImage) ToolXml.xmlToBean(message, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("inouts", ConstantMsg.message_inouts_in);
		messageIn.set("datatype", ConstantMsg.message_datatype_xml);
		messageIn.set("datacontent", message);//请求数据
		messageIn.set("createdate", ToolDateTime.getSqlTimestamp(null));//数据创建时间
		
		messageIn.set("ToUserName", image.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", image.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",image.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", image.getMsgType());// 消息类型，event
		messageIn.set("PicUrl", image.getPicUrl());//图片链接
		messageIn.set("MediaId", image.getMediaId());//图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
		messageIn.save();

		//关注提示语
		StringBuilder contentBuffer = new StringBuilder();
		contentBuffer.append("图片已经收到！").append("\n\n");
		contentBuffer.append("周边搜索为您的出行保驾护航，为您提供专业的周边生活指南，回复“附近”开始体验吧！");
		
		//返回xml
		ResponseMsgText responseText = new ResponseMsgText();
		responseText.setToUserName(image.getFromUserName());
		responseText.setFromUserName(image.getToUserName());
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
