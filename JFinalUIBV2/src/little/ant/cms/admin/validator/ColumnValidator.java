package little.ant.cms.admin.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.cms.model.Column;

public class ColumnValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ColumnValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/cms/column/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/cms/column/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Column.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/cms/column/save")){
			controller.render("/cms/xxx.html");
		
		} else if (actionKey.equals("/jf/cms/column/update")){
			controller.render("/cms/xxx.html");
		
		}
	}
	
}
