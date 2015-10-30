package com.weixin.constant;

public interface ConstantMsg {

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
	
}
