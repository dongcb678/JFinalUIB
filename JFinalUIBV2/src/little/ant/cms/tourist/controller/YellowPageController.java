package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.YellowPageService;
import little.ant.cms.tourist.validator.YellowPageValidator;
import little.ant.cms.model.YellowPage;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/yellowPage
 * /jf/cms/tourist/yellowPage/save
 * /jf/cms/tourist/yellowPage/edit
 * /jf/cms/tourist/yellowPage/update
 * /jf/cms/tourist/yellowPage/view
 * /jf/cms/tourist/yellowPage/delete
 * /common/yellowPage/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/yellowPage")
public class YellowPageController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(YellowPageController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		YellowPageService.service.list(splitPage);
		render("/cms/tourist/yellowPage/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(YellowPageValidator.class)
	public void save() {
		getModel(YellowPage.class).save();
		render("/cms/tourist/yellowPage/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		YellowPage yellowPage = YellowPage.dao.findById(getPara());
		setAttr("yellowPage", yellowPage);
		render("/cms/tourist/yellowPage/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(YellowPageValidator.class)
	public void update() {
		getModel(YellowPage.class).update();
		redirect("/jf/cms/tourist/yellowPage");
	}

	/**
	 * 查看
	 */
	public void view() {
		YellowPage yellowPage = YellowPage.dao.findById(getPara());
		setAttr("yellowPage", yellowPage);
		render("/cms/tourist/yellowPage/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		YellowPageService.service.delete(param);
		redirect("/jf/cms/tourist/yellowPage");
	}
	
}


