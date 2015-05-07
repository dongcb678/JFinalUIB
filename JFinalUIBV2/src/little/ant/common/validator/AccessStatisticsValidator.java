package little.ant.common.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.common.model.AccessStatistics;

public class AccessStatisticsValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AccessStatisticsValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/common/accessStatistics/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/common/accessStatistics/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(AccessStatistics.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/common/accessStatistics/save")){
			controller.render("/common/xxx.html");
		
		} else if (actionKey.equals("/jf/common/accessStatistics/update")){
			controller.render("/common/xxx.html");
		
		}
	}
	
}
