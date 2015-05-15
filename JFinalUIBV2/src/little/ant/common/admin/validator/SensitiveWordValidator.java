package little.ant.common.admin.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.common.model.SensitiveWord;

public class SensitiveWordValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SensitiveWordValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/common/sensitiveWord/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/common/sensitiveWord/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(SensitiveWord.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/common/sensitiveWord/save")){
			controller.render("/common/xxx.html");
		
		} else if (actionKey.equals("/jf/common/sensitiveWord/update")){
			controller.render("/common/xxx.html");
		
		}
	}
	
}
