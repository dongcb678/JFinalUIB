package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.VoteService;
import little.ant.cms.admin.validator.VoteValidator;
import little.ant.cms.model.Vote;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/vote
 * /jf/cms/admin/vote/save
 * /jf/cms/admin/vote/edit
 * /jf/cms/admin/vote/update
 * /jf/cms/admin/vote/view
 * /jf/cms/admin/vote/delete
 * /common/admin/vote/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/vote")
public class VoteController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		VoteService.service.list(splitPage);
		render("/cms/admin/vote/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(VoteValidator.class)
	public void save() {
		getModel(Vote.class).save();
		render("/cms/admin/vote/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Vote vote = Vote.dao.findById(getPara());
		setAttr("vote", vote);
		render("/cms/admin/vote/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(VoteValidator.class)
	public void update() {
		getModel(Vote.class).update();
		redirect("/jf/cms/admin/vote");
	}

	/**
	 * 查看
	 */
	public void view() {
		Vote vote = Vote.dao.findById(getPara());
		setAttr("vote", vote);
		render("/cms/admin/vote/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		VoteService.service.delete(param);
		redirect("/jf/cms/admin/vote");
	}
	
}


