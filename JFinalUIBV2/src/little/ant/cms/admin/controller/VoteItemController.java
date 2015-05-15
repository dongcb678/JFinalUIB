package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.VoteItemService;
import little.ant.cms.admin.validator.VoteItemValidator;
import little.ant.cms.model.VoteItem;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/voteItem
 * /jf/cms/admin/voteItem/save
 * /jf/cms/admin/voteItem/edit
 * /jf/cms/admin/voteItem/update
 * /jf/cms/admin/voteItem/view
 * /jf/cms/admin/voteItem/delete
 * /common/admin/voteItem/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/voteItem")
public class VoteItemController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteItemController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		VoteItemService.service.list(splitPage);
		render("/cms/admin/voteItem/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(VoteItemValidator.class)
	public void save() {
		getModel(VoteItem.class).save();
		render("/cms/admin/voteItem/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		VoteItem voteItem = VoteItem.dao.findById(getPara());
		setAttr("voteItem", voteItem);
		render("/cms/admin/voteItem/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(VoteItemValidator.class)
	public void update() {
		getModel(VoteItem.class).update();
		redirect("/jf/cms/admin/voteItem");
	}

	/**
	 * 查看
	 */
	public void view() {
		VoteItem voteItem = VoteItem.dao.findById(getPara());
		setAttr("voteItem", voteItem);
		render("/cms/admin/voteItem/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		VoteItemService.service.delete(param);
		redirect("/jf/cms/admin/voteItem");
	}
	
}


