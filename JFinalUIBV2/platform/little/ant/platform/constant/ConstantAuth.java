package little.ant.platform.constant;

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
	 * 权限验证：IP黑名单
	 */
	public static final String auth_ip = "ip";

	/**
	 * 权限验证：业务代码异常
	 */
	public static final String auth_exception = "exception";
	
	
}
