package little.ant.cms.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.member.service.QuestionsService;
import little.ant.cms.member.validator.QuestionsValidator;
import little.ant.cms.model.Questions;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/member/questions
 * /jf/cms/member/questions/save
 * /jf/cms/member/questions/edit
 * /jf/cms/member/questions/update
 * /jf/cms/member/questions/view
 * /jf/cms/member/questions/delete
 * /common/questions/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/member/questions")
public class QuestionsController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(QuestionsController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		QuestionsService.service.list(splitPage);
		render("/cms/member/questions/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(QuestionsValidator.class)
	public void save() {
		getModel(Questions.class).save();
		render("/cms/member/questions/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Questions questions = Questions.dao.findById(getPara());
		setAttr("questions", questions);
		render("/cms/member/questions/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(QuestionsValidator.class)
	public void update() {
		getModel(Questions.class).update();
		redirect("/jf/cms/member/questions");
	}

	/**
	 * 查看
	 */
	public void view() {
		Questions questions = Questions.dao.findById(getPara());
		setAttr("questions", questions);
		render("/cms/member/questions/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		QuestionsService.service.delete(param);
		redirect("/jf/cms/member/questions");
	}
	
}


