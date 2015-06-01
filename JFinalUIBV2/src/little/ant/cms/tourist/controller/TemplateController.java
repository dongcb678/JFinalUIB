package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.TemplateService;
import little.ant.cms.tourist.validator.TemplateValidator;
import little.ant.cms.model.Template;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/template
 * /jf/cms/tourist/template/save
 * /jf/cms/tourist/template/edit
 * /jf/cms/tourist/template/update
 * /jf/cms/tourist/template/view
 * /jf/cms/tourist/template/delete
 * /common/template/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/template")
public class TemplateController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TemplateController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TemplateService.service.list(splitPage);
		render("/cms/tourist/template/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TemplateValidator.class)
	public void save() {
		getModel(Template.class).save();
		render("/cms/tourist/template/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Template template = Template.dao.findById(getPara());
		setAttr("template", template);
		render("/cms/tourist/template/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TemplateValidator.class)
	public void update() {
		getModel(Template.class).update();
		redirect("/jf/cms/tourist/template");
	}

	/**
	 * 查看
	 */
	public void view() {
		Template template = Template.dao.findById(getPara());
		setAttr("template", template);
		render("/cms/tourist/template/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TemplateService.service.delete(param);
		redirect("/jf/cms/tourist/template");
	}
	
}


