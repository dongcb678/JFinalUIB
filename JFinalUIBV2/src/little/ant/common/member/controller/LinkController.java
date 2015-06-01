package little.ant.common.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.member.service.LinkService;
import little.ant.common.member.validator.LinkValidator;
import little.ant.common.model.Link;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/common/member/link
 * /jf/common/member/link/save
 * /jf/common/member/link/edit
 * /jf/common/member/link/update
 * /jf/common/member/link/view
 * /jf/common/member/link/delete
 * /common/link/add.html
 * 
 */
@Controller(controllerKey = "/jf/common/member/link")
public class LinkController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LinkController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		LinkService.service.list(splitPage);
		render("/common/member/link/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(LinkValidator.class)
	public void save() {
		getModel(Link.class).save();
		render("/common/member/link/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Link link = Link.dao.findById(getPara());
		setAttr("link", link);
		render("/common/member/link/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(LinkValidator.class)
	public void update() {
		getModel(Link.class).update();
		redirect("/jf/common/member/link");
	}

	/**
	 * 查看
	 */
	public void view() {
		Link link = Link.dao.findById(getPara());
		setAttr("link", link);
		render("/common/member/link/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		LinkService.service.delete(param);
		redirect("/jf/common/member/link");
	}
	
}


