package com.platform.mvc.param;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class ParamValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ParamValidator.class);

	@SuppressWarnings("unused")
	private ParamService paramService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/param/save")){
			
		} else if (actionKey.equals("/param/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Param.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/param/save")){
			
		} else if (actionKey.equals("/param/update")){
			
		}
	}
}
