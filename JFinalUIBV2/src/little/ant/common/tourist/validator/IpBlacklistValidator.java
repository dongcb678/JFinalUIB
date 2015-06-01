package little.ant.common.tourist.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.common.model.IpBlacklist;

public class IpBlacklistValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IpBlacklistValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/common/tourist/ipBlacklist/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/common/tourist/ipBlacklist/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(IpBlacklist.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/common/tourist/ipBlacklist/save")){
			controller.render("/common/tourist/xxx.html");
		
		} else if (actionKey.equals("/jf/common/tourist/ipBlacklist/update")){
			controller.render("/common/tourist/xxx.html");
		
		}
	}
	
}
