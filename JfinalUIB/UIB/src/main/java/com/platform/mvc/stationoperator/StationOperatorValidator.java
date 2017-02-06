package com.platform.mvc.stationoperator;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class StationOperatorValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(StationOperatorValidator.class);

	@SuppressWarnings("unused")
	private StationOperatorService stationOperatorService;
	
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
