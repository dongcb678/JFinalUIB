package little.ant.blog.admin.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.blog.model.Inform;

public class InformValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(InformValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/blog/inform/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/blog/inform/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Inform.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/blog/inform/save")){
			controller.render("/blog/xxx.html");
		
		} else if (actionKey.equals("/jf/blog/inform/update")){
			controller.render("/blog/xxx.html");
		
		}
	}
	
}
