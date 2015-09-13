package com.weixin.mvc.user;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class UserValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UserValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/wx/user")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(User.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/wx/user")){
			
		}
	}
}
