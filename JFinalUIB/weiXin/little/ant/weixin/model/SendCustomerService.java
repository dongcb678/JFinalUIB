package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 发送客服消息
 * @author 董华健
 */
public class SendCustomerService extends Model<RecevieUploadDown> {

	private static final long serialVersionUID = -6043878901713792021L;

	public static final SendCustomerService dao = new SendCustomerService();
	
	public String access_token;// 	是 	调用接口凭证
	public String touser;// 	是 	普通用户openid
	public String msgtype;// 	是 	消息类型，text
	public String content;// 	是 	文本消息内容 

	public String media_id;// 	是 	发送的图片的媒体ID 

	public String title;// 	否 	标题
	public String description;// 	否 	视频消息的描述 

	public String musicurl;// 	是 	音乐链接
	public String hqmusicurl;// 	是 	高品质音乐链接，wifi环境优先使用该链接播放音乐
	public String thumb_media_id;// 	是 	缩略图的媒体ID 

	public String url;// 	否 	点击后跳转的链接
	public String picurl;// 	否 	图文消息的图片链接，支持JPG、PNG格式，较好的效果为大图640*320，小图80*80 
	
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getTouser() {
		return touser;
	}
	public void setTouser(String touser) {
		this.touser = touser;
	}
	public String getMsgtype() {
		return msgtype;
	}
	public void setMsgtype(String msgtype) {
		this.msgtype = msgtype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMedia_id() {
		return media_id;
	}
	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMusicurl() {
		return musicurl;
	}
	public void setMusicurl(String musicurl) {
		this.musicurl = musicurl;
	}
	public String getHqmusicurl() {
		return hqmusicurl;
	}
	public void setHqmusicurl(String hqmusicurl) {
		this.hqmusicurl = hqmusicurl;
	}
	public String getThumb_media_id() {
		return thumb_media_id;
	}
	public void setThumb_media_id(String thumb_media_id) {
		this.thumb_media_id = thumb_media_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	
}
