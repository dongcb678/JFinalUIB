package little.ant.cms.tourist.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.cms.model.VoteItem;

public class VoteItemValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteItemValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/cms/tourist/voteItem/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/cms/tourist/voteItem/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(VoteItem.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/cms/tourist/voteItem/save")){
			controller.render("/cms/tourist/xxx.html");
		
		} else if (actionKey.equals("/jf/cms/tourist/voteItem/update")){
			controller.render("/cms/tourist/xxx.html");
		
		}
	}
	
}
