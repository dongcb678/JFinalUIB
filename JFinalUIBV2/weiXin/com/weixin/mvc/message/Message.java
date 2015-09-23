package com.weixin.mvc.message;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;

@SuppressWarnings("unused")
//@Table(tableName= "wx_message")
public class Message extends BaseModel<Message> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Message.class);
	
	public static final Message dao = new Message();

	/**
	 * 字段描述： 
	 * 字段类型：varchar(32)  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：0接收，1发出 
	 * 字段类型：char(1)  长度：1
	 */
	public static final String column_inouts = "inouts";
	
	/**
	 * 字段描述：数据类型：XML或者JSON，0表示XML，1表示JSON 
	 * 字段类型：char(1)  长度：1
	 */
	public static final String column_datatype = "datatype";
	
	/**
	 * 字段描述：接收或者发出的数据xml或者json 
	 * 字段类型：text  长度：65535
	 */
	public static final String column_datacontent = "datacontent";
	
	/**
	 * 字段描述： 
	 * 字段类型：timestamp  长度：null
	 */
	public static final String column_createdate = "createdate";
	
	/**
	 * 字段描述： 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_msgType = "msgType";
	
	/**
	 * 字段描述： 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_Event = "Event";
	
	/**
	 * 字段描述： 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_EventKey = "EventKey";
	
	/**
	 * 字段描述： 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_ToUserName = "ToUserName";
	
	/**
	 * 字段描述：发送方帐号（一个OpenID） 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_FromUserName = "FromUserName";
	
	/**
	 * 字段描述：消息创建时间 （11位整型） 
	 * 字段类型：decimal(20,0)  长度：null
	 */
	public static final String column_CreateTime = "CreateTime";
	
	/**
	 * 字段描述：消息id，64位整型 
	 * 字段类型：decimal(64,0)  长度：null
	 */
	public static final String column_MsgId = "MsgId";
	
	/**
	 * 字段描述：图片链接 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_PicUrl = "PicUrl";
	
	/**
	 * 字段描述：图片消息媒体id，可以调用多媒体文件下载接口拉取数据 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_MediaId = "MediaId";
	
	/**
	 * 字段描述：消息标题 
	 * 字段类型：varchar(100)  长度：100
	 */
	public static final String column_Title = "Title";
	
	/**
	 * 字段描述：消息描述 
	 * 字段类型：text  长度：65535
	 */
	public static final String column_Description = "Description";
	
	/**
	 * 字段描述：消息链接 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_Url = "Url";
	
	/**
	 * 字段描述：地理位置维度 
	 * 字段类型：decimal(20,10)  长度：null
	 */
	public static final String column_Location_X = "Location_X";
	
	/**
	 * 字段描述：地理位置经度 
	 * 字段类型：decimal(20,10)  长度：null
	 */
	public static final String column_Location_Y = "Location_Y";
	
	/**
	 * 字段描述：地图缩放大小 
	 * 字段类型：decimal(20,0)  长度：null
	 */
	public static final String column_Scale = "Scale";
	
	/**
	 * 字段描述：地理位置信息 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_Labels = "Labels";
	
	/**
	 * 字段描述：文本消息内容 
	 * 字段类型：text  长度：65535
	 */
	public static final String column_Content = "Content";
	
	/**
	 * 字段描述：视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_ThumbMediaId = "ThumbMediaId";
	
	/**
	 * 字段描述：语音格式，如amr，speex等 
	 * 字段类型：varchar(20)  长度：20
	 */
	public static final String column_Format = "Format";
	
	/**
	 * 字段描述：语音识别结果，UTF8编码 
	 * 字段类型：text  长度：65535
	 */
	public static final String column_Recognition = "Recognition";
	
	/**
	 * 字段描述：地理位置纬度 
	 * 字段类型：decimal(20,10)  长度：null
	 */
	public static final String column_Latitude = "Latitude";
	
	/**
	 * 字段描述：地理位置经度 
	 * 字段类型：decimal(20,10)  长度：null
	 */
	public static final String column_Longitude = "Longitude";
	
	/**
	 * 字段描述：地理位置精度 
	 * 字段类型：decimal(20,10)  长度：null
	 */
	public static final String column_Precisions = "Precisions";
	
	/**
	 * 字段描述：二维码的ticket，可用来换取二维码图片 
	 * 字段类型：text  长度：65535
	 */
	public static final String column_Ticket = "Ticket";
	
	/**
	 * 字段描述：音乐链接 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_MusicURL = "MusicURL";
	
	/**
	 * 字段描述：高质量音乐链接，WIFI环境优先使用该链接播放音乐 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_HQMusicUrl = "HQMusicUrl";
	
	/**
	 * 字段描述：图文消息个数，限制为10条以内 
	 * 字段类型：decimal(2,0)  长度：null
	 */
	public static final String column_ArticleCount = "ArticleCount";
	
	
	/**
	 * sqlId : weixin.message.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "weixin.message.splitPageFrom";

	private String ids;
	private String inouts;
	private String datatype;
	private String datacontent;
	private java.sql.Timestamp createdate;
	private String msgType;
	private String Event;
	private String EventKey;
	private String ToUserName;
	private String FromUserName;
	private java.math.BigDecimal CreateTime;
	private java.math.BigDecimal MsgId;
	private String PicUrl;
	private String MediaId;
	private String Title;
	private String Description;
	private String Url;
	private java.math.BigDecimal Location_X;
	private java.math.BigDecimal Location_Y;
	private java.math.BigDecimal Scale;
	private String Labels;
	private String Content;
	private String ThumbMediaId;
	private String Format;
	private String Recognition;
	private java.math.BigDecimal Latitude;
	private java.math.BigDecimal Longitude;
	private java.math.BigDecimal Precisions;
	private String Ticket;
	private String MusicURL;
	private String HQMusicUrl;
	private java.math.BigDecimal ArticleCount;

	public void setIds(String ids){
		set(column_ids, ids);
	}
	public <T> T getIds() {
		return get(column_ids);
	}
	public void setInouts(String inouts){
		set(column_inouts, inouts);
	}
	public <T> T getInouts() {
		return get(column_inouts);
	}
	public void setDatatype(String datatype){
		set(column_datatype, datatype);
	}
	public <T> T getDatatype() {
		return get(column_datatype);
	}
	public void setDatacontent(String datacontent){
		set(column_datacontent, datacontent);
	}
	public <T> T getDatacontent() {
		return get(column_datacontent);
	}
	public void setCreatedate(java.sql.Timestamp createdate){
		set(column_createdate, createdate);
	}
	public <T> T getCreatedate() {
		return get(column_createdate);
	}
	public void setMsgType(String msgType){
		set(column_msgType, msgType);
	}
	public <T> T getMsgType() {
		return get(column_msgType);
	}
	public void setEvent(String Event){
		set(column_Event, Event);
	}
	public <T> T getEvent() {
		return get(column_Event);
	}
	public void setEventKey(String EventKey){
		set(column_EventKey, EventKey);
	}
	public <T> T getEventKey() {
		return get(column_EventKey);
	}
	public void setToUserName(String ToUserName){
		set(column_ToUserName, ToUserName);
	}
	public <T> T getToUserName() {
		return get(column_ToUserName);
	}
	public void setFromUserName(String FromUserName){
		set(column_FromUserName, FromUserName);
	}
	public <T> T getFromUserName() {
		return get(column_FromUserName);
	}
	public void setCreateTime(java.math.BigDecimal CreateTime){
		set(column_CreateTime, CreateTime);
	}
	public <T> T getCreateTime() {
		return get(column_CreateTime);
	}
	public void setMsgId(java.math.BigDecimal MsgId){
		set(column_MsgId, MsgId);
	}
	public <T> T getMsgId() {
		return get(column_MsgId);
	}
	public void setPicUrl(String PicUrl){
		set(column_PicUrl, PicUrl);
	}
	public <T> T getPicUrl() {
		return get(column_PicUrl);
	}
	public void setMediaId(String MediaId){
		set(column_MediaId, MediaId);
	}
	public <T> T getMediaId() {
		return get(column_MediaId);
	}
	public void setTitle(String Title){
		set(column_Title, Title);
	}
	public <T> T getTitle() {
		return get(column_Title);
	}
	public void setDescription(String Description){
		set(column_Description, Description);
	}
	public <T> T getDescription() {
		return get(column_Description);
	}
	public void setUrl(String Url){
		set(column_Url, Url);
	}
	public <T> T getUrl() {
		return get(column_Url);
	}
	public void setLocation_X(java.math.BigDecimal Location_X){
		set(column_Location_X, Location_X);
	}
	public <T> T getLocation_X() {
		return get(column_Location_X);
	}
	public void setLocation_Y(java.math.BigDecimal Location_Y){
		set(column_Location_Y, Location_Y);
	}
	public <T> T getLocation_Y() {
		return get(column_Location_Y);
	}
	public void setScale(java.math.BigDecimal Scale){
		set(column_Scale, Scale);
	}
	public <T> T getScale() {
		return get(column_Scale);
	}
	public void setLabels(String Labels){
		set(column_Labels, Labels);
	}
	public <T> T getLabels() {
		return get(column_Labels);
	}
	public void setContent(String Content){
		set(column_Content, Content);
	}
	public <T> T getContent() {
		return get(column_Content);
	}
	public void setThumbMediaId(String ThumbMediaId){
		set(column_ThumbMediaId, ThumbMediaId);
	}
	public <T> T getThumbMediaId() {
		return get(column_ThumbMediaId);
	}
	public void setFormat(String Format){
		set(column_Format, Format);
	}
	public <T> T getFormat() {
		return get(column_Format);
	}
	public void setRecognition(String Recognition){
		set(column_Recognition, Recognition);
	}
	public <T> T getRecognition() {
		return get(column_Recognition);
	}
	public void setLatitude(java.math.BigDecimal Latitude){
		set(column_Latitude, Latitude);
	}
	public <T> T getLatitude() {
		return get(column_Latitude);
	}
	public void setLongitude(java.math.BigDecimal Longitude){
		set(column_Longitude, Longitude);
	}
	public <T> T getLongitude() {
		return get(column_Longitude);
	}
	public void setPrecisions(java.math.BigDecimal Precisions){
		set(column_Precisions, Precisions);
	}
	public <T> T getPrecisions() {
		return get(column_Precisions);
	}
	public void setTicket(String Ticket){
		set(column_Ticket, Ticket);
	}
	public <T> T getTicket() {
		return get(column_Ticket);
	}
	public void setMusicURL(String MusicURL){
		set(column_MusicURL, MusicURL);
	}
	public <T> T getMusicURL() {
		return get(column_MusicURL);
	}
	public void setHQMusicUrl(String HQMusicUrl){
		set(column_HQMusicUrl, HQMusicUrl);
	}
	public <T> T getHQMusicUrl() {
		return get(column_HQMusicUrl);
	}
	public void setArticleCount(java.math.BigDecimal ArticleCount){
		set(column_ArticleCount, ArticleCount);
	}
	public <T> T getArticleCount() {
		return get(column_ArticleCount);
	}
	
}
