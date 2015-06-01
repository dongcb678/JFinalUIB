package little.ant.common.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.tourist.service.IpBlacklistService;
import little.ant.common.tourist.validator.IpBlacklistValidator;
import little.ant.common.model.IpBlacklist;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/tourist/ipBlacklist
 * /jf/common/tourist/ipBlacklist/save
 * /jf/common/tourist/ipBlacklist/edit
 * /jf/common/tourist/ipBlacklist/update
 * /jf/common/tourist/ipBlacklist/view
 * /jf/common/tourist/ipBlacklist/delete
 * /common/ipBlacklist/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/tourist/ipBlacklist")
public class IpBlacklistController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IpBlacklistController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		IpBlacklistService.service.list(splitPage);
		render("/common/tourist/ipBlacklist/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(IpBlacklistValidator.class)
	public void save() {
		getModel(IpBlacklist.class).save();
		render("/common/tourist/ipBlacklist/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		IpBlacklist ipBlacklist = IpBlacklist.dao.findById(getPara());
		setAttr("ipBlacklist", ipBlacklist);
		render("/common/tourist/ipBlacklist/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(IpBlacklistValidator.class)
	public void update() {
		getModel(IpBlacklist.class).update();
		redirect("/jf/common/tourist/ipBlacklist");
	}

	/**
	 * 查看
	 */
	public void view() {
		IpBlacklist ipBlacklist = IpBlacklist.dao.findById(getPara());
		setAttr("ipBlacklist", ipBlacklist);
		render("/common/tourist/ipBlacklist/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		IpBlacklistService.service.delete(param);
		redirect("/jf/common/tourist/ipBlacklist");
	}
	
}


