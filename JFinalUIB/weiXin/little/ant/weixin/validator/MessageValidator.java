package little.ant.weixin.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class MessageValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MessageValidator.class);
	
	protected void validate(Controller controller) {
		
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(MessageValidator.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/receive/save")){
			
		} else if (actionKey.equals("/receive/update")){
			
		}
			
	}
}
