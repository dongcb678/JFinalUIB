package com.weixin.handler.message;

import java.util.HashMap;
import java.util.Map;

import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolXml;
import com.weixin.constant.ConstantTable;
import com.weixin.dto.map.RecevieUserLocation;
import com.weixin.dto.message.RecevieMsgLocation;
import com.weixin.dto.message.ResponseMsgText;
import com.weixin.handler.BaseHandler;
import com.weixin.mvc.message.Message;
import com.weixin.tools.ToolBaiduMap;

/**
 * 地理位置消息
 * @author 董华健  dongcb678@163.com
 */
public class LocationHandler implements BaseHandler {

	@Override
	public Object handle(String message) {
		//请求数据封装
		Map<String, Class<?>> map = new HashMap<String, Class<?>>();
		map.put("xml", RecevieMsgLocation.class);
		RecevieMsgLocation location = (RecevieMsgLocation) ToolXml.xmlToBean(message, map);
		String lng = location.getLocation_Y();// 用户发送的经纬度
		String lat = location.getLocation_X();// 用户发送的经纬度
		
		//请求数据入库
		Message messageIn = new Message();
		messageIn.set("inouts", ConstantTable.message_inouts_in);
		messageIn.set("datatype", ConstantTable.message_datatype_xml);
		messageIn.set("datacontent", message);//请求数据
		messageIn.set("createdate", ToolDateTime.getSqlTimestamp(null));//数据创建时间
		
		messageIn.set("ToUserName", location.getToUserName());	// 开发者微信号
		messageIn.set("FromUserName", location.getFromUserName());// 发送方帐号（一个OpenID）
		messageIn.set("CreateTime",location.getCreateTime());// 消息创建时间 （整型）
		messageIn.set("MsgType", location.getMsgType());// 消息类型，event
		
		messageIn.set("Location_X", location.getLocation_X());//地理位置维度
		messageIn.set("Location_Y", location.getLocation_Y());//地理位置经度
		messageIn.set("Scale", location.getScale());//地图缩放大小
		messageIn.set("Labels", location.getLabel());//地理位置信息 
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
		com.weixin.mvc.location.Location uLocation = new com.weixin.mvc.location.Location();
		uLocation.set("open_id", location.getFromUserName());
		uLocation.set("lng", lng);
		uLocation.set("lat", lat);
		uLocation.set("bd09_lng", bd09Lng);
		uLocation.set("bd09_lat", bd09Lat);
		long starttime = ToolDateTime.getDateByTime();
		uLocation.set("createdate", ToolDateTime.getSqlTimestamp(starttime));//创建时间
		uLocation.save();
		
		//回显信息
		StringBuilder contentBuffer = new StringBuilder();
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
