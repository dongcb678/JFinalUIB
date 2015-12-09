package com.weixin.mvc.user;

import java.math.BigDecimal;

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
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：用户的标识 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_openid = "openid";
	
	/**
	 * 字段描述：关注状态（1是关注，0是未关注），未关注时获取不到其余信息 
	 * 字段类型：character  长度：1
	 */
	public static final String column_subscribe = "subscribe";
	
	/**
	 * 字段描述：用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间 
	 * 字段类型：numeric  长度：null
	 */
	public static final String column_subscribetime = "subscribetime";
	
	/**
	 * 字段描述：昵称 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_nickname = "nickname";
	
	/**
	 * 字段描述：用户的性别（1是男性，2是女性，0是未知） 
	 * 字段类型：character  长度：1
	 */
	public static final String column_sex = "sex";
	
	/**
	 * 字段描述：用户所在国家 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_country = "country";
	
	/**
	 * 字段描述：用户所在省份 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_province = "province";
	
	/**
	 * 字段描述：用户所在城市 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_city = "city";
	
	/**
	 * 字段描述：用户的语言，简体中文为zh_CN 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_language = "language";
	
	/**
	 * 字段描述：用户头像 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_headimgurl = "headimgurl";
	
	/**
	 * 字段描述： 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_groupids = "groupids";
	
	/**
	 * sqlId : weixin.user.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "weixin.user.splitPageFrom";

	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setOpenid(String openid){
		set(column_openid, openid);
	}
	public String getOpenid() {
		return get(column_openid);
	}
	public void setSubscribe(String subscribe){
		set(column_subscribe, subscribe);
	}
	public String getSubscribe() {
		return get(column_subscribe);
	}
	public void setSubscribetime(BigDecimal subscribetime){
		set(column_subscribetime, subscribetime);
	}
	public BigDecimal getSubscribetime() {
		return get(column_subscribetime);
	}
	public void setNickname(String nickname){
		set(column_nickname, nickname);
	}
	public String getNickname() {
		return get(column_nickname);
	}
	public void setSex(String sex){
		set(column_sex, sex);
	}
	public String getSex() {
		return get(column_sex);
	}
	public void setCountry(String country){
		set(column_country, country);
	}
	public String getCountry() {
		return get(column_country);
	}
	public void setProvince(String province){
		set(column_province, province);
	}
	public String getProvince() {
		return get(column_province);
	}
	public void setCity(String city){
		set(column_city, city);
	}
	public String getCity() {
		return get(column_city);
	}
	public void setLanguage(String language){
		set(column_language, language);
	}
	public String getLanguage() {
		return get(column_language);
	}
	public void setHeadimgurl(String headimgurl){
		set(column_headimgurl, headimgurl);
	}
	public String getHeadimgurl() {
		return get(column_headimgurl);
	}
	public void setGroupids(String groupids){
		set(column_groupids, groupids);
	}
	public String getGroupids() {
		return get(column_groupids);
	}
	
}
