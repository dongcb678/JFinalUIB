package com.platform.mvc.stationoperator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class StationOperatorValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(StationOperatorValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/stationOperator/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/platform/stationOperator/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(StationOperator.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/stationOperator/save")){
			controller.render("/platform/xxx.html");
		
		} else if (actionKey.equals("/platform/stationOperator/update")){
			controller.render("/platform/xxx.html");
		
		}
	}
	
}
