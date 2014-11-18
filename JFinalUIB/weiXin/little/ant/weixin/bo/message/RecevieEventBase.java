package little.ant.weixin.bo.message;

/**
 * 接收事件基础类
 * 
 * @author 董华健
 */
public class RecevieEventBase {

	private String ToUserName; // 开发者微信号
	private String FromUserName; // 发送方帐号（一个OpenID）
	private long CreateTime; // 消息创建时间 （整型）
	private String MsgType; // 消息类型，event
	private String Event; // 事件类型，subscribe(订阅)、unsubscribe(取消订阅)
	
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
	public long getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(long createTime) {
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
	
}
