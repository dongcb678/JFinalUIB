package com.platform.mvc.syslog;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class SyslogValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(SyslogValidator.class);

	@SuppressWarnings("unused")
	private SysLogService sysLogService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/sysLog/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/platform/sysLog/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/sysLog/save")){
			controller.render("/platform/xxx.html");
		
		} else if (actionKey.equals("/platform/sysLog/update")){
			controller.render("/platform/xxx.html");
		
		}
	}
	
}
