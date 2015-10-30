package com.weixin.handler.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolSqlXml;
import com.platform.tools.ToolXml;
import com.weixin.constant.ConstantMsg;
import com.weixin.dto.map.RecevieBaiduPlace;
import com.weixin.dto.message.RecevieMsgText;
import com.weixin.dto.message.ResponseMsgArticle;
import com.weixin.dto.message.ResponseMsgNews;
import com.weixin.dto.message.ResponseMsgText;
import com.weixin.handler.BaseHandler;
import com.weixin.mvc.location.Location;
import com.weixin.mvc.message.Message;
import com.weixin.tools.ToolBaiduMap;

/**
 * 文本消息
 * @author 董华健  dongcb678@163.com
 */
public class TextHandler implements BaseHandler {

	@Override
	public Object handle(String message) {
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgText.class);
		RecevieMsgText recevieText = (RecevieMsgText) ToolXml.xmlToBean(message, map);

		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("inouts", ConstantMsg.message_inouts_in);
		messageIn.set("datatype", ConstantMsg.message_datatype_xml);
		messageIn.set("datacontent", message);//请求数据
		messageIn.set("createdate", ToolDateTime.getSqlTimestamp(null));//数据创建时间
		
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
			Location location = Location.dao.findFirst(ToolSqlXml.getSql("weixin.location.getByOpenId"), recevieText.getFromUserName());
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
					newsMessage.setCreateTime(String.valueOf(ToolDateTime.getDateByTime()));
					newsMessage.setMsgType("news");
					newsMessage.setArticles(articleList);
					newsMessage.setArticleCount(String.valueOf(articleList.size()));
					responseXml = ToolXml.beanToXml(newsMessage, ResponseMsgNews.class);

					//返回数据入库
					Message messageOut = new Message();
					messageOut.set("inouts", ConstantMsg.message_inouts_out);
					messageOut.set("datatype", ConstantMsg.message_datatype_xml);
					messageOut.set("datacontent", responseXml);//返回数据
					messageOut.set("createdate", ToolDateTime.getSqlTimestamp(null));//数据创建时间
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
			responseText.setCreateTime(String.valueOf(ToolDateTime.getDateByTime()));
			responseText.setMsgType("text");
			responseText.setContent(responseContent);
			responseXml = ToolXml.beanToXml(responseText, ResponseMsgText.class);
			
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
		}
		
		return responseXml;		
	}

	/**
	 * 使用说明
	 * @return
	 */
	private static String getUsage() {
		StringBuilder buffer = new StringBuilder();
		buffer.append("周边搜索使用说明").append("\n\n");
		buffer.append("1）发送地理位置").append("\n");
		buffer.append("点击窗口底部的“+”按钮，选择“位置”，点“发送”").append("\n\n");
		buffer.append("2）指定关键词搜索").append("\n");
		buffer.append("格式：附近+关键词\n例如：附近ATM、附近KTV、附近厕所");
		return buffer.toString();
	}
	
}
