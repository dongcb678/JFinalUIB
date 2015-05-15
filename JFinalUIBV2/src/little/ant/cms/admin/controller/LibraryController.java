package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.LibraryService;
import little.ant.cms.admin.validator.LibraryValidator;
import little.ant.cms.model.Library;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/library
 * /jf/cms/library/save
 * /jf/cms/library/edit
 * /jf/cms/library/update
 * /jf/cms/library/view
 * /jf/cms/library/delete
 * /common/library/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/library")
public class LibraryController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LibraryController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		LibraryService.service.list(splitPage);
		render("/cms/library/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(LibraryValidator.class)
	public void save() {
		getModel(Library.class).save();
		render("/cms/library/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Library library = Library.dao.findById(getPara());
		setAttr("library", library);
		render("/cms/library/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(LibraryValidator.class)
	public void update() {
		getModel(Library.class).update();
		redirect("/jf/cms/library");
	}

	/**
	 * 查看
	 */
	public void view() {
		Library library = Library.dao.findById(getPara());
		setAttr("library", library);
		render("/cms/library/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		LibraryService.service.delete(param);
		redirect("/jf/cms/library");
	}
	
}


