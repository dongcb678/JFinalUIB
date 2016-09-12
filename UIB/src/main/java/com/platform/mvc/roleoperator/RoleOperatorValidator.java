package com.platform.mvc.roleoperator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class RoleOperatorValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(RoleOperatorValidator.class);
	
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
