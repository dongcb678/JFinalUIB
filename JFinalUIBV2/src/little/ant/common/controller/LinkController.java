package little.ant.common.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.common.service.LinkService;
import little.ant.common.validator.LinkValidator;
import little.ant.common.model.Link;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 友情链接管理 管理	
 * 描述：
 */
@Controller(controllerKey = "/jf/common/link")
public class LinkController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LinkController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		LinkService.service.list(splitPage);
		render("/common/link/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(LinkValidator.class)
	public void save() {
		Link link = getModel(Link.class);
		LinkService.service.save(link, getCUserIds());
		render("/common/link/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Link link = Link.dao.findById(getPara());
		setAttr("link", link);
		render("/common/link/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(LinkValidator.class)
	public void update() {
		getModel(Link.class).update();
		redirect("/jf/common/link");
	}

	/**
	 * 查看
	 */
	public void view() {
		Link link = Link.dao.findById(getPara());
		setAttr("link", link);
		render("/common/link/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		LinkService.service.delete(param);
		redirect("/jf/common/link");
	}
	
}


