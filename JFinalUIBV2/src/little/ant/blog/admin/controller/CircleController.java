package little.ant.blog.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.admin.service.CircleService;
import little.ant.blog.admin.validator.CircleValidator;
import little.ant.blog.model.Circle;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/admin/circle
 * /jf/blog/admin/circle/save
 * /jf/blog/admin/circle/edit
 * /jf/blog/admin/circle/update
 * /jf/blog/admin/circle/view
 * /jf/blog/admin/circle/delete
 * /common/admin/circle/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/admin/circle")
public class CircleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CircleController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		CircleService.service.list(splitPage);
		render("/blog/admin/circle/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(CircleValidator.class)
	public void save() {
		getModel(Circle.class).save();
		render("/blog/admin/circle/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Circle circle = Circle.dao.findById(getPara());
		setAttr("circle", circle);
		render("/blog/admin/circle/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(CircleValidator.class)
	public void update() {
		getModel(Circle.class).update();
		redirect("/jf/blog/admin/circle");
	}

	/**
	 * 查看
	 */
	public void view() {
		Circle circle = Circle.dao.findById(getPara());
		setAttr("circle", circle);
		render("/blog/admin/circle/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		CircleService.service.delete(param);
		redirect("/jf/blog/admin/circle");
	}
	
}


