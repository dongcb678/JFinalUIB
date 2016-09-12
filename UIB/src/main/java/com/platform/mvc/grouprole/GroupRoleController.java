package com.platform.mvc.grouprole;

import org.apache.log4j.Logger;

import com.jfinal.kit.Ret;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;

/**
 * 分组角色 管理	
 * 描述：
 */
@Controller("/platform/groupRole")
public class GroupRoleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(GroupRoleController.class);

	private GroupRoleService groupRoleService;
	
	/**
	 * 分组角色弹出框
	 */
	public void select(){
		Ret ret = groupRoleService.selectRole(ids);
		setAttrs(ret.getData());
		render("/platform/groupRole/select.html");
	}
	
	/**
	 * 添加分组拥有的角色
	 */
	public void addRole(){
		String roleIds = getPara("roleIds");
		groupRoleService.addRole(ids, roleIds);
		renderText(ids);
	}
	
	/**
	 * 删除分组拥有的角色
	 */
	public void delRole(){
		groupRoleService.delRole(ids);
		renderText(ids);
	}
	
}
