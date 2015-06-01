package little.ant.blog.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.tourist.service.NewsDeliverService;
import little.ant.blog.tourist.validator.NewsDeliverValidator;
import little.ant.blog.model.NewsDeliver;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/tourist/newsDeliver
 * /jf/blog/tourist/newsDeliver/save
 * /jf/blog/tourist/newsDeliver/edit
 * /jf/blog/tourist/newsDeliver/update
 * /jf/blog/tourist/newsDeliver/view
 * /jf/blog/tourist/newsDeliver/delete
 * /common/newsDeliver/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/tourist/newsDeliver")
public class NewsDeliverController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(NewsDeliverController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		NewsDeliverService.service.list(splitPage);
		render("/blog/tourist/newsDeliver/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(NewsDeliverValidator.class)
	public void save() {
		getModel(NewsDeliver.class).save();
		render("/blog/tourist/newsDeliver/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		NewsDeliver newsDeliver = NewsDeliver.dao.findById(getPara());
		setAttr("newsDeliver", newsDeliver);
		render("/blog/tourist/newsDeliver/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(NewsDeliverValidator.class)
	public void update() {
		getModel(NewsDeliver.class).update();
		redirect("/jf/blog/tourist/newsDeliver");
	}

	/**
	 * 查看
	 */
	public void view() {
		NewsDeliver newsDeliver = NewsDeliver.dao.findById(getPara());
		setAttr("newsDeliver", newsDeliver);
		render("/blog/tourist/newsDeliver/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		NewsDeliverService.service.delete(param);
		redirect("/jf/blog/tourist/newsDeliver");
	}
	
}


