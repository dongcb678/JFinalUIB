package little.ant.cms.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.member.service.AnswersService;
import little.ant.cms.member.validator.AnswersValidator;
import little.ant.cms.model.Answers;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/member/answers
 * /jf/cms/member/answers/save
 * /jf/cms/member/answers/edit
 * /jf/cms/member/answers/update
 * /jf/cms/member/answers/view
 * /jf/cms/member/answers/delete
 * /common/answers/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/member/answers")
public class AnswersController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnswersController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		AnswersService.service.list(splitPage);
		render("/cms/member/answers/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(AnswersValidator.class)
	public void save() {
		getModel(Answers.class).save();
		render("/cms/member/answers/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Answers answers = Answers.dao.findById(getPara());
		setAttr("answers", answers);
		render("/cms/member/answers/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(AnswersValidator.class)
	public void update() {
		getModel(Answers.class).update();
		redirect("/jf/cms/member/answers");
	}

	/**
	 * 查看
	 */
	public void view() {
		Answers answers = Answers.dao.findById(getPara());
		setAttr("answers", answers);
		render("/cms/member/answers/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		AnswersService.service.delete(param);
		redirect("/jf/cms/member/answers");
	}
	
}


