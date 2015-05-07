package little.ant.blog.validator;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;
import little.ant.blog.model.ArticleComment;

public class ArticleCommentValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleCommentValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/blog/articleComment/save")){
			// validateString("username", 6, 30, "usernameMsg", "请输入登录账号!");
			
		} else if (actionKey.equals("/jf/blog/articleComment/update")){
			
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(ArticleComment.class);
		
		String actionKey = getActionKey();
		if (actionKey.equals("/jf/blog/articleComment/save")){
			controller.render("/blog/xxx.html");
		
		} else if (actionKey.equals("/jf/blog/articleComment/update")){
			controller.render("/blog/xxx.html");
		
		}
	}
	
}
