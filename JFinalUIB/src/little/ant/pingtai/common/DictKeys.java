package little.ant.pingtai.common;

import org.apache.log4j.Logger;

/**
 * 常量数据字典
 * @author 董华健
 */
public abstract class DictKeys {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DictKeys.class);
		
	/**
	 * 加密
	 */
	public static final String config_securityKey_key = "config.securityKey";
	
	/**
	 * 密码最大错误次数
	 */
	public static final String config_passErrorCount_key = "config.passErrorCount";
	
	/**
	 * 密码错误最大次数后间隔登陆时间（小时）
	 */
	public static final String config_passErrorHour_key = "config.passErrorHour";
	
	/**
	 * 当前数据库类型
	 */
	public static final String db_type_key = "db.type";
	public static final String db_type_postgresql = "postgresql";
	public static final String db_type_mysql = "mysql";

	/**
	 * 用户登录状态码
	 */
	public static final int login_info_0 = 0;// 用户不存在
	public static final int login_info_1 = 1;// 停用账户
	public static final int login_info_2 = 2;// 密码错误次数超限
	public static final int login_info_3 = 3;// 密码验证成功
	public static final int login_info_4 = 4;// 密码验证失败

}
