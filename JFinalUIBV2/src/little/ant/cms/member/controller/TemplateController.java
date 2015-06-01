package little.ant.cms.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.member.service.TemplateService;
import little.ant.cms.member.validator.TemplateValidator;
import little.ant.cms.model.Template;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/member/template
 * /jf/cms/member/template/save
 * /jf/cms/member/template/edit
 * /jf/cms/member/template/update
 * /jf/cms/member/template/view
 * /jf/cms/member/template/delete
 * /common/template/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/member/template")
public class TemplateController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TemplateController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		TemplateService.service.list(splitPage);
		render("/cms/member/template/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(TemplateValidator.class)
	public void save() {
		getModel(Template.class).save();
		render("/cms/member/template/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Template template = Template.dao.findById(getPara());
		setAttr("template", template);
		render("/cms/member/template/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(TemplateValidator.class)
	public void update() {
		getModel(Template.class).update();
		redirect("/jf/cms/member/template");
	}

	/**
	 * 查看
	 */
	public void view() {
		Template template = Template.dao.findById(getPara());
		setAttr("template", template);
		render("/cms/member/template/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		TemplateService.service.delete(param);
		redirect("/jf/cms/member/template");
	}
	
}


