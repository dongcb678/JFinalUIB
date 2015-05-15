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
 * /jf/cms/admin/library
 * /jf/cms/admin/library/save
 * /jf/cms/admin/library/edit
 * /jf/cms/admin/library/update
 * /jf/cms/admin/library/view
 * /jf/cms/admin/library/delete
 * /common/admin/library/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/library")
public class LibraryController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LibraryController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		LibraryService.service.list(splitPage);
		render("/cms/admin/library/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(LibraryValidator.class)
	public void save() {
		getModel(Library.class).save();
		render("/cms/admin/library/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Library library = Library.dao.findById(getPara());
		setAttr("library", library);
		render("/cms/admin/library/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(LibraryValidator.class)
	public void update() {
		getModel(Library.class).update();
		redirect("/jf/cms/admin/library");
	}

	/**
	 * 查看
	 */
	public void view() {
		Library library = Library.dao.findById(getPara());
		setAttr("library", library);
		render("/cms/admin/library/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		LibraryService.service.delete(param);
		redirect("/jf/cms/admin/library");
	}
	
}


