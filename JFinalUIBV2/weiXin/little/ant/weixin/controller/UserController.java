package little.ant.weixin.controller;

import org.apache.log4j.Logger;

import little.ant.platform.annotation.Controller;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.controller.BaseController;
import little.ant.platform.model.BaseModel;
import little.ant.weixin.model.User;

/**
 * 用户管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/wx/user")
public class UserController extends BaseController {

	private static Logger log = Logger.getLogger(UserController.class);
	
	public void index(){
		log.debug("微信用户管理：分页");
		paging(ConstantInit.db_dataSource_main, splitPage, BaseModel.sqlId_splitPage_select, User.sqlId_splitPage_from);
		render("/weiXin/user/list.html");
	}
	
}
