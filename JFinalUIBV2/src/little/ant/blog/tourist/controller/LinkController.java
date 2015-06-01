package little.ant.blog.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.blog.tourist.service.LinkService;
import little.ant.blog.tourist.validator.LinkValidator;
import little.ant.blog.model.Link;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/blog/tourist/link
 * /jf/blog/tourist/link/save
 * /jf/blog/tourist/link/edit
 * /jf/blog/tourist/link/update
 * /jf/blog/tourist/link/view
 * /jf/blog/tourist/link/delete
 * /common/link/add.html
 * 
 */
@Controller(controllerKey = "/jf/blog/tourist/link")
public class LinkController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LinkController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		LinkService.service.list(splitPage);
		render("/blog/tourist/link/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(LinkValidator.class)
	public void save() {
		getModel(Link.class).save();
		render("/blog/tourist/link/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Link link = Link.dao.findById(getPara());
		setAttr("link", link);
		render("/blog/tourist/link/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(LinkValidator.class)
	public void update() {
		getModel(Link.class).update();
		redirect("/jf/blog/tourist/link");
	}

	/**
	 * 查看
	 */
	public void view() {
		Link link = Link.dao.findById(getPara());
		setAttr("link", link);
		render("/blog/tourist/link/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		LinkService.service.delete(param);
		redirect("/jf/blog/tourist/link");
	}
	
}


