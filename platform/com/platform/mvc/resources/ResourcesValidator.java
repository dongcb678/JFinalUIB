package com.platform.mvc.resources;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class ResourcesValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ResourcesValidator.class);

	@SuppressWarnings("unused")
	private ResourcesService resourcesService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/resources/save")){
			
		} else if (actionKey.equals("/resources/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/resources/save")){
			
		} else if (actionKey.equals("/resources/update")){
			
		}
	}
}
