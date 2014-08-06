package little.ant.pingtai.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class ParamValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ParamValidator.class);
	
	protected void validate(Controller controller) {
		
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(ParamValidator.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/param/save")){
			
		} else if (actionKey.equals("/param/update")){
			
		}
			
	}
}
