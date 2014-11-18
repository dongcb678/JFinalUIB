package little.ant.weixin.bo.message;

/**
 * 接收语音消息
 * @author 董华健
 */
public class RecevieMsgVoice extends RecevieMsgBase {
	
	private String MediaId;	 //语音消息媒体id，可以调用多媒体文件下载接口拉取数据。
	private String Format;	 //语音格式，如amr，speex等
	
	//开通语音识别功能，用户每次发送语音给公众号时，微信会在推送的语音消息XML数据包中，增加一个Recongnition字段
	private String Recognition;	 //语音识别结果，UTF8编码
	
	public String getRecognition() {
		return Recognition;
	}
	public void setRecognition(String recognition) {
		Recognition = recognition;
	}
	public String getMediaId() {
		return MediaId;
	}
	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}
	public String getFormat() {
		return Format;
	}
	public void setFormat(String format) {
		Format = format;
	}
	
}
