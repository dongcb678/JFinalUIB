package com.platform.mvc.systems;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.platform.mvc.base.BaseValidator;

public class SystemsValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SystemsValidator.class);
	
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
