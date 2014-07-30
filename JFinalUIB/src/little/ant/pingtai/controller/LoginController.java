package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.model.User;
import little.ant.pingtai.service.LoginService;
import little.ant.pingtai.tools.ToolContext;
import little.ant.pingtai.tools.ToolWeb;
import little.ant.pingtai.validator.LoginValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 登陆处理
 */
@Controller(controllerKey = "/jf/login")
public class LoginController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LoginController.class);
			
	private LoginService loginService = new LoginService();
	
	/**
	 * 准备登陆
	 */
	public void index() {
		User user = ToolContext.getCurrentUser(getRequest(), true); // cookie认证自动登陆处理
		if(null != user){//后台
			redirect("/jf/");
		}else{
			render("/pingtai/login.html");
		}
	}
	
	/**
	 * 登陆验证
	 */
	@Before(LoginValidator.class)
	public void vali() {
		String username = getPara("username");
		String password = getPara("password");
		String remember = getPara("remember");
		boolean autoLogin = false;
		if(null != remember && remember.equals("1")){
			autoLogin = true;
		}
		int result = loginService.login(getRequest(), getResponse(), username, password, autoLogin);
		if(result == DictKeys.login_info_3){
			redirect("/jf/index");
		}else{
			redirect("/jf/login");
		}
	}

	/**
	 * 注销
	 */
	public void logout() {
		ToolWeb.addCookie(getResponse(), "authmark", null, 0);
		render("/pingtai/login.html");
	}

}
