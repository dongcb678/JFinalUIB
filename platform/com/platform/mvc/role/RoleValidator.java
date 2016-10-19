package com.platform.mvc.role;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class RoleValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(RoleValidator.class);

	@SuppressWarnings("unused")
	private RoleService roleService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/role/save")){
			
		} else if (actionKey.equals("/role/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Role.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/role/save")){
			
		} else if (actionKey.equals("/role/update")){
			
		}
	}
}
