package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 接收事件消息
 * 
 * @author 董华健
 */
public class RecevieEvent extends Model<RecevieEvent> {

	private static final long serialVersionUID = 2051998642258015518L;

	public static final RecevieEvent dao = new RecevieEvent();

	public String ToUserName; // 开发者微信号
	public String FromUserName; // 发送方帐号（一个OpenID）
	public String CreateTime; // 消息创建时间 （整型）
	public String MsgType; // 消息类型，event
	public String Event; // 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
	public String EventKey; // 事件KEY值，qrscene_为前缀，后面为二维码的参数值
	public String Ticket; // 二维码的ticket，可用来换取二维码图片
	public String Latitude; // 地理位置纬度
	public String Longitude; // 地理位置经度
	public String Precision; // 地理位置精度
	
	public String getToUserName() {
		return ToUserName;
	}
	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}
	public String getFromUserName() {
		return FromUserName;
	}
	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}
	public String getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}
	public String getMsgType() {
		return MsgType;
	}
	public void setMsgType(String msgType) {
		MsgType = msgType;
	}
	public String getEvent() {
		return Event;
	}
	public void setEvent(String event) {
		Event = event;
	}
	public String getEventKey() {
		return EventKey;
	}
	public void setEventKey(String eventKey) {
		EventKey = eventKey;
	}
	public String getTicket() {
		return Ticket;
	}
	public void setTicket(String ticket) {
		Ticket = ticket;
	}
	public String getLatitude() {
		return Latitude;
	}
	public void setLatitude(String latitude) {
		Latitude = latitude;
	}
	public String getLongitude() {
		return Longitude;
	}
	public void setLongitude(String longitude) {
		Longitude = longitude;
	}
	public String getPrecision() {
		return Precision;
	}
	public void setPrecision(String precision) {
		Precision = precision;
	}
	
	
}
