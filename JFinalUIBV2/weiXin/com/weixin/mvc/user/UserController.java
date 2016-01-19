package com.weixin.mvc.user;

import org.apache.log4j.Logger;

import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.base.BaseModel;

/**
 * 用户管理
 * @author 董华健
 */
//@Controller(controllerKey = "/jf/wx/user")
public class UserController extends BaseController {

	private static Logger log = Logger.getLogger(UserController.class);
	
	public void index(){
		log.debug("微信用户管理：分页");
		paging(ConstantInit.db_dataSource_main, splitPage, BaseModel.sqlId_splitPageSelect, User.sqlId_splitPageFrom);
		render("/weiXin/user/list.html");
	}
	
}
