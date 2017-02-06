package com.platform.mvc.user;

import java.sql.Date;
import java.sql.Timestamp;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 用户详情model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = UserInfo.table_name)
public class UserInfo extends BaseModel<UserInfo> {

	private static final long serialVersionUID = 2592706064072264621L;

	private static final Log log = Log.getLog(UserInfo.class);
	
	public static final UserInfo dao = new UserInfo().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_userinfo";
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：地址 
	 * 字段类型：character varying  长度：300
	 */
	public static final String column_address = "address";
	
	/**
	 * 字段描述：地址扩展 
	 * 字段类型：character varying  长度：300
	 */
	public static final String column_addressinfo = "addressinfo";
	
	/**
	 * 字段描述：体重 
	 * 字段类型：character varying  长度：5
	 */
	public static final String column_avoirdupois = "avoirdupois";
	
	/**
	 * 字段描述：生日 
	 * 字段类型：date  长度：null
	 */
	public static final String column_birthday = "birthday";
	
	/**
	 * 字段描述：血型 
	 * 字段类型：character varying  长度：15
	 */
	public static final String column_bloodgroup = "bloodgroup";
	
	/**
	 * 字段描述：clientlevelend 
	 * 字段类型：timestamp without time zone  长度：null
	 */
	public static final String column_clientlevelend = "clientlevelend";
	
	/**
	 * 字段描述：clientlevelstart 
	 * 字段类型：timestamp without time zone  长度：null
	 */
	public static final String column_clientlevelstart = "clientlevelstart";
	
	/**
	 * 字段描述：文化程度 
	 * 字段类型：character varying  长度：30
	 */
	public static final String column_culture = "culture";
	
	/**
	 * 字段描述：描述 
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：毕业时间 
	 * 字段类型：date  长度：null
	 */
	public static final String column_finishschooldate = "finishschooldate";
	
	/**
	 * 字段描述：民族 
	 * 字段类型：character varying  长度：20
	 */
	public static final String column_folk = "folk";
	
	/**
	 * 字段描述：政治面貌 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_government = "government";
	
	/**
	 * 字段描述：主页 
	 * 字段类型：character varying  长度：100
	 */
	public static final String column_homepage = "homepage";
	
	/**
	 * 字段描述：户口所在地 
	 * 字段类型：character varying  长度：20
	 */
	public static final String column_householder = "householder";
	
	/**
	 * 字段描述：婚姻状况 
	 * 字段类型：character varying  长度：20
	 */
	public static final String column_marriage = "marriage";
	
	/**
	 * 字段描述：msn账号 
	 * 字段类型：character varying  长度：20
	 */
	public static final String column_msn = "msn";
	
	/**
	 * 字段描述：出生地 
	 * 字段类型：character varying  长度：20
	 */
	public static final String column_nativityaddress = "nativityaddress";
	
	/**
	 * 字段描述：邮编 
	 * 字段类型：character varying  长度：6
	 */
	public static final String column_postboy = "postboy";
	
	/**
	 * 字段描述：qq账号 
	 * 字段类型：character varying  长度：20
	 */
	public static final String column_qq = "qq";
	
	/**
	 * 字段描述：学校名称 
	 * 字段类型：character varying  长度：20
	 */
	public static final String column_schoolname = "schoolname";
	
	/**
	 * 字段描述：性别 
	 * 字段类型：character varying  长度：5
	 */
	public static final String column_sex = "sex";
	
	/**
	 * 字段描述：专业 
	 * 字段类型：character varying  长度：20
	 */
	public static final String column_speciality = "speciality";
	
	/**
	 * 字段描述：身高 
	 * 字段类型：character varying  长度：5
	 */
	public static final String column_stature = "stature";
	
