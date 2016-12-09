package com.platform.mvc.roleoperator;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class RoleOperatorValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(RoleOperatorValidator.class);

	@SuppressWarnings("unused")
	private RoleOperatorService roleOperatorService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/roleOperator/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/platform/roleOperator/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(RoleOperator.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/roleOperator/save")){
			controller.render("/platform/xxx.html");
		
		} else if (actionKey.equals("/platform/roleOperator/update")){
			controller.render("/platform/xxx.html");
		
		}
	}
	
}
