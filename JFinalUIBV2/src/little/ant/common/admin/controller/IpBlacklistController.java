package little.ant.common.admin.controller;

import little.ant.common.admin.service.IpBlacklistService;
import little.ant.common.admin.validator.IpBlacklistValidator;
import little.ant.common.model.IpBlacklist;
import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/admin/ipBlacklist
 * /jf/common/admin/ipBlacklist/save
 * /jf/common/admin/ipBlacklist/edit
 * /jf/common/admin/ipBlacklist/update
 * /jf/common/admin/ipBlacklist/view
 * /jf/common/admin/ipBlacklist/delete
 * /common/admin/ipBlacklist/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/admin/ipBlacklist")
public class IpBlacklistController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IpBlacklistController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		IpBlacklistService.service.list(splitPage);
		render("/common/admin/ipBlacklist/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(IpBlacklistValidator.class)
	public void save() {
		IpBlacklist ipBlacklist = getModel(IpBlacklist.class);
		IpBlacklistService.service.save(ipBlacklist, getCUserIds());
		render("/common/admin/ipBlacklist/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		IpBlacklist ipBlacklist = IpBlacklist.dao.findById(getPara());
		setAttr("ipBlacklist", ipBlacklist);
		render("/common/admin/ipBlacklist/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(IpBlacklistValidator.class)
	public void update() {
		getModel(IpBlacklist.class).update();
		redirect("/jf/common/admin/ipBlacklist");
	}

	/**
	 * 查看
	 */
	public void view() {
		IpBlacklist ipBlacklist = IpBlacklist.dao.findById(getPara());
		setAttr("ipBlacklist", ipBlacklist);
		render("/common/admin/ipBlacklist/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		IpBlacklistService.service.delete(param);
		redirect("/jf/common/admin/ipBlacklist");
	}
	
}


