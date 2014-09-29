package little.ant.pingtai.validator;

import little.ant.pingtai.model.Module;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class ModuleValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ModuleValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/module/save")){
			
		} else if (actionKey.equals("/module/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Module.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/module/save")){
			
		} else if (actionKey.equals("/module/update")){
			
		}
	}
}
