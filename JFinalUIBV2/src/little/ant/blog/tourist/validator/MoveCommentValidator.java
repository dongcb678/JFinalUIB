package little.ant.blog.tourist.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.blog.model.MoveComment;

public class MoveCommentValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MoveCommentValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/blog/tourist/moveComment/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/blog/tourist/moveComment/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(MoveComment.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/blog/tourist/moveComment/save")){
			controller.render("/blog/tourist/xxx.html");
		
		} else if (actionKey.equals("/jf/blog/tourist/moveComment/update")){
			controller.render("/blog/tourist/xxx.html");
		
		}
	}
	
}
