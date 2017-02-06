package com.platform.mvc.menu;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class MenuValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(MenuValidator.class);

	@SuppressWarnings("unused")
	private MenuService menuService;
	
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
