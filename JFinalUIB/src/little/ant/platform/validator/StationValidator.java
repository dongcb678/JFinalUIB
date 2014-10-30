package little.ant.platform.validator;

import little.ant.platform.model.Station;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class StationValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(StationValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/station/save")){
			
		} else if (actionKey.equals("/station/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Station.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/station/save")){
			
		} else if (actionKey.equals("/station/update")){
			
		}
	}
}
