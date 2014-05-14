package little.ant.pingtai.controller;

import little.ant.pingtai.model.User;
import little.ant.pingtai.model.UserInfo;
import little.ant.pingtai.service.UserService;
import little.ant.pingtai.validator.UserValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 用户管理
 */
public class UserController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UserController.class);
	
	private UserService userService = new UserService();
	
	private String deptIds;
	private String groupIds;

	public void index() {
		userService.list(splitPage);
		render("/pingtai/user/list.html");
	}
	
	@Before(UserValidator.class)
	public void save() {
		String password = getPara("password");
		User user = getModel(User.class);
		UserInfo userInfo = getModel(UserInfo.class);
		userService.save(user, password, userInfo);
		render("/pingtai/user/add.html");
	}
	
	public void edit() {
		User user = User.dao.findById(getPara());
		setAttr("user", user);
		setAttr("userInfo", UserInfo.dao.findById(user.getStr("userinfoids")));
		render("/pingtai/user/update.html");
	}
	
	@Before(UserValidator.class)
	public void update() {
		String password = getPara("password");
		User user = getModel(User.class);
		UserInfo userInfo = getModel(UserInfo.class);
		userService.update(user, password, userInfo);
		redirect("/jf/user");
	}

	public void view() {
		User user = User.dao.findById(getPara());
		setAttr("user", user);
		setAttr("userInfo", UserInfo.dao.findById(user.getStr("userinfoids")));
		render("/pingtai/user/view.html");
	}
	
	public void delete() {
		userService.delete(getPara());
		redirect("/jf/user");
	}

	public void treeData() {
		String json = userService.childNodeData(deptIds);
		renderJson(json);
	}
	
	public void setGroup(){
		userService.setGroup(ids, groupIds);
		renderText(ids);
	}
}


