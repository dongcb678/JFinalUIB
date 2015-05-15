package little.ant.blog.admin.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.blog.model.Type;

public class TypeValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TypeValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/blog/admin/type/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/blog/admin/type/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Type.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/blog/admin/type/save")){
			controller.render("/blog/admin/xxx.html");
		
		} else if (actionKey.equals("/jf/blog/admin/type/update")){
			controller.render("/blog/admin/xxx.html");
		
		}
	}
	
}
