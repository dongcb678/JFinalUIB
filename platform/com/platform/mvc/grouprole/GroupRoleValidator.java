package com.platform.mvc.grouprole;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.platform.mvc.base.BaseValidator;

public class GroupRoleValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(GroupRoleValidator.class);

	@SuppressWarnings("unused")
	private GroupRoleService groupRoleService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/groupRole/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/platform/groupRole/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(GroupRole.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/groupRole/save")){
			controller.render("/platform/xxx.html");
		
		} else if (actionKey.equals("/platform/groupRole/update")){
			controller.render("/platform/xxx.html");
		
		}
	}
	
}
