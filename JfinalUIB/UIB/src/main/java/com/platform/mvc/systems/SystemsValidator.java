package com.platform.mvc.systems;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class SystemsValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(SystemsValidator.class);

	@SuppressWarnings("unused")
	private SystemsService systemsService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/systems/save")){
			
		} else if (actionKey.equals("/systems/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Systems.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/systems/save")){
			
		} else if (actionKey.equals("/systems/update")){
			
		}
	}
	
}
