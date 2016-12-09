package com.platform.mvc.login;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class LoginValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(LoginValidator.class);

	@SuppressWarnings("unused")
	private LoginService loginService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/login/vali")){
			validateString("username", 5, 16, "usernameMsg", "请输入用户名!");
			validateString("password", 6, 18, "passwordMsg", "请输入密码!");
		}
	}
	
	protected void handleError(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/login/vali")){
			controller.keepPara("username", "password");
			controller.render("/platform/login/login.html");
		}
	}
	
}
