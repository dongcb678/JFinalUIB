package little.ant.cms.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.member.service.VoteItemService;
import little.ant.cms.member.validator.VoteItemValidator;
import little.ant.cms.model.VoteItem;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/member/voteItem
 * /jf/cms/member/voteItem/save
 * /jf/cms/member/voteItem/edit
 * /jf/cms/member/voteItem/update
 * /jf/cms/member/voteItem/view
 * /jf/cms/member/voteItem/delete
 * /common/voteItem/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/member/voteItem")
public class VoteItemController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteItemController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		VoteItemService.service.list(splitPage);
		render("/cms/member/voteItem/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(VoteItemValidator.class)
	public void save() {
		getModel(VoteItem.class).save();
		render("/cms/member/voteItem/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		VoteItem voteItem = VoteItem.dao.findById(getPara());
		setAttr("voteItem", voteItem);
		render("/cms/member/voteItem/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(VoteItemValidator.class)
	public void update() {
		getModel(VoteItem.class).update();
		redirect("/jf/cms/member/voteItem");
	}

	/**
	 * 查看
	 */
	public void view() {
		VoteItem voteItem = VoteItem.dao.findById(getPara());
		setAttr("voteItem", voteItem);
		render("/cms/member/voteItem/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		VoteItemService.service.delete(param);
		redirect("/jf/cms/member/voteItem");
	}
	
}


