package com.platform.mvc.operator;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class OperatorValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(OperatorValidator.class);

	@SuppressWarnings("unused")
	private OperatorService operatorService;

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
