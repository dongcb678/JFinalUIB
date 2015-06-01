package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.ContentService;
import little.ant.cms.tourist.validator.ContentValidator;
import little.ant.cms.model.Content;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/content
 * /jf/cms/tourist/content/save
 * /jf/cms/tourist/content/edit
 * /jf/cms/tourist/content/update
 * /jf/cms/tourist/content/view
 * /jf/cms/tourist/content/delete
 * /common/content/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/content")
public class ContentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ContentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		ContentService.service.list(splitPage);
		render("/cms/tourist/content/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(ContentValidator.class)
	public void save() {
		getModel(Content.class).save();
		render("/cms/tourist/content/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Content content = Content.dao.findById(getPara());
		setAttr("content", content);
		render("/cms/tourist/content/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(ContentValidator.class)
	public void update() {
		getModel(Content.class).update();
		redirect("/jf/cms/tourist/content");
	}

	/**
	 * 查看
	 */
	public void view() {
		Content content = Content.dao.findById(getPara());
		setAttr("content", content);
		render("/cms/tourist/content/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		ContentService.service.delete(param);
		redirect("/jf/cms/tourist/content");
	}
	
}


