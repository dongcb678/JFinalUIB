package com.platform.mvc.usergroup;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.platform.mvc.base.BaseValidator;

public class UserGroupValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UserGroupValidator.class);

	@SuppressWarnings("unused")
	private UserGroupService userGroupService;

	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/userGroup/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/platform/userGroup/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(UserGroup.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/userGroup/save")){
			controller.render("/platform/xxx.html");
		
		} else if (actionKey.equals("/platform/userGroup/update")){
			controller.render("/platform/xxx.html");
		
		}
	}
	
}
