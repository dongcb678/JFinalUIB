package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.User;
import little.ant.platform.service.LoginService;
import little.ant.platform.tools.ToolContext;
import little.ant.platform.tools.ToolWeb;
import little.ant.platform.validator.LoginValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 登陆处理
 */
@Controller(controllerKey = "/jf/platform/login")
public class LoginController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LoginController.class);
	
	/**
	 * 准备登陆
	 */
	public void index() {
		User user = ToolContext.getCurrentUser(getRequest(), true); // cookie认证自动登陆处理
		if(null != user){//后台
			redirect("/jf/platform/");
		}else{
			render("/platform/login.html");
		}
	}
	
	/**
	 * 登陆验证
	 */
	@Before(LoginValidator.class)
	public void vali() {
		boolean authCode = authCode();
		if(authCode){
			String username = getPara("username");
			String password = getPara("password");
			String remember = getPara("remember");
			boolean autoLogin = false;
			if(null != remember && remember.equals("1")){
				autoLogin = true;
			}
			int result = LoginService.service.login(getRequest(), getResponse(), username, password, autoLogin);
			if(result == DictKeys.login_info_3){
				redirect("/jf/platform/index");
				return;
			}
		}
		
		redirect("/jf/platform/login");
	}

	/**
	 * 注销
	 */
	public void logout() {
		ToolWeb.addCookie(getResponse(), "", "/", true, "authmark", null, 0);
		redirect("/jf/platform/login");
	}

}
