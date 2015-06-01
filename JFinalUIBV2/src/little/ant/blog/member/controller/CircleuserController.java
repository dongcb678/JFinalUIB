package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.CircleuserService;
import little.ant.blog.member.validator.CircleuserValidator;
import little.ant.blog.model.Circleuser;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/circleuser
 * /jf/blog/member/circleuser/save
 * /jf/blog/member/circleuser/edit
 * /jf/blog/member/circleuser/update
 * /jf/blog/member/circleuser/view
 * /jf/blog/member/circleuser/delete
 * /common/circleuser/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/circleuser")
public class CircleuserController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CircleuserController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		CircleuserService.service.list(splitPage);
		render("/blog/member/circleuser/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(CircleuserValidator.class)
	public void save() {
		getModel(Circleuser.class).save();
		render("/blog/member/circleuser/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Circleuser circleuser = Circleuser.dao.findById(getPara());
		setAttr("circleuser", circleuser);
		render("/blog/member/circleuser/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(CircleuserValidator.class)
	public void update() {
		getModel(Circleuser.class).update();
		redirect("/jf/blog/member/circleuser");
	}

	/**
	 * 查看
	 */
	public void view() {
		Circleuser circleuser = Circleuser.dao.findById(getPara());
		setAttr("circleuser", circleuser);
		render("/blog/member/circleuser/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		CircleuserService.service.delete(param);
		redirect("/jf/blog/member/circleuser");
	}
	
}


