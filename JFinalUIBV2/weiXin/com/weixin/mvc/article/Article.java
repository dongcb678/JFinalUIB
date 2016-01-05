package com.weixin.mvc.article;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;

@SuppressWarnings("unused")
//@Table(tableName= "wx_article")
public class Article extends BaseModel<Article> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Article.class);
	
	public static final Article dao = new Article();

	/**
	 * 字段描述： 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述： 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_messageids = "messageids";
	
	/**
	 * 字段描述： 
	 * 字段类型：character varying  长度：100
	 */
	public static final String column_title = "title";
	
	/**
	 * 字段描述： 
	 * 字段类型：text  长度：null
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：图片链接，支持JPG、PNG格式，较好的效果为大图640*320，小图80*80 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_picurl = "picurl";
	
	/**
	 * 字段描述：点击图文消息跳转链接 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_url = "url";
	
	/**
	 * sqlId : test.article.splitPage
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage = "weixin.article.splitPage";

	private String ids;
	private String messageids;
	private String title;
	private String description;
	private String picurl;
	private String url;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setMessageids(String messageids){
		set(column_messageids, messageids);
	}
	public String getMessageids() {
		return get(column_messageids);
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
	public void setPicurl(String picurl){
		set(column_picurl, picurl);
	}
	public String getPicurl() {
		return get(column_picurl);
	}
	public void setUrl(String url){
		set(column_url, url);
	}
	public String getUrl() {
		return get(column_url);
	}
}
