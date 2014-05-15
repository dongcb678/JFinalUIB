package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 接收语音识别消息
 * @author 董华健
 */
public class RecevieRecongnition extends Model<RecevieRecongnition> {

	private static final long serialVersionUID = 2051998642258015518L;

	public static final RecevieRecongnition dao = new RecevieRecongnition();
	
	public String ToUserName; 	//开发者微信号
	public String FromUserName; 	//发送方帐号（一个OpenID）
	public String CreateTime; 	//消息创建时间 （整型）
	public String MsgType; 	//语音为voice
	public String MediaID; 	//语音消息媒体id，可以调用多媒体文件下载接口拉取该媒体
	public String Format; 	//语音格式：amr
	public String Recognition; 	//语音识别结果，UTF8编码
	public String MsgID; 	//消息id，64位整型
	
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
	public String getMediaID() {
		return MediaID;
	}
	public void setMediaID(String mediaID) {
		MediaID = mediaID;
	}
	public String getFormat() {
		return Format;
	}
	public void setFormat(String format) {
		Format = format;
	}
	public String getRecognition() {
		return Recognition;
	}
	public void setRecognition(String recognition) {
		Recognition = recognition;
	}
	public String getMsgID() {
		return MsgID;
	}
	public void setMsgID(String msgID) {
		MsgID = msgID;
	}
	
}
