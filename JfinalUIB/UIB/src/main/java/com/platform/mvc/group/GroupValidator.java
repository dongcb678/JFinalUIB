package com.platform.mvc.group;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class GroupValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(GroupValidator.class);

	@SuppressWarnings("unused")
	private GroupService groupService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/group/save")){
			
		} else if (actionKey.equals("/group/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Group.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/group/save")){
			
		} else if (actionKey.equals("/group/update")){
			
		}
	}
}
