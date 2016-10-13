package com.platform.mvc.roleoperator;

import org.apache.log4j.Logger;

import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;

/**
 * 角色功能 管理	
 * 描述：
 */
@Controller("/platform/roleOperator")
public class RoleOperatorController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(RoleOperatorController.class);

	private RoleOperatorService roleOperatorService;
	
	/**
	 * 展示角色拥有的功能和所有功能列表
	 */
	public void index(){
		defaultOrder(" sorder asc, ", " morder asc ");
		roleOperatorService.paging(splitPage);
		render("/platform/roleOperator/list.html");
	}

	/**
	 * 添加角色拥有的功能
	 */
	public void add() {
		String roleIds = getPara("roleIds");
		String operatorIds = getPara("operatorIds");
		String ids = roleOperatorService.add(roleIds, operatorIds);
		renderSuccess(ids);
	}

	/**
	 * 删除角色拥有的功能
	 */
	public void del() {
		roleOperatorService.del(getPara());
		renderSuccess(null);
	}
	
}
