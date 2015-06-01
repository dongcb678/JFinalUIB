package little.ant.blog.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.member.service.CircleService;
import little.ant.blog.member.validator.CircleValidator;
import little.ant.blog.model.Circle;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/member/circle
 * /jf/blog/member/circle/save
 * /jf/blog/member/circle/edit
 * /jf/blog/member/circle/update
 * /jf/blog/member/circle/view
 * /jf/blog/member/circle/delete
 * /common/circle/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/member/circle")
public class CircleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CircleController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		CircleService.service.list(splitPage);
		render("/blog/member/circle/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(CircleValidator.class)
	public void save() {
		getModel(Circle.class).save();
		render("/blog/member/circle/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Circle circle = Circle.dao.findById(getPara());
		setAttr("circle", circle);
		render("/blog/member/circle/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(CircleValidator.class)
	public void update() {
		getModel(Circle.class).update();
		redirect("/jf/blog/member/circle");
	}

	/**
	 * 查看
	 */
	public void view() {
		Circle circle = Circle.dao.findById(getPara());
		setAttr("circle", circle);
		render("/blog/member/circle/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		CircleService.service.delete(param);
		redirect("/jf/blog/member/circle");
	}
	
}


