package com.platform.mvc.role;

import com.jfinal.aop.Before;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.base.BaseModel;

/**
 * 角色管理
 * @author 董华健
 */
@SuppressWarnings("unused")
@Controller("/platform/role")
public class RoleController extends BaseController {
	
	private static final Log log = Log.getLog(RoleController.class);
	
	private RoleService roleService;
	
	/**
	 * 角色列表
	 */
	public void index() {
		paging(splitPage, BaseModel.sqlId_splitPageSelect, Role.sqlId_splitPageFrom);
		render("/platform/role/list.html");
	}

	/**
	 * 保存角色
	 */
	@Before(RoleValidator.class)
	public void save() {
		ids = roleService.save(getModel(Role.class));
		forwardAction("/platform/role/backOff");
	}

	/**
	 * 准备更新角色
	 */
	public void edit() {
		setAttr("role", Role.dao.findById(getPara()));
		render("/platform/role/update.html");
	}

	/**
	 * 更新角色
	 */
	@Before(RoleValidator.class)
	public void update() {
		roleService.update(getModel(Role.class));
		forwardAction("/platform/role/backOff");
	}
	
	/**
	 * 删除角色
	 */
	public void delete() {
		roleService.delete(getPara() == null ? ids : getPara());
		forwardAction("/platform/role/backOff");
	}
	
}


