package little.ant.common.member.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.common.model.Link;

public class LinkValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LinkValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/common/member/link/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/common/member/link/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Link.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/common/member/link/save")){
			controller.render("/common/member/xxx.html");
		
		} else if (actionKey.equals("/jf/common/member/link/update")){
			controller.render("/common/member/xxx.html");
		
		}
	}
	
}
