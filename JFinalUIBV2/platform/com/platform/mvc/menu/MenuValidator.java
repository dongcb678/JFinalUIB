package com.platform.mvc.menu;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class MenuValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MenuValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/menu/save")){
			
		} else if (actionKey.equals("/menu/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Menu.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/menu/save")){
			
		} else if (actionKey.equals("/menu/update")){
			
		}
	}
}
