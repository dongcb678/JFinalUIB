package com.weixin.dto.message;

import java.util.List;

/**
 * 回复图文消息
 * @author 董华健
 */
public class ResponseMsgNews extends ResponseMsgBase{
	
	private String ArticleCount;	 //是	 图文消息个数，限制为10条以内
	private List<ResponseMsgArticle> Articles;	 //是	 多条图文消息信息，默认第一个item为大图,注意，如果图文数超过10，则将会无响应
	private String Title;	 //否	 图文消息标题
	private String Description;	 //否	 图文消息描述
	private String PicUrl;	 //否	 图片链接，支持JPG、PNG格式，较好的效果为大图360*200，小图200*200
	private String Url;	 //否	 点击图文消息跳转链接
	
	public String getArticleCount() {
		return ArticleCount;
	}
	public void setArticleCount(String articleCount) {
		ArticleCount = articleCount;
	}
	public List<ResponseMsgArticle> getArticles() {
		return Articles;
	}
	public void setArticles(List<ResponseMsgArticle> articles) {
		Articles = articles;
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
