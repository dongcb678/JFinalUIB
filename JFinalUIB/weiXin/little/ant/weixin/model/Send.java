package little.ant.weixin.model;

import com.jfinal.plugin.activerecord.Model;

public class Send extends Model<Send> {
	
	private static final long serialVersionUID = 2051998642258015518L;
	
	public static final Send dao = new Send();

	// 发送消息封装
	private String ToUserName;
	private String FromUserName;
	private String CreateTime = System.currentTimeMillis() + "";
	private String MsgType;
	private String Content;
	private String MediaId;
	private String Description;
	private String Video;
	private String Music;
	private String MusicUrl;
	private String HQMusicUrl;
	private String ThumbMediaId;
	private String ArticleCount;
	private String item;
	private String PicUrl;
	private String Url;
	private String touser;
	private String msgtype;
	private String text;
	private String access_token;
	private String image;
	private String media_id;
	private String voice;
	private String title;
	private String musicurl;
	private String hqmusicurl;
	private String thumb_media_id;
	private String news;
	private String articles;
	private String picurl;
	private String author;
	private String digest;
	private String content_source_url;
	private String created_at;
	private String filter;
	private String group_id;
	private String mpnews;
	private String mpvideo;
	private String errcode;
	private String errmsg;
	private String msg_id;
	private String OPENID1;
	private String OPENID2;
	private String msgid;
	private String Event;
	private String MsgID;
	private String Status;
	private String TotalCount;
	private String FilterCount;
	private String SentCount;
	private String ErrorCount;
	
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
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getVideo() {
		return Video;
	}
	public void setVideo(String video) {
		Video = video;
	}
	public String getMusic() {
		return Music;
	}
	public void setMusic(String music) {
		Music = music;
	}
	public String getMusicUrl() {
		return MusicUrl;
	}
	public void setMusicUrl(String musicUrl) {
		MusicUrl = musicUrl;
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
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
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
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMedia_id() {
		return media_id;
	}
	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}
	public String getVoice() {
		return voice;
	}
	public void setVoice(String voice) {
		this.voice = voice;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getNews() {
		return news;
	}
	public void setNews(String news) {
		this.news = news;
	}
	public String getArticles() {
		return articles;
	}
	public void setArticles(String articles) {
		this.articles = articles;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDigest() {
		return digest;
	}
	public void setDigest(String digest) {
		this.digest = digest;
	}
	public String getContent_source_url() {
		return content_source_url;
	}
	public void setContent_source_url(String content_source_url) {
		this.content_source_url = content_source_url;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getMpnews() {
		return mpnews;
	}
	public void setMpnews(String mpnews) {
		this.mpnews = mpnews;
	}
	public String getMpvideo() {
		return mpvideo;
	}
	public void setMpvideo(String mpvideo) {
		this.mpvideo = mpvideo;
	}
	public String getErrcode() {
		return errcode;
	}
	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
	public String getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(String msg_id) {
		this.msg_id = msg_id;
	}
	public String getOPENID1() {
		return OPENID1;
	}
	public void setOPENID1(String oPENID1) {
		OPENID1 = oPENID1;
	}
	public String getOPENID2() {
		return OPENID2;
	}
	public void setOPENID2(String oPENID2) {
		OPENID2 = oPENID2;
	}
	public String getMsgid() {
		return msgid;
	}
	public void setMsgid(String msgid) {
		this.msgid = msgid;
	}
	public String getEvent() {
		return Event;
	}
	public void setEvent(String event) {
		Event = event;
	}
	public String getMsgID() {
		return MsgID;
	}
	public void setMsgID(String msgID) {
		MsgID = msgID;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getTotalCount() {
		return TotalCount;
	}
	public void setTotalCount(String totalCount) {
		TotalCount = totalCount;
	}
	public String getFilterCount() {
		return FilterCount;
	}
	public void setFilterCount(String filterCount) {
		FilterCount = filterCount;
	}
	public String getSentCount() {
		return SentCount;
	}
	public void setSentCount(String sentCount) {
		SentCount = sentCount;
	}
	public String getErrorCount() {
		return ErrorCount;
	}
	public void setErrorCount(String errorCount) {
		ErrorCount = errorCount;
	}
	
}
