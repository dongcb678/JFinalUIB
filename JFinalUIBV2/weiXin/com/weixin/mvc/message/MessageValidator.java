package com.weixin.mvc.message;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class MessageValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MessageValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/wx/message")){
			
		} else if (actionKey.equals("/jf/wx/message/oauth2")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Message.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/wx/message")){
			
		} else if (actionKey.equals("/jf/wx/message/oauth2")){
			
		}
	}
}
