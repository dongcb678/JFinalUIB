package com.platform.mvc.user;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;
import com.platform.plugin.ParamInitPlugin;
import com.platform.tools.ToolCache;

/**
 * 用户详情model
 * @author 董华健
 */
@SuppressWarnings("unused")
//@Table(tableName = "pt_userinfo")
public class UserInfo extends BaseModel<UserInfo> {

	private static final long serialVersionUID = 2592706064072264621L;

	private static Logger log = Logger.getLogger(UserInfo.class);
	
	public static final UserInfo dao = new UserInfo();

	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型 ：bigint 
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：地址 
	 * 字段类型 ：character varying 
	 */
	public static final String column_address = "address";
	
	/**
	 * 字段描述：地址扩展 
	 * 字段类型 ：character varying 
	 */
	public static final String column_addressinfo = "addressinfo";
	
	/**
	 * 字段描述：体重 
	 * 字段类型 ：character varying 
	 */
	public static final String column_avoirdupois = "avoirdupois";
	
	/**
	 * 字段描述：生日 
	 * 字段类型 ：date 
	 */
	public static final String column_birthday = "birthday";
	
	/**
	 * 字段描述：血型 
	 * 字段类型 ：character varying 
	 */
	public static final String column_bloodgroup = "bloodgroup";
	
	/**
	 * 字段描述：clientlevelend 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String column_clientlevelend = "clientlevelend";
	
	/**
	 * 字段描述：clientlevelstart 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String column_clientlevelstart = "clientlevelstart";
	
	/**
	 * 字段描述：文化程度 
	 * 字段类型 ：character varying 
	 */
	public static final String column_culture = "culture";
	
	/**
	 * 字段描述：描述 
	 * 字段类型 ：character varying 
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：邮箱 
	 * 字段类型 ：character varying 
	 */
	public static final String column_email = "email";
	
	/**
	 * 字段描述：毕业时间 
	 * 字段类型 ：date 
	 */
	public static final String column_finishschooldate = "finishschooldate";
	
	/**
	 * 字段描述：民族 
	 * 字段类型 ：character varying 
	 */
	public static final String column_folk = "folk";
	
	/**
	 * 字段描述：政治面貌 
	 * 字段类型 ：character varying 
	 */
	public static final String column_government = "government";
	
	/**
	 * 字段描述：主页 
	 * 字段类型 ：character varying 
	 */
	public static final String column_homepage = "homepage";
	
	/**
	 * 字段描述：户口所在地 
	 * 字段类型 ：character varying 
	 */
	public static final String column_householder = "householder";
	
	/**
	 * 字段描述：身份证号 
	 * 字段类型 ：character varying 
	 */
	public static final String column_idcard = "idcard";
	
	/**
	 * 字段描述：婚姻状况 
	 * 字段类型 ：character varying 
	 */
	public static final String column_marriage = "marriage";
	
	/**
	 * 字段描述：手机号 
	 * 字段类型 ：character varying 
	 */
	public static final String column_mobile = "mobile";
	
	/**
	 * 字段描述：msn账号 
	 * 字段类型 ：character varying 
	 */
	public static final String column_msn = "msn";
	
	/**
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_names = "names";
	
	/**
	 * 字段描述：出生地 
	 * 字段类型 ：character varying 
	 */
	public static final String column_nativityaddress = "nativityaddress";
	
	/**
	 * 字段描述：邮编 
	 * 字段类型 ：character varying 
	 */
	public static final String column_postboy = "postboy";
	
	/**
	 * 字段描述：qq账号 
	 * 字段类型 ：character varying 
	 */
	public static final String column_qq = "qq";
	
	/**
	 * 字段描述：学校名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_schoolname = "schoolname";
	
	/**
	 * 字段描述：性别 
	 * 字段类型 ：character varying 
	 */
	public static final String column_sex = "sex";
	
	/**
	 * 字段描述：专业 
	 * 字段类型 ：character varying 
	 */
	public static final String column_speciality = "speciality";
	
	/**
	 * 字段描述：身高 
	 * 字段类型 ：character varying 
	 */
	public static final String column_stature = "stature";
	
	/**
	 * 字段描述：电话 
	 * 字段类型 ：character varying 
	 */
	public static final String column_telephone = "telephone";

	/**
	 * sqlId : platform.user.paging
	 * 描述：查询所有用户
	 */
	public static final String sqlId_paging = "platform.userInfo.paging";

	private String ids;
	private Long version;
	private String address;
	private String addressinfo;
	private String avoirdupois;
	private java.sql.Date birthday;
	private String bloodgroup;
	private java.sql.Timestamp clientlevelend;
	private java.sql.Timestamp clientlevelstart;
	private String culture;
	private String description;
	private String email;
	private java.sql.Date finishschooldate;
	private String folk;
	private String government;
	private String homepage;
	private String householder;
	private String idcard;
	private String marriage;
	private String mobile;
	private String msn;
	private String names;
	private String nativityaddress;
	private String postboy;
	private String qq;
	private String schoolname;
	private String sex;
	private String speciality;
	private String stature;
	private String telephone;

