package little.ant.platform.controller;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

import little.ant.platform.annotation.Controller;
import little.ant.platform.constant.ConstantLogin;
import little.ant.platform.constant.ConstantWebContext;
import little.ant.platform.model.User;
import little.ant.platform.service.LoginService;
import little.ant.platform.tools.ToolWeb;
import little.ant.platform.validator.LoginValidator;

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
		User user = getCUser(); // cookie认证自动登陆处理
		if(null != user){//后台
			redirect("/jf/platform/");
		}else{
			render("/platform/login/login.html");
		}
	}

	/**
	 * 验证账号是否存在
	 */
	public void valiUserName(){
		String userName = getPara("userName");
		int count = LoginService.service.valiUserName(userName);
		renderText(String.valueOf(count));
	}
	
	/**
	 * 验证邮箱是否存在
	 */
	public void valiMailBox(){
		String mailBox = getPara("mailBox");
		int count = LoginService.service.valiMailBox(mailBox);
		renderText(String.valueOf(count));
	}

	/**
	 * 验证身份证是否存在
	 */
	public void valiIdcard(){
		String idcard = getPara("idcard");
		int count = LoginService.service.valiIdcard(idcard);
		renderText(String.valueOf(count));
	}

	/**
	 * 验证手机号是否存在
	 */
	public void valiMobile(){
		String mobile = getPara("mobile");
		int count = LoginService.service.valiMobile(mobile);
		renderText(String.valueOf(count));
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
			if(result == ConstantLogin.login_info_3){
				redirect("/jf/platform/index");
				return;
			}
		}
		
		redirect("/jf/platform/login");
	}

	/**
	 * 锁屏验证密码
	 */
	@Before(LoginValidator.class)
	public void pass() {
		User user = getCUser();
		String password = getPara("password");
		
		int result = LoginService.service.pass(getRequest(), getResponse(), user.getStr("username"), password);
		if(result == ConstantLogin.login_info_3){
			redirect("/jf/platform/index");
			return;
		}
		
		redirect("/jf/platform/login");
	}

	/**
	 * 注销
	 */
	public void logout() {
		ToolWeb.addCookie(getResponse(), "", "/", true, ConstantWebContext.authmark, null, 0);
		redirect("/jf/platform/login");
	}

}
