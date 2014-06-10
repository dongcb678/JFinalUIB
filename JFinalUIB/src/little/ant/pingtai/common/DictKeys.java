package little.ant.pingtai.common;

import org.apache.log4j.Logger;

/**
 * 常量数据字典
 * @author 董华健
 */
public abstract class DictKeys {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DictKeys.class);
		
	// 1.用户登录状态码
	public static final int login_info_0 = 0;// 用户不存在
	public static final int login_info_1 = 1;// 停用账户
	public static final int login_info_2 = 2;// 密码错误次数超限
	public static final int login_info_3 = 3;// 密码验证成功
	public static final int login_info_4 = 4;// 密码验证失败

}
