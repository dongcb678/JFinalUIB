package little.ant.pingtai.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class RoleValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(RoleValidator.class);
	
	protected void validate(Controller controller) {
		
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(RoleValidator.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/role/save")){
			
		} else if (actionKey.equals("/role/update")){
			
		}
			
	}
}
