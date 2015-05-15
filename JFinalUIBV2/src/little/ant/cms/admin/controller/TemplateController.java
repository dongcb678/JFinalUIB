package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.TemplateService;
import little.ant.cms.admin.validator.TemplateValidator;
import little.ant.cms.model.Template;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/template
 * /jf/cms/admin/template/save
 * /jf/cms/admin/template/edit
 * /jf/cms/admin/template/update
 * /jf/cms/admin/template/view
 * /jf/cms/admin/template/delete
 * /common/admin/template/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/template")
public class TemplateController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TemplateController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TemplateService.service.list(splitPage);
		render("/cms/admin/template/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TemplateValidator.class)
	public void save() {
		getModel(Template.class).save();
		render("/cms/admin/template/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Template template = Template.dao.findById(getPara());
		setAttr("template", template);
		render("/cms/admin/template/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TemplateValidator.class)
	public void update() {
		getModel(Template.class).update();
		redirect("/jf/cms/admin/template");
	}

	/**
	 * 查看
	 */
	public void view() {
		Template template = Template.dao.findById(getPara());
		setAttr("template", template);
		render("/cms/admin/template/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TemplateService.service.delete(param);
		redirect("/jf/cms/admin/template");
	}
	
}


