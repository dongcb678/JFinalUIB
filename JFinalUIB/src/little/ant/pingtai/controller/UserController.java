package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.ControllerBind;
import little.ant.pingtai.model.User;
import little.ant.pingtai.model.UserInfo;
import little.ant.pingtai.service.UserService;
import little.ant.pingtai.validator.UserValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 用户管理
 */
@ControllerBind(controllerKey = "/jf/user")
public class UserController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UserController.class);
	
	private UserService userService = new UserService();
	
	private String deptIds;
	private String groupIds;
	
	/**
	 * 默认列表
	 */
	public void index() {
		userService.list(splitPage);
		render("/pingtai/user/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(UserValidator.class)
	public void save() {
		String password = getPara("password");
		User user = getModel(User.class);
		UserInfo userInfo = getModel(UserInfo.class);
		userService.save(user, password, userInfo);
		render("/pingtai/user/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		User user = User.dao.findById(getPara());
		setAttr("user", user);
		setAttr("userInfo", UserInfo.dao.findById(user.getStr("userinfoids")));
		render("/pingtai/user/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(UserValidator.class)
	public void update() {
		String password = getPara("password");
		User user = getModel(User.class);
		UserInfo userInfo = getModel(UserInfo.class);
		userService.update(user, password, userInfo);
		redirect("/jf/user");
	}

	/**
	 * 查看
	 */
	public void view() {
		User user = User.dao.findById(getPara());
		setAttr("user", user);
		setAttr("userInfo", UserInfo.dao.findById(user.getStr("userinfoids")));
		render("/pingtai/user/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		userService.delete(getPara());
		redirect("/jf/user");
	}

	/**
	 * 用户树ztree节点数据
	 */
	public void treeData() {
		String json = userService.childNodeData(deptIds);
		renderJson(json);
	}
	
	/**
	 * 设置用户拥有的组
	 */
	public void setGroup(){
		userService.setGroup(ids, groupIds);
		renderText(ids);
	}
	
	/**
	 * 密码变更
	 */
	public void passChange(){
		
	}
	
}


