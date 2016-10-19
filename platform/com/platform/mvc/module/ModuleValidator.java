package com.platform.mvc.module;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class ModuleValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ModuleValidator.class);

	@SuppressWarnings("unused")
	private ModuleService moduleService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/module/save")){
			
		} else if (actionKey.equals("/module/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Module.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/module/save")){
			
		} else if (actionKey.equals("/module/update")){
			
		}
	}
}
