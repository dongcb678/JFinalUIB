package com.platform.mvc.dict;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class DictValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(DictValidator.class);

	@SuppressWarnings("unused")
	private DictService dictService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/dict/save")){
			
		} else if (actionKey.equals("/dict/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Dict.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/dict/save")){
			
		} else if (actionKey.equals("/dict/update")){
			
		}
	}
}
