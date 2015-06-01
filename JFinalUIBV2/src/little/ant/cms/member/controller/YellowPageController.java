package little.ant.cms.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.member.service.YellowPageService;
import little.ant.cms.member.validator.YellowPageValidator;
import little.ant.cms.model.YellowPage;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/member/yellowPage
 * /jf/cms/member/yellowPage/save
 * /jf/cms/member/yellowPage/edit
 * /jf/cms/member/yellowPage/update
 * /jf/cms/member/yellowPage/view
 * /jf/cms/member/yellowPage/delete
 * /common/yellowPage/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/member/yellowPage")
public class YellowPageController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(YellowPageController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		YellowPageService.service.list(splitPage);
		render("/cms/member/yellowPage/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(YellowPageValidator.class)
	public void save() {
		getModel(YellowPage.class).save();
		render("/cms/member/yellowPage/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		YellowPage yellowPage = YellowPage.dao.findById(getPara());
		setAttr("yellowPage", yellowPage);
		render("/cms/member/yellowPage/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(YellowPageValidator.class)
	public void update() {
		getModel(YellowPage.class).update();
		redirect("/jf/cms/member/yellowPage");
	}

	/**
	 * 查看
	 */
	public void view() {
		YellowPage yellowPage = YellowPage.dao.findById(getPara());
		setAttr("yellowPage", yellowPage);
		render("/cms/member/yellowPage/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		YellowPageService.service.delete(param);
		redirect("/jf/cms/member/yellowPage");
	}
	
}


