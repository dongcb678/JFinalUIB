package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.AnswersService;
import little.ant.cms.admin.validator.AnswersValidator;
import little.ant.cms.model.Answers;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/answers
 * /jf/cms/admin/answers/save
 * /jf/cms/admin/answers/edit
 * /jf/cms/admin/answers/update
 * /jf/cms/admin/answers/view
 * /jf/cms/admin/answers/delete
 * /common/admin/answers/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/answers")
public class AnswersController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnswersController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AnswersService.service.list(splitPage);
		render("/cms/admin/answers/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(AnswersValidator.class)
	public void save() {
		getModel(Answers.class).save();
		render("/cms/admin/answers/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Answers answers = Answers.dao.findById(getPara());
		setAttr("answers", answers);
		render("/cms/admin/answers/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AnswersValidator.class)
	public void update() {
		getModel(Answers.class).update();
		redirect("/jf/cms/admin/answers");
	}

	/**
	 * 查看
	 */
	public void view() {
		Answers answers = Answers.dao.findById(getPara());
		setAttr("answers", answers);
		render("/cms/admin/answers/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AnswersService.service.delete(param);
		redirect("/jf/cms/admin/answers");
	}
	
}


