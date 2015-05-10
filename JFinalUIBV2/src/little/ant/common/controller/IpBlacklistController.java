package little.ant.common.controller;

import little.ant.common.model.IpBlacklist;
import little.ant.common.service.IpBlacklistService;
import little.ant.common.validator.IpBlacklistValidator;
import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/ipBlacklist
 * /jf/common/ipBlacklist/save
 * /jf/common/ipBlacklist/edit
 * /jf/common/ipBlacklist/update
 * /jf/common/ipBlacklist/view
 * /jf/common/ipBlacklist/delete
 * /common/ipBlacklist/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/ipBlacklist")
public class IpBlacklistController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IpBlacklistController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		IpBlacklistService.service.list(splitPage);
		render("/common/ipBlacklist/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(IpBlacklistValidator.class)
	public void save() {
		IpBlacklist ipBlacklist = getModel(IpBlacklist.class);
		IpBlacklistService.service.save(ipBlacklist, getCUserIds());
		render("/common/ipBlacklist/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		IpBlacklist ipBlacklist = IpBlacklist.dao.findById(getPara());
		setAttr("ipBlacklist", ipBlacklist);
		render("/common/ipBlacklist/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(IpBlacklistValidator.class)
	public void update() {
		getModel(IpBlacklist.class).update();
		redirect("/jf/common/ipBlacklist");
	}

	/**
	 * 查看
	 */
	public void view() {
		IpBlacklist ipBlacklist = IpBlacklist.dao.findById(getPara());
		setAttr("ipBlacklist", ipBlacklist);
		render("/common/ipBlacklist/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		IpBlacklistService.service.delete(param);
		redirect("/jf/common/ipBlacklist");
	}
	
}


