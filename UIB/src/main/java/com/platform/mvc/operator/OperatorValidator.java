package com.platform.mvc.operator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.platform.mvc.base.BaseValidator;

public class OperatorValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(OperatorValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/operator/save")){
			
		} else if (actionKey.equals("/operator/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Operator.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/operator/save")){
			
		} else if (actionKey.equals("/operator/update")){
			
		}
	}
}
