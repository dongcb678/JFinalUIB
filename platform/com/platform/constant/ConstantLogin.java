package com.platform.constant;

/**
 * 登陆判断相关的
 */
public interface ConstantLogin {

	/**
	 * 用户登录状态码：用户不存在
	 */
	public static final int login_info_0 = 0;
	
	/**
	 * 用户登录状态码：停用账户
	 */
	public static final int login_info_1 = 1;
	
	/**
	 * 用户登录状态码：密码错误次数超限
	 */
	public static final int login_info_2 = 2;
	
	/**
	 * 用户登录状态码：密码验证成功
	 */
	public static final int login_info_3 = 3;
	
	/**
	 * 用户登录状态码：密码验证失败
	 */
	public static final int login_info_4 = 4;
	
}
