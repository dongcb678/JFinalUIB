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
	 * 字段类型：varchar(32)  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述： 
	 * 字段类型：varchar(32)  长度：32
	 */
	public static final String column_messageids = "messageids";
	
	/**
	 * 字段描述： 
	 * 字段类型：varchar(100)  长度：100
	 */
	public static final String column_Title = "Title";
	
	/**
	 * 字段描述： 
	 * 字段类型：text  长度：65535
	 */
	public static final String column_Description = "Description";
	
	/**
	 * 字段描述：图片链接，支持JPG、PNG格式，较好的效果为大图640*320，小图80*80 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_PicUrl = "PicUrl";
	
	/**
	 * 字段描述：点击图文消息跳转链接 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_Url = "Url";
	
	
	/**
	 * sqlId : test.article.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "weixin.article.splitPageFrom";

	public void setIds(String ids){
		set(column_ids, ids);
	}
	public <T> T getIds() {
		return get(column_ids);
	}
	public void setMessageids(String messageids){
		set(column_messageids, messageids);
	}
	public <T> T getMessageids() {
		return get(column_messageids);
	}
	public void setTitle(String Title){
		set(column_Title, Title);
	}
	public <T> T getTitle() {
		return get(column_Title);
	}
	public void setDescription(String Description){
		set(column_Description, Description);
	}
	public <T> T getDescription() {
		return get(column_Description);
	}
	public void setPicUrl(String PicUrl){
		set(column_PicUrl, PicUrl);
	}
	public <T> T getPicUrl() {
		return get(column_PicUrl);
	}
	public void setUrl(String Url){
		set(column_Url, Url);
	}
	public <T> T getUrl() {
		return get(column_Url);
	}
	
}