	public void setIds(String ids){
		set(column_ids, ids);
	}
	public <T> T getIds() {
		return get(column_ids);
	}
	public void setVersion(Long version){
		set(column_version, version);
	}
	public <T> T getVersion() {
		return get(column_version);
	}
	public void setAddress(String address){
		set(column_address, address);
	}
	public <T> T getAddress() {
		return get(column_address);
	}
	public void setAddressinfo(String addressinfo){
		set(column_addressinfo, addressinfo);
	}
	public <T> T getAddressinfo() {
		return get(column_addressinfo);
	}
	public void setAvoirdupois(String avoirdupois){
		set(column_avoirdupois, avoirdupois);
	}
	public <T> T getAvoirdupois() {
		return get(column_avoirdupois);
	}
	public void setBirthday(java.sql.Date birthday){
		set(column_birthday, birthday);
	}
	public <T> T getBirthday() {
		return get(column_birthday);
	}
	public void setBloodgroup(String bloodgroup){
		set(column_bloodgroup, bloodgroup);
	}
	public <T> T getBloodgroup() {
		return get(column_bloodgroup);
	}
	public void setClientlevelend(java.sql.Timestamp clientlevelend){
		set(column_clientlevelend, clientlevelend);
	}
	public <T> T getClientlevelend() {
		return get(column_clientlevelend);
	}
	public void setClientlevelstart(java.sql.Timestamp clientlevelstart){
		set(column_clientlevelstart, clientlevelstart);
	}
	public <T> T getClientlevelstart() {
		return get(column_clientlevelstart);
	}
	public void setCulture(String culture){
		set(column_culture, culture);
	}
	public <T> T getCulture() {
		return get(column_culture);
	}
	public void setDescription(String description){
		set(column_description, description);
	}
	public <T> T getDescription() {
		return get(column_description);
	}
	public void setEmail(String email){
		set(column_email, email);
	}
	public <T> T getEmail() {
		return get(column_email);
	}
	public void setFinishschooldate(java.sql.Date finishschooldate){
		set(column_finishschooldate, finishschooldate);
	}
	public <T> T getFinishschooldate() {
		return get(column_finishschooldate);
	}
	public void setFolk(String folk){
		set(column_folk, folk);
	}
	public <T> T getFolk() {
		return get(column_folk);
	}
	public void setGovernment(String government){
		set(column_government, government);
	}
	public <T> T getGovernment() {
		return get(column_government);
	}
	public void setHomepage(String homepage){
		set(column_homepage, homepage);
	}
	public <T> T getHomepage() {
		return get(column_homepage);
	}
	public void setHouseholder(String householder){
		set(column_householder, householder);
	}
	public <T> T getHouseholder() {
		return get(column_householder);
	}
	public void setIdcard(String idcard){
		set(column_idcard, idcard);
	}
	public <T> T getIdcard() {
		return get(column_idcard);
	}
	public void setMarriage(String marriage){
		set(column_marriage, marriage);
	}
	public <T> T getMarriage() {
		return get(column_marriage);
	}
	public void setMobile(String mobile){
		set(column_mobile, mobile);
	}
	public <T> T getMobile() {
		return get(column_mobile);
	}
	public void setMsn(String msn){
		set(column_msn, msn);
	}
	public <T> T getMsn() {
		return get(column_msn);
	}
	public void setNames(String names){
		set(column_names, names);
	}
	public <T> T getNames() {
		return get(column_names);
	}
	public void setNativityaddress(String nativityaddress){
		set(column_nativityaddress, nativityaddress);
	}
	public <T> T getNativityaddress() {
		return get(column_nativityaddress);
	}
	public void setPostboy(String postboy){
		set(column_postboy, postboy);
	}
	public <T> T getPostboy() {
		return get(column_postboy);
	}
	public void setQq(String qq){
		set(column_qq, qq);
	}
	public <T> T getQq() {
		return get(column_qq);
	}
	public void setSchoolname(String schoolname){
		set(column_schoolname, schoolname);
	}
	public <T> T getSchoolname() {
		return get(column_schoolname);
	}
	public void setSex(String sex){
		set(column_sex, sex);
	}
	public <T> T getSex() {
		return get(column_sex);
	}
	public void setSpeciality(String speciality){
		set(column_speciality, speciality);
	}
	public <T> T getSpeciality() {
		return get(column_speciality);
	}
	public void setStature(String stature){
		set(column_stature, stature);
	}
	public <T> T getStature() {
		return get(column_stature);
	}
	public void setTelephone(String telephone){
		set(column_telephone, telephone);
	}
	public <T> T getTelephone() {
		return get(column_telephone);
	}

	/**
	 * 添加或者更新缓存
	 */
	public void cacheAdd(String ids){
		UserInfo userInfo = UserInfo.dao.findById(ids);
		ToolCache.set(ParamInitPlugin.cacheStart_userInfo + userInfo.getStr(UserInfo.column_email), userInfo);
		ToolCache.set(ParamInitPlugin.cacheStart_userInfo + userInfo.getStr(UserInfo.column_mobile), userInfo);
	}

	/**
	 * 删除缓存
	 */
	public void cacheRemove(String ids){
		UserInfo userInfo = UserInfo.dao.findById(ids);
		ToolCache.remove(ParamInitPlugin.cacheStart_userInfo + userInfo.getStr(UserInfo.column_email));
		ToolCache.remove(ParamInitPlugin.cacheStart_userInfo + userInfo.getStr(UserInfo.column_mobile));
	}

	/**
	 * 获取缓存
	 * @param ids
	 * @return
	 */
	public UserInfo cacheGet(String ids){
		UserInfo userInfo = ToolCache.get(ParamInitPlugin.cacheStart_userInfo + ids);
		return userInfo;
	}
	
}
