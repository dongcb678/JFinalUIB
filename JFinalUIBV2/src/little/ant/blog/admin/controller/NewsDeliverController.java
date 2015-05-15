package little.ant.blog.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.admin.service.NewsDeliverService;
import little.ant.blog.admin.validator.NewsDeliverValidator;
import little.ant.blog.model.NewsDeliver;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/admin/newsDeliver
 * /jf/blog/admin/newsDeliver/save
 * /jf/blog/admin/newsDeliver/edit
 * /jf/blog/admin/newsDeliver/update
 * /jf/blog/admin/newsDeliver/view
 * /jf/blog/admin/newsDeliver/delete
 * /common/admin/newsDeliver/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/admin/newsDeliver")
public class NewsDeliverController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(NewsDeliverController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		NewsDeliverService.service.list(splitPage);
		render("/blog/admin/newsDeliver/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(NewsDeliverValidator.class)
	public void save() {
		getModel(NewsDeliver.class).save();
		render("/blog/admin/newsDeliver/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		NewsDeliver newsDeliver = NewsDeliver.dao.findById(getPara());
		setAttr("newsDeliver", newsDeliver);
		render("/blog/admin/newsDeliver/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(NewsDeliverValidator.class)
	public void update() {
		getModel(NewsDeliver.class).update();
		redirect("/jf/blog/admin/newsDeliver");
	}

	/**
	 * 查看
	 */
	public void view() {
		NewsDeliver newsDeliver = NewsDeliver.dao.findById(getPara());
		setAttr("newsDeliver", newsDeliver);
		render("/blog/admin/newsDeliver/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		NewsDeliverService.service.delete(param);
		redirect("/jf/blog/admin/newsDeliver");
	}
	
}


