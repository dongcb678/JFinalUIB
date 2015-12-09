package com.weixin.mvc.message;

import java.math.BigDecimal;
import java.sql.Timestamp;

import org.apache.log4j.Logger;

import com.platform.mvc.base.BaseModel;

@SuppressWarnings("unused")
//@Table(tableName= "wx_message")
public class Message extends BaseModel<Message> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Message.class);
	
	public static final Message dao = new Message();

	/**
	 * 字段描述： 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：0接收，1发出 
	 * 字段类型：character  长度：1
	 */
	public static final String column_inouts = "inouts";
	
	/**
	 * 字段描述：数据类型：XML或者JSON，0表示XML，1表示JSON 
	 * 字段类型：character  长度：1
	 */
	public static final String column_datatype = "datatype";
	
	/**
	 * 字段描述：接收或者发出的数据xml或者json 
	 * 字段类型：text  长度：null
	 */
	public static final String column_datacontent = "datacontent";
	
	/**
	 * 字段描述： 
	 * 字段类型：timestamp with time zone  长度：null
	 */
	public static final String column_createdate = "createdate";
	
	/**
	 * 字段描述： 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_msgtype = "msgtype";
	
	/**
	 * 字段描述： 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_event = "event";
	
	/**
	 * 字段描述： 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_eventkey = "eventkey";
	
	/**
	 * 字段描述： 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_tousername = "tousername";
	
	/**
	 * 字段描述：发送方帐号（一个OpenID） 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_fromusername = "fromusername";
	
	/**
	 * 字段描述：消息创建时间 （11位整型） 
	 * 字段类型：numeric  长度：null
	 */
	public static final String column_createtime = "createtime";
	
	/**
	 * 字段描述：消息id，64位整型 
	 * 字段类型：numeric  长度：null
	 */
	public static final String column_msgid = "msgid";
	
	/**
	 * 字段描述：图片链接 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_picurl = "picurl";
	
	/**
	 * 字段描述：图片消息媒体id，可以调用多媒体文件下载接口拉取数据 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_mediaid = "mediaid";
	
	/**
	 * 字段描述：消息标题 
	 * 字段类型：character varying  长度：100
	 */
	public static final String column_title = "title";
	
	/**
	 * 字段描述：消息描述 
	 * 字段类型：text  长度：null
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：消息链接 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_url = "url";
	
	/**
	 * 字段描述：地理位置维度 
	 * 字段类型：numeric  长度：null
	 */
	public static final String column_location_x = "location_x";
	
	/**
	 * 字段描述：地理位置经度 
	 * 字段类型：numeric  长度：null
	 */
	public static final String column_location_y = "location_y";
	
	/**
	 * 字段描述：地图缩放大小 
	 * 字段类型：numeric  长度：null
	 */
	public static final String column_scale = "scale";
	
	/**
	 * 字段描述：地理位置信息 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_labels = "labels";
	
	/**
	 * 字段描述：文本消息内容 
	 * 字段类型：text  长度：null
	 */
	public static final String column_content = "content";
	
	/**
	 * 字段描述：视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_thumbmediaid = "thumbmediaid";
	
	/**
	 * 字段描述：语音格式，如amr，speex等 
	 * 字段类型：character varying  长度：20
	 */
	public static final String column_format = "format";
	
	/**
	 * 字段描述：语音识别结果，UTF8编码 
	 * 字段类型：text  长度：null
	 */
	public static final String column_recognition = "recognition";
	
	/**
	 * 字段描述：地理位置纬度 
	 * 字段类型：numeric  长度：null
	 */
	public static final String column_latitude = "latitude";
	
	/**
	 * 字段描述：地理位置经度 
	 * 字段类型：numeric  长度：null
	 */
	public static final String column_longitude = "longitude";
	
	/**
	 * 字段描述：地理位置精度 
	 * 字段类型：numeric  长度：null
	 */
	public static final String column_precisions = "precisions";
	
	/**
	 * 字段描述：二维码的ticket，可用来换取二维码图片 
	 * 字段类型：text  长度：null
	 */
	public static final String column_ticket = "ticket";
	
	/**
	 * 字段描述：音乐链接 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_musicurl = "musicurl";
	
	/**
	 * 字段描述：高质量音乐链接，WIFI环境优先使用该链接播放音乐 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_hqmusicurl = "hqmusicurl";
	
	/**
	 * 字段描述：图文消息个数，限制为10条以内 
	 * 字段类型：numeric  长度：null
	 */
	public static final String column_articlecount = "articlecount";
	
	/**
	 * sqlId : weixin.message.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "weixin.message.splitPageFrom";

	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setInouts(String inouts){
		set(column_inouts, inouts);
	}
	public String getInouts() {
		return get(column_inouts);
	}
	public void setDatatype(String datatype){
		set(column_datatype, datatype);
	}
	public String getDatatype() {
		return get(column_datatype);
	}
	public void setDatacontent(String datacontent){
		set(column_datacontent, datacontent);
	}
	public String getDatacontent() {
		return get(column_datacontent);
	}
	public void setCreatedate(Timestamp createdate){
		set(column_createdate, createdate);
	}
	public Timestamp getCreatedate() {
		return get(column_createdate);
	}
	public void setMsgtype(String msgtype){
		set(column_msgtype, msgtype);
	}
	public String getMsgtype() {
		return get(column_msgtype);
	}
	public void setEvent(String event){
		set(column_event, event);
	}
	public String getEvent() {
		return get(column_event);
	}
	public void setEventkey(String eventkey){
		set(column_eventkey, eventkey);
	}
	public String getEventkey() {
		return get(column_eventkey);
	}
	public void setTousername(String tousername){
		set(column_tousername, tousername);
	}
	public String getTousername() {
		return get(column_tousername);
	}
	public void setFromusername(String fromusername){
		set(column_fromusername, fromusername);
	}
	public String getFromusername() {
		return get(column_fromusername);
	}
	public void setCreatetime(BigDecimal createtime){
		set(column_createtime, createtime);
	}
	public BigDecimal getCreatetime() {
		return get(column_createtime);
	}
	public void setMsgid(BigDecimal msgid){
		set(column_msgid, msgid);
	}
	public BigDecimal getMsgid() {
		return get(column_msgid);
	}
	public void setPicurl(String picurl){
		set(column_picurl, picurl);
	}
	public String getPicurl() {
		return get(column_picurl);
	}
	public void setMediaid(String mediaid){
		set(column_mediaid, mediaid);
	}
	public String getMediaid() {
		return get(column_mediaid);
	}
	public void setTitle(String title){
		set(column_title, title);
	}
	public String getTitle() {
		return get(column_title);
	}
	public void setDescription(String description){
		set(column_description, description);
	}
	public String getDescription() {
		return get(column_description);
	}
	public void setUrl(String url){
		set(column_url, url);
	}
	public String getUrl() {
		return get(column_url);
	}
	public void setLocation_x(BigDecimal location_x){
		set(column_location_x, location_x);
	}
	public BigDecimal getLocation_x() {
		return get(column_location_x);
	}
	public void setLocation_y(BigDecimal location_y){
		set(column_location_y, location_y);
	}
	public BigDecimal getLocation_y() {
		return get(column_location_y);
	}
	public void setScale(BigDecimal scale){
		set(column_scale, scale);
	}
	public BigDecimal getScale() {
		return get(column_scale);
	}
	public void setLabels(String labels){
		set(column_labels, labels);
	}
	public String getLabels() {
		return get(column_labels);
	}
	public void setContent(String content){
		set(column_content, content);
	}
	public String getContent() {
		return get(column_content);
	}
	public void setThumbmediaid(String thumbmediaid){
		set(column_thumbmediaid, thumbmediaid);
	}
	public String getThumbmediaid() {
		return get(column_thumbmediaid);
	}
	public void setFormat(String format){
		set(column_format, format);
	}
	public String getFormat() {
		return get(column_format);
	}
	public void setRecognition(String recognition){
		set(column_recognition, recognition);
	}
	public String getRecognition() {
		return get(column_recognition);
	}
	public void setLatitude(BigDecimal latitude){
		set(column_latitude, latitude);
	}
	public BigDecimal getLatitude() {
		return get(column_latitude);
	}
	public void setLongitude(BigDecimal longitude){
		set(column_longitude, longitude);
	}
	public BigDecimal getLongitude() {
		return get(column_longitude);
	}
	public void setPrecisions(BigDecimal precisions){
		set(column_precisions, precisions);
	}
	public BigDecimal getPrecisions() {
		return get(column_precisions);
	}
	public void setTicket(String ticket){
		set(column_ticket, ticket);
	}
	public String getTicket() {
		return get(column_ticket);
	}
	public void setMusicurl(String musicurl){
		set(column_musicurl, musicurl);
	}
	public String getMusicurl() {
		return get(column_musicurl);
	}
	public void setHqmusicurl(String hqmusicurl){
		set(column_hqmusicurl, hqmusicurl);
	}
	public String getHqmusicurl() {
		return get(column_hqmusicurl);
	}
	public void setArticlecount(BigDecimal articlecount){
		set(column_articlecount, articlecount);
	}
	public BigDecimal getArticlecount() {
		return get(column_articlecount);
	}
	
}
