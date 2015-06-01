package little.ant.cms.tourist.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.cms.model.Job;

public class JobValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(JobValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/cms/tourist/job/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/cms/tourist/job/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Job.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/cms/tourist/job/save")){
			controller.render("/cms/tourist/xxx.html");
		
		} else if (actionKey.equals("/jf/cms/tourist/job/update")){
			controller.render("/cms/tourist/xxx.html");
		
		}
	}
	
}
