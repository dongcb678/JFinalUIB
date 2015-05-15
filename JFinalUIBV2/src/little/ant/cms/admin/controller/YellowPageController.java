package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.YellowPageService;
import little.ant.cms.admin.validator.YellowPageValidator;
import little.ant.cms.model.YellowPage;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/yellowPage
 * /jf/cms/admin/yellowPage/save
 * /jf/cms/admin/yellowPage/edit
 * /jf/cms/admin/yellowPage/update
 * /jf/cms/admin/yellowPage/view
 * /jf/cms/admin/yellowPage/delete
 * /common/admin/yellowPage/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/yellowPage")
public class YellowPageController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(YellowPageController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		YellowPageService.service.list(splitPage);
		render("/cms/admin/yellowPage/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(YellowPageValidator.class)
	public void save() {
		getModel(YellowPage.class).save();
		render("/cms/admin/yellowPage/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		YellowPage yellowPage = YellowPage.dao.findById(getPara());
		setAttr("yellowPage", yellowPage);
		render("/cms/admin/yellowPage/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(YellowPageValidator.class)
	public void update() {
		getModel(YellowPage.class).update();
		redirect("/jf/cms/admin/yellowPage");
	}

	/**
	 * 查看
	 */
	public void view() {
		YellowPage yellowPage = YellowPage.dao.findById(getPara());
		setAttr("yellowPage", yellowPage);
		render("/cms/admin/yellowPage/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		YellowPageService.service.delete(param);
		redirect("/jf/cms/admin/yellowPage");
	}
	
}


