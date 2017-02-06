package com.platform.mvc.dept;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class DepartmentValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(DepartmentValidator.class);

	@SuppressWarnings("unused")
	private DepartmentService departmentService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/dept/save")){
			
		} else if (actionKey.equals("/dept/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Department.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/dept/save")){
			
		} else if (actionKey.equals("/dept/update")){
			
		}
	}
}