	/**
	 * 字段描述：电话 
	 * 字段类型：character varying  长度：20
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
	private Date birthday;
	private String bloodgroup;
	private Timestamp clientlevelend;
	private Timestamp clientlevelstart;
	private String culture;
	private String description;
	private Date finishschooldate;
	private String folk;
	private String government;
	private String homepage;
	private String householder;
	private String marriage;
	private String msn;
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
	public String getIds() {
		return get(column_ids);
	}
	public void setVersion(Long version){
		set(column_version, version);
	}
	public Long getVersion() {
		return get(column_version);
	}
	public void setAddress(String address){
		set(column_address, address);
	}
	public String getAddress() {
		return get(column_address);
	}
	public void setAddressinfo(String addressinfo){
		set(column_addressinfo, addressinfo);
	}
	public String getAddressinfo() {
		return get(column_addressinfo);
	}
	public void setAvoirdupois(String avoirdupois){
		set(column_avoirdupois, avoirdupois);
	}
	public String getAvoirdupois() {
		return get(column_avoirdupois);
	}
	public void setBirthday(Date birthday){
		set(column_birthday, birthday);
	}
	public Date getBirthday() {
		return get(column_birthday);
	}
	public void setBloodgroup(String bloodgroup){
		set(column_bloodgroup, bloodgroup);
	}
	public String getBloodgroup() {
		return get(column_bloodgroup);
	}
	public void setClientlevelend(Timestamp clientlevelend){
		set(column_clientlevelend, clientlevelend);
	}
	public Timestamp getClientlevelend() {
		return get(column_clientlevelend);
	}
	public void setClientlevelstart(Timestamp clientlevelstart){
		set(column_clientlevelstart, clientlevelstart);
	}
	public Timestamp getClientlevelstart() {
		return get(column_clientlevelstart);
	}
	public void setCulture(String culture){
		set(column_culture, culture);
	}
	public String getCulture() {
		return get(column_culture);
	}
	public void setDescription(String description){
		set(column_description, description);
	}
	public String getDescription() {
		return get(column_description);
	}
	public void setFinishschooldate(Date finishschooldate){
		set(column_finishschooldate, finishschooldate);
	}
	public Date getFinishschooldate() {
		return get(column_finishschooldate);
	}
	public void setFolk(String folk){
		set(column_folk, folk);
	}
	public String getFolk() {
		return get(column_folk);
	}
	public void setGovernment(String government){
		set(column_government, government);
	}
	public String getGovernment() {
		return get(column_government);
	}
	public void setHomepage(String homepage){
		set(column_homepage, homepage);
	}
	public String getHomepage() {
		return get(column_homepage);
	}
	public void setHouseholder(String householder){
		set(column_householder, householder);
	}
	public String getHouseholder() {
		return get(column_householder);
	}
	public void setMarriage(String marriage){
		set(column_marriage, marriage);
	}
	public String getMarriage() {
		return get(column_marriage);
	}
	public void setMsn(String msn){
		set(column_msn, msn);
	}
	public String getMsn() {
		return get(column_msn);
	}
	public void setNativityaddress(String nativityaddress){
		set(column_nativityaddress, nativityaddress);
	}
	public String getNativityaddress() {
		return get(column_nativityaddress);
	}
	public void setPostboy(String postboy){
		set(column_postboy, postboy);
	}
	public String getPostboy() {
		return get(column_postboy);
	}
	public void setQq(String qq){
		set(column_qq, qq);
	}
	public String getQq() {
		return get(column_qq);
	}
	public void setSchoolname(String schoolname){
		set(column_schoolname, schoolname);
	}
	public String getSchoolname() {
		return get(column_schoolname);
	}
	public void setSex(String sex){
		set(column_sex, sex);
	}
	public String getSex() {
		return get(column_sex);
	}
	public void setSpeciality(String speciality){
		set(column_speciality, speciality);
	}
	public String getSpeciality() {
		return get(column_speciality);
	}
	public void setStature(String stature){
		set(column_stature, stature);
	}
	public String getStature() {
		return get(column_stature);
	}
	public void setTelephone(String telephone){
		set(column_telephone, telephone);
	}
	public String getTelephone() {
		return get(column_telephone);
	}
	
}
