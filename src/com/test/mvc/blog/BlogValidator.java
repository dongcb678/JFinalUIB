package com.test.mvc.blog;

import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.platform.mvc.base.BaseValidator;

public class BlogValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(BlogValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/test/blog/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/test/blog/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Blog.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/test/blog/save")){
			controller.render("/test/xxx.html");
		
		} else if (actionKey.equals("/test/blog/update")){
			controller.render("/test/xxx.html");
		
		}
	}
	
}
