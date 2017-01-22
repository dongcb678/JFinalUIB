package com.platform.constant;

/**
 * 权限验证
 */
public interface ConstantAuth {

	/**
	 * 权限验证：URL不存在
	 */
	public static final String auth_no_url = "no_url";

	/**
	 * 权限验证：未登录
	 */
	public static final String auth_no_login = "no_login";

	/**
	 * 权限验证：没权限
	 */
	public static final String auth_no_permissions = "no_permissions";

	/**
	 * 权限验证：重复提交表单
	 */
	public static final String auth_form = "form";

	/**
	 * 权限验证：请求方法验证
	 */
	public static final String auth_method = "method";

	/**
	 * 权限验证：请求编码验证
	 */
	public static final String auth_enctype = "enctype";

	/**
	 * 权限验证：csrf值为空
	 */
	public static final String auth_csrf_empty = "csrf_empty";

	/**
	 * 权限验证：csrf校验失败
	 */
	public static final String auth_csrf = "csrf";

	/**
	 * 权限验证：referer校验失败
	 */
	public static final String auth_referer = "referer";
	
	/**
	 * 权限验证：IP黑名单
	 */
	public static final String auth_ip = "ip";

	/**
	 * 权限验证：业务代码异常
	 */
	public static final String auth_exception = "exception";

	/**
	 * 权限验证：加密验证标示存储位置cookie
	 */
	public static final String auth_store_cookie = "cookie";

	/**
	 * 权限验证：加密验证标示存储位置header
	 */
	public static final String auth_store_header = "header";
	
	
	
}
