package little.ant.cms.admin.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.cms.model.Photogallery;

public class PhotogalleryValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/cms/photogallery/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/cms/photogallery/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Photogallery.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/cms/photogallery/save")){
			controller.render("/cms/xxx.html");
		
		} else if (actionKey.equals("/jf/cms/photogallery/update")){
			controller.render("/cms/xxx.html");
		
		}
	}
	
}
