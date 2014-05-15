package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 发送被动响应消息
 * @author 董华健
 */
public class SendPassiveness extends Model<RecevieUploadDown> {

	private static final long serialVersionUID = -7783873247458364053L;
	
	public static final SendPassiveness dao = new SendPassiveness();
	
	public String ToUserName; 	//是 	接收方帐号（收到的OpenID）
	public String FromUserName; 	//是 	开发者微信号
	public String CreateTime; 	//是 	消息创建时间 （整型）
	public String MsgType; 	//是 	text
	public String Content; 	//是 	回复的消息内容（换行：在content中能够换行，微信客户端就支持换行显示） 
	public String MediaId; 	//是 	通过上传多媒体文件，得到的id。 
	public String Title;	//否 	视频消息的标题
	public String Description; 	//否 	视频消息的描述 
	public String MusicURL; 	//否 	音乐链接
	public String HQMusicUrl; 	//否 	高质量音乐链接，WIFI环境优先使用该链接播放音乐
	public String ThumbMediaId; 	//是 	缩略图的媒体id，通过上传多媒体文件，得到的id 
	public String ArticleCount; 	//是 	图文消息个数，限制为10条以内
	public String Articles; 	//是 	多条图文消息信息，默认第一个item为大图,注意，如果图文数超过10，则将会无响应
	public String PicUrl; 	//否 	图片链接，支持JPG、PNG格式，较好的效果为大图360*200，小图200*200
	public String Url; 	//否 	点击图文消息跳转链接 
	
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
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getMediaId() {
		return MediaId;
	}
	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getMusicURL() {
		return MusicURL;
	}
	public void setMusicURL(String musicURL) {
		MusicURL = musicURL;
	}
	public String getHQMusicUrl() {
		return HQMusicUrl;
	}
	public void setHQMusicUrl(String hQMusicUrl) {
		HQMusicUrl = hQMusicUrl;
	}
	public String getThumbMediaId() {
		return ThumbMediaId;
	}
	public void setThumbMediaId(String thumbMediaId) {
		ThumbMediaId = thumbMediaId;
	}
	public String getArticleCount() {
		return ArticleCount;
	}
	public void setArticleCount(String articleCount) {
		ArticleCount = articleCount;
	}
	public String getArticles() {
		return Articles;
	}
	public void setArticles(String articles) {
		Articles = articles;
	}
	public String getPicUrl() {
		return PicUrl;
	}
	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
	public String getUrl() {
		return Url;
	}
	public void setUrl(String url) {
		Url = url;
	}
	
}
