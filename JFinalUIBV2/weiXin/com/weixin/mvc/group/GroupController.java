package com.weixin.mvc.group;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseController;

/**
 * 用户分组管理
 * @author 董华健
 */
//@Controller(controllerKey = "/jf/wx/group")
public class GroupController extends BaseController {

	private static Logger log = Logger.getLogger(GroupController.class);
	
	public void index(){
		log.debug("微信用户分组管理：分页");
		paging(ConstantInit.db_dataSource_main, splitPage, Group.sqlId_splitPage);
		render("/weiXin/group/list.html");
	}

	@Before(GroupValidator.class)
	public void save() {
		GroupService.service.save(getModel(Group.class));
		redirect("/jf/wx/group");
	}
	
	public void edit() {
		setAttr("group", Group.dao.findById(getPara()));
		render("/weiXin/group/update.html");
	}
	
	@Before(GroupValidator.class)
	public void update() {
		GroupService.service.update(getModel(Group.class));
		redirect("/jf/wx/group");
	}
	
}
