package little.ant.common.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.member.service.IpBlacklistService;
import little.ant.common.member.validator.IpBlacklistValidator;
import little.ant.common.model.IpBlacklist;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/member/ipBlacklist
 * /jf/common/member/ipBlacklist/save
 * /jf/common/member/ipBlacklist/edit
 * /jf/common/member/ipBlacklist/update
 * /jf/common/member/ipBlacklist/view
 * /jf/common/member/ipBlacklist/delete
 * /common/ipBlacklist/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/member/ipBlacklist")
public class IpBlacklistController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IpBlacklistController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		IpBlacklistService.service.list(splitPage);
		render("/common/member/ipBlacklist/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(IpBlacklistValidator.class)
	public void save() {
		getModel(IpBlacklist.class).save();
		render("/common/member/ipBlacklist/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		IpBlacklist ipBlacklist = IpBlacklist.dao.findById(getPara());
		setAttr("ipBlacklist", ipBlacklist);
		render("/common/member/ipBlacklist/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(IpBlacklistValidator.class)
	public void update() {
		getModel(IpBlacklist.class).update();
		redirect("/jf/common/member/ipBlacklist");
	}

	/**
	 * 查看
	 */
	public void view() {
		IpBlacklist ipBlacklist = IpBlacklist.dao.findById(getPara());
		setAttr("ipBlacklist", ipBlacklist);
		render("/common/member/ipBlacklist/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		IpBlacklistService.service.delete(param);
		redirect("/jf/common/member/ipBlacklist");
	}
	
}


