package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.AnswersService;
import little.ant.cms.tourist.validator.AnswersValidator;
import little.ant.cms.model.Answers;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/answers
 * /jf/cms/tourist/answers/save
 * /jf/cms/tourist/answers/edit
 * /jf/cms/tourist/answers/update
 * /jf/cms/tourist/answers/view
 * /jf/cms/tourist/answers/delete
 * /common/answers/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/answers")
public class AnswersController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnswersController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AnswersService.service.list(splitPage);
		render("/cms/tourist/answers/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(AnswersValidator.class)
	public void save() {
		getModel(Answers.class).save();
		render("/cms/tourist/answers/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Answers answers = Answers.dao.findById(getPara());
		setAttr("answers", answers);
		render("/cms/tourist/answers/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AnswersValidator.class)
	public void update() {
		getModel(Answers.class).update();
		redirect("/jf/cms/tourist/answers");
	}

	/**
	 * 查看
	 */
	public void view() {
		Answers answers = Answers.dao.findById(getPara());
		setAttr("answers", answers);
		render("/cms/tourist/answers/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AnswersService.service.delete(param);
		redirect("/jf/cms/tourist/answers");
	}
	
}


