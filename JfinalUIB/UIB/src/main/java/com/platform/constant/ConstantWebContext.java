package com.platform.constant;

/**
 * web全局常用key
 */
public interface ConstantWebContext {

	/**
	 * web 路径
	 */
	public static final String request_cxt = "cxt";

	/**
	 * request 请求id
	 */
	public static final String request_id = "request_id";

	/**
	 * request csrf token
	 */
	public static final String request_csrfToken = "csrfToken";

	/**
	 * request cookie
	 */
	public static final String request_cookieMap = "cookieMap";

	/**
	 * request param
	 */
	public static final String request_paramMap = "paramMap";

	/**
	 * 国际化，设置request中的当前语言
	 */
	public static final String request_localePram = "localePram";

	/**
	 * 国际化，设置cookie中当前语言的key
	 */
	public static final String cookie_language = "language";

	/**
	 * 国际化，设置request中的当前语言map
	 */
	public static final String request_i18nMap = "i18nMap";

	/**
	 * 国际化，设置request中的当前语言对应列后缀
	 */
	public static final String request_i18nColumnSuffix = "i18nColumnSuffix";

	/**
	 * 直接渲染模板的路径
	 */
	public static final String request_toUrl = "toUrl";

	/**
	 * 当前登录用户的id
	 */
	public static final String request_cUserIds = "cUserIds";

	/**
	 * 当前登录用户
	 */
	public static final String request_cUser = "cUser";

	/**
	 * 验证码key
	 */
	public static final String request_authCode = "authCode";

	/**
	 * 权限标示验证码
	 */
	public static final String cookie_authmark = "authmark";

	/**
	 * 排序方式
	 */
	public static final String request_orderMode = "orderMode";

	/**
	 * 第几页
	 */
	public static final String request_pageNumber = "pageNumber";
	
	/**
	 * 每页显示几多
	 */
	public static final String request_pageSize = "pageSize";
	
	/**
	 * 排序条件
	 */
	public static final String request_orderColunm = "orderColunm";

	/**
	 * 分页查询条件key前缀
	 */
	public static final String request_query = "_query";

	/**
	 * 表单重复提交验证key
	 */
	public static final String request_formToken = "formToken";

	/**
	 * 表单重复提交验证token
	 */
	public static final String cookie_token = "token";

	/**
	 * 当前范文日志request key
	 */
	public static final String reqSysLogKey = "reqSysLog";

	/**
	 * render耗时计算key
	 */
	public static final String renderTimeKey = "renderTime";
	
	
}
