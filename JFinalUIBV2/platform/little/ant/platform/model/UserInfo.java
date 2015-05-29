package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;

import org.apache.log4j.Logger;

/**
 * 用户详情model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "pt_userinfo")
public class UserInfo extends BaseModel<UserInfo> {

	private static final long serialVersionUID = 2592706064072264621L;

	private static Logger log = Logger.getLogger(UserInfo.class);
	
	public static final UserInfo dao = new UserInfo();

	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 字段描述：地址 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_address = "address";
	
	/**
	 * 字段描述：地址扩展 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_addressinfo = "addressinfo";
	
	/**
	 * 字段描述：体重 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_avoirdupois = "avoirdupois";
	
	/**
	 * 字段描述：生日 
	 * 字段类型 ：date 
	 */
	public static final String colunm_birthday = "birthday";
	
	/**
	 * 字段描述：血型 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_bloodgroup = "bloodgroup";
	
	/**
	 * 字段描述：clientlevelend 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String colunm_clientlevelend = "clientlevelend";
	
	/**
	 * 字段描述：clientlevelstart 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String colunm_clientlevelstart = "clientlevelstart";
	
	/**
	 * 字段描述：文化程度 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_culture = "culture";
	
	/**
	 * 字段描述：描述 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_description = "description";
	
	/**
	 * 字段描述：邮箱 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_email = "email";
	
	/**
	 * 字段描述：毕业时间 
	 * 字段类型 ：date 
	 */
	public static final String colunm_finishschooldate = "finishschooldate";
	
	/**
	 * 字段描述：民族 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_folk = "folk";
	
	/**
	 * 字段描述：政治面貌 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_government = "government";
	
	/**
	 * 字段描述：主页 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_homepage = "homepage";
	
	/**
	 * 字段描述：户口所在地 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_householder = "householder";
	
	/**
	 * 字段描述：身份证号 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_idcard = "idcard";
	
	/**
	 * 字段描述：婚姻状况 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_marriage = "marriage";
	
	/**
	 * 字段描述：手机号 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_mobile = "mobile";
	
	/**
	 * 字段描述：msn账号 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_msn = "msn";
	
	/**
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_names = "names";
	
	/**
	 * 字段描述：出生地 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_nativityaddress = "nativityaddress";
	
	/**
	 * 字段描述：邮编 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_postboy = "postboy";
	
	/**
	 * 字段描述：qq账号 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_qq = "qq";
	
	/**
	 * 字段描述：学校名称 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_schoolname = "schoolname";
	
	/**
	 * 字段描述：性别 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_sex = "sex";
	
	/**
	 * 字段描述：专业 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_speciality = "speciality";
	
	/**
	 * 字段描述：身高 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_stature = "stature";
	
	/**
	 * 字段描述：电话 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_telephone = "telephone";
	
}
