package little.ant.blog.member.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.blog.model.Move;

public class MoveValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MoveValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/blog/member/move/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/blog/member/move/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(Move.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/blog/member/move/save")){
			controller.render("/blog/member/xxx.html");
		
		} else if (actionKey.equals("/jf/blog/member/move/update")){
			controller.render("/blog/member/xxx.html");
		
		}
	}
	
}
