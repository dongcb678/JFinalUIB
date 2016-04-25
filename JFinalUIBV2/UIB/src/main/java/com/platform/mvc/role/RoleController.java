package com.platform.mvc.role;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.platform.annotation.Controller;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.base.BaseModel;
import com.platform.mvc.group.Group;

/**
 * 角色管理
 * @author 董华健
 */
@SuppressWarnings("unused")
@Controller(controllerKey = "/jf/platform/role")
public class RoleController extends BaseController {
	
	private static Logger log = Logger.getLogger(RoleController.class);
	
	private RoleService roleService;
	
	private List<Group> noCheckedList; // 分组没有的角色
	private List<Group> checkedList; // 分组拥有的角色
	
	private String moduleIds; // 模块ids
	private String operatorIds; // 功能ids

	/**
	 * 角色列表
	 */
	public void index() {
		paging(ConstantInit.db_dataSource_main, splitPage, BaseModel.sqlId_splitPageSelect, Role.sqlId_splitPageFrom);
		render("/platform/role/list.html");
	}

	/**
	 * 保存角色
	 */
	@Before(RoleValidator.class)
	public void save() {
		ids = roleService.save(getModel(Role.class));
		redirect("/jf/platform/role");
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
		redirect("/jf/platform/role");
	}
	
	/**
	 * 删除角色
	 */
	public void delete() {
		roleService.delete(getPara() == null ? ids : getPara());
		redirect("/jf/platform/role");
	}
	
	/**
	 * 分组对应的角色选择
	 */
	@SuppressWarnings("unchecked")
	public void select(){
		Map<String,Object> map = roleService.select(ids);
		noCheckedList = (List<Group>) map.get("noCheckedList");
		checkedList = (List<Group>) map.get("checkedList");
		render("/platform/role/select.html");
	}
	
	/**
	 * 查询角色拥有的功能
	 */
	public void getOperator(){
		Role role = Role.dao.findById(ids);
		renderJson(role);
	}

	/**
	 * 设置角色拥有的功能
	 */
	public void setOperator(){
		roleService.setOperator(ids, moduleIds, operatorIds);
		renderJson(ids);
	}
	
}


