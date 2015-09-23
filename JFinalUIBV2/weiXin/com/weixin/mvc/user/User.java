package com.weixin.mvc.user;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;

@SuppressWarnings("unused")
//@Table(tableName= "wx_user")
public class User extends BaseModel<User> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(User.class);
	
	public static final User dao = new User();

	/**
	 * 字段描述： 
	 * 字段类型：varchar(32)  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：用户的标识 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_openId = "openId";
	
	/**
	 * 字段描述：关注状态（1是关注，0是未关注），未关注时获取不到其余信息 
	 * 字段类型：char(1)  长度：1
	 */
	public static final String column_subscribe = "subscribe";
	
	/**
	 * 字段描述：用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间 
	 * 字段类型：decimal(20,0)  长度：null
	 */
	public static final String column_subscribeTime = "subscribeTime";
	
	/**
	 * 字段描述：昵称 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_nickname = "nickname";
	
	/**
	 * 字段描述：用户的性别（1是男性，2是女性，0是未知） 
	 * 字段类型：char(1)  长度：1
	 */
	public static final String column_sex = "sex";
	
	/**
	 * 字段描述：用户所在国家 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_country = "country";
	
	/**
	 * 字段描述：用户所在省份 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_province = "province";
	
	/**
	 * 字段描述：用户所在城市 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_city = "city";
	
	/**
	 * 字段描述：用户的语言，简体中文为zh_CN 
	 * 字段类型：varchar(50)  长度：50
	 */
	public static final String column_language = "language";
	
	/**
	 * 字段描述：用户头像 
	 * 字段类型：varchar(500)  长度：500
	 */
	public static final String column_headImgUrl = "headImgUrl";
	
	/**
	 * 字段描述： 
	 * 字段类型：varchar(32)  长度：32
	 */
	public static final String column_groupids = "groupids";
	
	
	/**
	 * sqlId : weixin.user.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "weixin.user.splitPageFrom";

	private String ids;
	private String openId;
	private String subscribe;
	private java.math.BigDecimal subscribeTime;
	private String nickname;
	private String sex;
	private String country;
	private String province;
	private String city;
	private String language;
	private String headImgUrl;
	private String groupids;

	public void setIds(String ids){
		set(column_ids, ids);
	}
	public <T> T getIds() {
		return get(column_ids);
	}
	public void setOpenId(String openId){
		set(column_openId, openId);
	}
	public <T> T getOpenId() {
		return get(column_openId);
	}
	public void setSubscribe(String subscribe){
		set(column_subscribe, subscribe);
	}
	public <T> T getSubscribe() {
		return get(column_subscribe);
	}
	public void setSubscribeTime(java.math.BigDecimal subscribeTime){
		set(column_subscribeTime, subscribeTime);
	}
	public <T> T getSubscribeTime() {
		return get(column_subscribeTime);
	}
	public void setNickname(String nickname){
		set(column_nickname, nickname);
	}
	public <T> T getNickname() {
		return get(column_nickname);
	}
	public void setSex(String sex){
		set(column_sex, sex);
	}
	public <T> T getSex() {
		return get(column_sex);
	}
	public void setCountry(String country){
		set(column_country, country);
	}
	public <T> T getCountry() {
		return get(column_country);
	}
	public void setProvince(String province){
		set(column_province, province);
	}
	public <T> T getProvince() {
		return get(column_province);
	}
	public void setCity(String city){
		set(column_city, city);
	}
	public <T> T getCity() {
		return get(column_city);
	}
	public void setLanguage(String language){
		set(column_language, language);
	}
	public <T> T getLanguage() {
		return get(column_language);
	}
	public void setHeadImgUrl(String headImgUrl){
		set(column_headImgUrl, headImgUrl);
	}
	public <T> T getHeadImgUrl() {
		return get(column_headImgUrl);
	}
	public void setGroupids(String groupids){
		set(column_groupids, groupids);
	}
	public <T> T getGroupids() {
		return get(column_groupids);
	}
	
}
