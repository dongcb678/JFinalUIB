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
 * /jf/blog/circle
 * /jf/blog/circle/save
 * /jf/blog/circle/edit
 * /jf/blog/circle/update
 * /jf/blog/circle/view
 * /jf/blog/circle/delete
 * /common/circle/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/circle")
public class CircleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CircleController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		CircleService.service.list(splitPage);
		render("/blog/circle/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(CircleValidator.class)
	public void save() {
		getModel(Circle.class).save();
		render("/blog/circle/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Circle circle = Circle.dao.findById(getPara());
		setAttr("circle", circle);
		render("/blog/circle/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(CircleValidator.class)
	public void update() {
		getModel(Circle.class).update();
		redirect("/jf/blog/circle");
	}

	/**
	 * 查看
	 */
	public void view() {
		Circle circle = Circle.dao.findById(getPara());
		setAttr("circle", circle);
		render("/blog/circle/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		CircleService.service.delete(param);
		redirect("/jf/blog/circle");
	}
	
}


