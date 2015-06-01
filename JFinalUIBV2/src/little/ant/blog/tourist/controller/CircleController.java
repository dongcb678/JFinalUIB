package little.ant.blog.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.tourist.service.CircleService;
import little.ant.blog.tourist.validator.CircleValidator;
import little.ant.blog.model.Circle;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/tourist/circle
 * /jf/blog/tourist/circle/save
 * /jf/blog/tourist/circle/edit
 * /jf/blog/tourist/circle/update
 * /jf/blog/tourist/circle/view
 * /jf/blog/tourist/circle/delete
 * /common/circle/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/tourist/circle")
public class CircleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CircleController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		CircleService.service.list(splitPage);
		render("/blog/tourist/circle/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(CircleValidator.class)
	public void save() {
		getModel(Circle.class).save();
		render("/blog/tourist/circle/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Circle circle = Circle.dao.findById(getPara());
		setAttr("circle", circle);
		render("/blog/tourist/circle/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(CircleValidator.class)
	public void update() {
		getModel(Circle.class).update();
		redirect("/jf/blog/tourist/circle");
	}

	/**
	 * 查看
	 */
	public void view() {
		Circle circle = Circle.dao.findById(getPara());
		setAttr("circle", circle);
		render("/blog/tourist/circle/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		CircleService.service.delete(param);
		redirect("/jf/blog/tourist/circle");
	}
	
}


