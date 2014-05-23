package little.ant.weixin.vo.message;

/**
 * 响应消息基础类
 * @author 董华健
 */
public class ResponseMsgBase {
	
	private String ToUserName;	 //是	 接收方帐号（收到的OpenID）
	private String FromUserName;	// 是	开发者微信号
	private String CreateTime;	 //是	 消息创建时间 （整型）
	private String MsgType;	// 是	 text
	
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
	
}
