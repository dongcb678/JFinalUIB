package little.ant.cms.tourist.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.cms.model.Questions;

public class QuestionsValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(QuestionsValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/cms/tourist/questions/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/cms/tourist/questions/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Questions.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/cms/tourist/questions/save")){
			controller.render("/cms/tourist/xxx.html");
		
		} else if (actionKey.equals("/jf/cms/tourist/questions/update")){
			controller.render("/cms/tourist/xxx.html");
		
		}
	}
	
}
