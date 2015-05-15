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
 * /jf/cms/template
 * /jf/cms/template/save
 * /jf/cms/template/edit
 * /jf/cms/template/update
 * /jf/cms/template/view
 * /jf/cms/template/delete
 * /common/template/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/template")
public class TemplateController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TemplateController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TemplateService.service.list(splitPage);
		render("/cms/template/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TemplateValidator.class)
	public void save() {
		getModel(Template.class).save();
		render("/cms/template/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Template template = Template.dao.findById(getPara());
		setAttr("template", template);
		render("/cms/template/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TemplateValidator.class)
	public void update() {
		getModel(Template.class).update();
		redirect("/jf/cms/template");
	}

	/**
	 * 查看
	 */
	public void view() {
		Template template = Template.dao.findById(getPara());
		setAttr("template", template);
		render("/cms/template/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TemplateService.service.delete(param);
		redirect("/jf/cms/template");
	}
	
}


