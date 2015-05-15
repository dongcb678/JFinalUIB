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
 * /jf/cms/answers
 * /jf/cms/answers/save
 * /jf/cms/answers/edit
 * /jf/cms/answers/update
 * /jf/cms/answers/view
 * /jf/cms/answers/delete
 * /common/answers/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/answers")
public class AnswersController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnswersController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AnswersService.service.list(splitPage);
		render("/cms/answers/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(AnswersValidator.class)
	public void save() {
		getModel(Answers.class).save();
		render("/cms/answers/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Answers answers = Answers.dao.findById(getPara());
		setAttr("answers", answers);
		render("/cms/answers/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AnswersValidator.class)
	public void update() {
		getModel(Answers.class).update();
		redirect("/jf/cms/answers");
	}

	/**
	 * 查看
	 */
	public void view() {
		Answers answers = Answers.dao.findById(getPara());
		setAttr("answers", answers);
		render("/cms/answers/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AnswersService.service.delete(param);
		redirect("/jf/cms/answers");
	}
	
}


