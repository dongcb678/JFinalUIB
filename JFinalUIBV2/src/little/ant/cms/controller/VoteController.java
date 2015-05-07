package little.ant.cms.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.service.VoteService;
import little.ant.cms.validator.VoteValidator;
import little.ant.cms.model.Vote;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/vote
 * /jf/cms/vote/save
 * /jf/cms/vote/edit
 * /jf/cms/vote/update
 * /jf/cms/vote/view
 * /jf/cms/vote/delete
 * /common/vote/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/vote")
public class VoteController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		VoteService.service.list(splitPage);
		render("/cms/vote/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(VoteValidator.class)
	public void save() {
		getModel(Vote.class).save();
		render("/cms/vote/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Vote vote = Vote.dao.findById(getPara());
		setAttr("vote", vote);
		render("/cms/vote/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(VoteValidator.class)
	public void update() {
		getModel(Vote.class).update();
		redirect("/jf/cms/vote");
	}

	/**
	 * 查看
	 */
	public void view() {
		Vote vote = Vote.dao.findById(getPara());
		setAttr("vote", vote);
		render("/cms/vote/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		VoteService.service.delete(param);
		redirect("/jf/cms/vote");
	}
	
}


