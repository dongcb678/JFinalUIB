package little.ant.weixin.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.controller.BaseController;
import little.ant.weixin.service.UserService;

import org.apache.log4j.Logger;

/**
 * 用户管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/wx/user")
public class UserController extends BaseController {

	private static Logger log = Logger.getLogger(UserController.class);
	
	public void index(){
		log.debug("微信用户管理：分页");
		UserService.service.list(splitPage);
		render("/weiXin/user/list.html");
	}
	
}
