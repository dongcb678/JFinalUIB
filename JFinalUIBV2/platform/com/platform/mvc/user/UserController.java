package com.platform.mvc.user;

import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.platform.annotation.Controller;
import com.platform.constant.ConstantInit;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseController;

/**
 * 用户管理
 */
@Controller(controllerKey = "/jf/platform/user")
public class UserController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UserController.class);
	
	private String deptIds;
	private String groupIds;
	
	/**
	 * 默认列表
	 */
	public void index() {
		paging(ConstantInit.db_dataSource_main, splitPage, User.sqlId_splitPageSelect, User.sqlId_splitPageFrom);
		render("/platform/user/list.html");
	}
	
	/**
	 * 保存新增用户
	 */
	@Before(UserValidator.class)
	public void save() {
		String password = getPara("password");
		User user = getModel(User.class);
		UserInfo userInfo = getModel(UserInfo.class);
		UserService.service.save(user, password, userInfo);
		render("/platform/user/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		User user = User.dao.findById(getPara());
		setAttr("user", user);
		setAttr("userInfo", UserInfo.dao.findById(user.getStr(User.column_userinfoids)));
		render("/platform/user/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(UserValidator.class)
	public void update() {
		String password = getPara("password");
		User user = getModel(User.class);
		UserInfo userInfo = getModel(UserInfo.class);
		UserService.service.update(user, password, userInfo);
		redirect("/jf/platform/user");
	}

	/**
	 * 查看
	 */
	public void view() {
		User user = User.dao.findById(getPara());
		setAttr("user", user);
		setAttr("userInfo", user.getUserInfo());
		render("/platform/user/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		UserService.service.delete(getPara() == null ? ids : getPara());
		redirect("/jf/platform/user");
	}

	/**
	 * 用户树ztree节点数据
	 */
	public void treeData() {
		List<ZtreeNode> list = UserService.service.childNodeData(getCxt(), deptIds);
		renderJson(list);
	}
	
	/**
	 * 设置用户拥有的组
	 */
	public void setGroup(){
		UserService.service.setGroup(ids, groupIds);
		renderText(ids);
	}
	
	/**
	 * 验证旧密码是否正确
	 */
	public void valiPassWord(){
		String passWord = getPara("passWord");
		boolean bool = UserService.service.valiPassWord(ids, passWord);
		renderText(String.valueOf(bool));
	}
	
	/**
	 * 密码变更
	 */
	public void passChange(){
		String userName = getPara("userName");
		String passOld = getPara("passOld");
		String passNew = getPara("passNew");
		UserService.service.passChange(userName, passOld, passNew);
		renderText("");
	}
	
}


