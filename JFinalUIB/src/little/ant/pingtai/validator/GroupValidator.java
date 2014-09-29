package little.ant.pingtai.validator;

import little.ant.pingtai.model.Group;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class GroupValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(GroupValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/group/save")){
			
		} else if (actionKey.equals("/group/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Group.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/group/save")){
			
		} else if (actionKey.equals("/group/update")){
			
		}
	}
}
