package little.ant.pingtai.validator;

import little.ant.pingtai.model.Operator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class OperatorValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(OperatorValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/operator/save")){
			
		} else if (actionKey.equals("/operator/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Operator.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/operator/save")){
			
		} else if (actionKey.equals("/operator/update")){
			
		}
	}
}
