package little.ant.pingtai.validator;

import java.util.Date;

import org.apache.log4j.Logger;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

public class UserValidator extends Validator {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UserValidator.class);
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/user/save")){
			validateString("user.username", 5, 16, "usernameMsg", "登陆名不正确!");
			validateString("password", 6, 18, "passwordMsg", "密码不正确!");
			validateString("userInfo.idcard", 15, 18, "idcardMsg", "身份证号码不正确!");
			validateString("userInfo.names", 2, 10, "namesMsg", "姓名不正确!");
			validateEmail("userInfo.email", "emailMsg", "邮箱不正确!");
			validateLong("userInfo.mobile", 10000000000l, 99999999999l, "mobileMsg", "手机号码不正确!");
			validateLong("userInfo.telephone", 1, 99999999999l, "telephoneMsg", "电话号码不正确!");
			validateLong("userInfo.qq", 1, 999999999999999l, "qqMsg", "QQ号码不正确!");
			Date start = new Date();
			start.setYear(1900);
			validateDate("userInfo.birthday", start, new Date(), "birthdayMsg", "生日不正确!");
		}
	}
	
	protected void handleError(Controller controller) {
		controller.keepModel(UserValidator.class);

		String actionKey = getActionKey();
		if (actionKey.equals("/user/save")){
			controller.render("/pingtai/user/add.jsp");
		
		}else if (actionKey.equals("/user/update")){
			controller.render("/pingtai/user/update.jsp");
		}
	}
}
