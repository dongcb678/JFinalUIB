package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.VoteItemService;
import little.ant.cms.tourist.validator.VoteItemValidator;
import little.ant.cms.model.VoteItem;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/voteItem
 * /jf/cms/tourist/voteItem/save
 * /jf/cms/tourist/voteItem/edit
 * /jf/cms/tourist/voteItem/update
 * /jf/cms/tourist/voteItem/view
 * /jf/cms/tourist/voteItem/delete
 * /common/voteItem/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/voteItem")
public class VoteItemController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteItemController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		VoteItemService.service.list(splitPage);
		render("/cms/tourist/voteItem/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(VoteItemValidator.class)
	public void save() {
		getModel(VoteItem.class).save();
		render("/cms/tourist/voteItem/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		VoteItem voteItem = VoteItem.dao.findById(getPara());
		setAttr("voteItem", voteItem);
		render("/cms/tourist/voteItem/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(VoteItemValidator.class)
	public void update() {
		getModel(VoteItem.class).update();
		redirect("/jf/cms/tourist/voteItem");
	}

	/**
	 * 查看
	 */
	public void view() {
		VoteItem voteItem = VoteItem.dao.findById(getPara());
		setAttr("voteItem", voteItem);
		render("/cms/tourist/voteItem/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		VoteItemService.service.delete(param);
		redirect("/jf/cms/tourist/voteItem");
	}
	
}


