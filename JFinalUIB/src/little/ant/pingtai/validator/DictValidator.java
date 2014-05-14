package little.ant.pingtai.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class DictValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DictValidator.class);
	
	protected void validate(Controller controller) {
		
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(DictValidator.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/dict/save")){
			
		} else if (actionKey.equals("/dict/update")){
			
		}
			
	}
}
