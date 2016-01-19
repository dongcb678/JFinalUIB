package com.platform.mvc.group;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.platform.annotation.Controller;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.base.BaseModel;
import com.platform.mvc.base.BaseService;

/**
 * 人员分组管理
 * @author 董华健
 */
@SuppressWarnings("unused")
//@Controller(controllerKey = "/jf/platform/group")
public class GroupController extends BaseController {

	private static Logger log = Logger.getLogger(GroupController.class);
	
	private List<Group> noCheckedList; // 用户不在的组
	private List<Group> checkedList; // 用户所在的组
	private String roleIds; // 组拥有的角色
	
	/**
	 * 分组管理列表
	 */
	public void index() {
		paging(ConstantInit.db_dataSource_main, splitPage, BaseModel.sqlId_splitPageSelect, Group.sqlId_splitPageFrom);
		render("/platform/group/list.html");
	}
	
	/**
	 * 保存分组
	 */
	@Before(GroupValidator.class)
	public void save() {
		ids = GroupService.service.save(getModel(Group.class));
		redirect("/jf/platform/group");
	}
	
	/**
	 * 准备更新分组
	 */
	public void edit() {
		setAttr("group", Group.dao.findById(getPara()));
		render("/platform/group/update.html");
	}

	/**
	 * 更新分组
	 */
	@Before(GroupValidator.class)
	public void update() {
		GroupService.service.update(getModel(Group.class));
		redirect("/jf/platform/group");
	}

	/**
	 * 删除分组
	 */
	public void delete() {
		GroupService.service.delete(getPara() == null ? ids : getPara());
		redirect("/jf/platform/group");
	}

	/**
	 * 人员分组弹出框
	 */
	@SuppressWarnings("unchecked")
	public void select(){
		Map<String,Object> map = GroupService.service.select(ids);
		noCheckedList = (List<Group>) map.get("noCheckedList");
		checkedList = (List<Group>) map.get("checkedList");
		render("/platform/group/select.html");
	}
	
	/**
	 * 设置分组对应的角色
	 */
	public void setRole(){
		GroupService.service.setRole(ids, roleIds);
		renderText(ids);
	}
}


