package little.ant.weixin.controller;

import little.ant.pingtai.controller.BaseController;
import little.ant.weixin.service.UserService;

import org.apache.log4j.Logger;

/**
 * 用户管理
 * @author 董华健
 */
public class UserController extends BaseController {

	private static Logger log = Logger.getLogger(UserController.class);
	
	private UserService userService = new UserService();
	
	public void index(){
		
	}
	
}
