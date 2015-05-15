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
 * /jf/cms/yellowPage
 * /jf/cms/yellowPage/save
 * /jf/cms/yellowPage/edit
 * /jf/cms/yellowPage/update
 * /jf/cms/yellowPage/view
 * /jf/cms/yellowPage/delete
 * /common/yellowPage/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/yellowPage")
public class YellowPageController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(YellowPageController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		YellowPageService.service.list(splitPage);
		render("/cms/yellowPage/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(YellowPageValidator.class)
	public void save() {
		getModel(YellowPage.class).save();
		render("/cms/yellowPage/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		YellowPage yellowPage = YellowPage.dao.findById(getPara());
		setAttr("yellowPage", yellowPage);
		render("/cms/yellowPage/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(YellowPageValidator.class)
	public void update() {
		getModel(YellowPage.class).update();
		redirect("/jf/cms/yellowPage");
	}

	/**
	 * 查看
	 */
	public void view() {
		YellowPage yellowPage = YellowPage.dao.findById(getPara());
		setAttr("yellowPage", yellowPage);
		render("/cms/yellowPage/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		YellowPageService.service.delete(param);
		redirect("/jf/cms/yellowPage");
	}
	
}


