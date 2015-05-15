package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.ContentService;
import little.ant.cms.admin.validator.ContentValidator;
import little.ant.cms.model.Content;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/content
 * /jf/cms/admin/content/save
 * /jf/cms/admin/content/edit
 * /jf/cms/admin/content/update
 * /jf/cms/admin/content/view
 * /jf/cms/admin/content/delete
 * /common/admin/content/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/content")
public class ContentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ContentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		ContentService.service.list(splitPage);
		render("/cms/admin/content/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(ContentValidator.class)
	public void save() {
		getModel(Content.class).save();
		render("/cms/admin/content/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Content content = Content.dao.findById(getPara());
		setAttr("content", content);
		render("/cms/admin/content/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(ContentValidator.class)
	public void update() {
		getModel(Content.class).update();
		redirect("/jf/cms/admin/content");
	}

	/**
	 * 查看
	 */
	public void view() {
		Content content = Content.dao.findById(getPara());
		setAttr("content", content);
		render("/cms/admin/content/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		ContentService.service.delete(param);
		redirect("/jf/cms/admin/content");
	}
	
}


