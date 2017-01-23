package com.platform.mvc.usergroup;

import java.util.HashMap;

import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;

/**
 * 用户分组 管理	
 * 描述：
 */
@Controller("/platform/userGroup")
public class UserGroupController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(UserGroupController.class);

	private UserGroupService userGroupService;

	/**
	 * 人员分组弹出框
	 */
	public void select(){
		HashMap ret = userGroupService.select(ids);
		setAttrs(ret);
		render("/platform/userGroup/select.html");
	}
	
	/**
	 * 添加用户拥有的组
	 */
	public void addGroup(){
		String groupIds = getPara("groupIds");
		userGroupService.addGroup(ids, groupIds);
		renderText(ids);
	}
	
	/**
	 * 删除用户拥有的组
	 */
	public void delGroup(){
		userGroupService.delGroup(ids);
		renderText(ids);
	}
	
}
