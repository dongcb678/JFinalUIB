package com.weixin.mvc.index;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class IndexValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IndexValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/wx/index")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(IndexValidator.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/wx/index")){
			
		}
	}
}
