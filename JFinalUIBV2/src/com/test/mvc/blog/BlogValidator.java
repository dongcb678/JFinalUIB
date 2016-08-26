package com.test.mvc.blog;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.platform.mvc.base.BaseValidator;

public class BlogValidator extends BaseValidator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(BlogValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/test/blog/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/test/blog/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Blog.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/test/blog/save")){
			controller.render("/test/xxx.html");
		
		} else if (actionKey.equals("/jf/test/blog/update")){
			controller.render("/test/xxx.html");
		
		}
	}
	
}
