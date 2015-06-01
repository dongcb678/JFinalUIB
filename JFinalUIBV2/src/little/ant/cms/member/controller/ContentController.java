package little.ant.cms.member.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.member.service.ContentService;
import little.ant.cms.member.validator.ContentValidator;
import little.ant.cms.model.Content;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/member/content
 * /jf/cms/member/content/save
 * /jf/cms/member/content/edit
 * /jf/cms/member/content/update
 * /jf/cms/member/content/view
 * /jf/cms/member/content/delete
 * /common/content/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/member/content")
public class ContentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ContentController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		ContentService.service.list(splitPage);
		render("/cms/member/content/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(ContentValidator.class)
	public void save() {
		getModel(Content.class).save();
		render("/cms/member/content/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Content content = Content.dao.findById(getPara());
		setAttr("content", content);
		render("/cms/member/content/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(ContentValidator.class)
	public void update() {
		getModel(Content.class).update();
		redirect("/jf/cms/member/content");
	}

	/**
	 * 查看
	 */
	public void view() {
		Content content = Content.dao.findById(getPara());
		setAttr("content", content);
		render("/cms/member/content/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		ContentService.service.delete(param);
		redirect("/jf/cms/member/content");
	}
	
}


