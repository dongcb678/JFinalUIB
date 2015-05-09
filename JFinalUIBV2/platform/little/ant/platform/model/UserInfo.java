package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;

import org.apache.log4j.Logger;

/**
 * 用户详情model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_userinfo")
public class UserInfo extends BaseModel<UserInfo> {

	private static final long serialVersionUID = 2592706064072264621L;

	private static Logger log = Logger.getLogger(UserInfo.class);
	
	public static final UserInfo dao = new UserInfo();

	/**
	 * 主键
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 版本号
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 地址
	 */
	public static final String colunm_address = "address";
	
	/**
	 * 地址扩展
	 */
	public static final String colunm_addressinfo = "addressinfo";
	
	/**
	 * 体重
	 */
	public static final String colunm_avoirdupois = "avoirdupois";
	
	/**
	 * 生日
	 */
	public static final String colunm_birthday = "birthday";
	
	/**
	 * 血型
	 */
	public static final String colunm_bloodgroup = "bloodgroup";
	
	/**
	 * clientlevelend
	 */
	public static final String colunm_clientlevelend = "clientlevelend";
	
	/**
	 * clientlevelstart
	 */
	public static final String colunm_clientlevelstart = "clientlevelstart";
	
	/**
	 * 文化程度
	 */
	public static final String colunm_culture = "culture";
	
	/**
	 * 描述
	 */
	public static final String colunm_description = "description";
	
	/**
	 * 邮箱
	 */
	public static final String colunm_email = "email";
	
	/**
	 * 毕业时间
	 */
	public static final String colunm_finishschooldate = "finishschooldate";
	
	/**
	 * 民族
	 */
	public static final String colunm_folk = "folk";
	
	/**
	 * 政治面貌
	 */
	public static final String colunm_government = "government";
	
	/**
	 * 主页
	 */
	public static final String colunm_homepage = "homepage";
	
	/**
	 * 户口所在地
	 */
	public static final String colunm_householder = "householder";
	
	/**
	 * 身份证号
	 */
	public static final String colunm_idcard = "idcard";
	
	/**
	 * 婚姻状况
	 */
	public static final String colunm_marriage = "marriage";
	
	/**
	 * 手机号
	 */
	public static final String colunm_mobile = "mobile";
	
	/**
	 * msn账号
	 */
	public static final String colunm_msn = "msn";
	
	/**
	 * 名称
	 */
	public static final String colunm_names = "names";
	
	/**
	 * 出生地
	 */
	public static final String colunm_nativityaddress = "nativityaddress";
	
	/**
	 * 邮编
	 */
	public static final String colunm_postboy = "postboy";
	
	/**
	 * qq账号
	 */
	public static final String colunm_qq = "qq";
	
	/**
	 * 学校名称
	 */
	public static final String colunm_schoolname = "schoolname";
	
	/**
	 * 性别
	 */
	public static final String colunm_sex = "sex";
	
	/**
	 * 专业
	 */
	public static final String colunm_speciality = "speciality";
	
	/**
	 * 身高
	 */
	public static final String colunm_stature = "stature";
	
	/**
	 * 电话
	 */
	public static final String colunm_telephone = "telephone";
	
}
