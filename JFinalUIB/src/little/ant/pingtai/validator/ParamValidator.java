package little.ant.pingtai.validator;

import little.ant.pingtai.model.Param;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class ParamValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ParamValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/param/save")){
			
		} else if (actionKey.equals("/param/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Param.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/param/save")){
			
		} else if (actionKey.equals("/param/update")){
			
		}
	}
}
