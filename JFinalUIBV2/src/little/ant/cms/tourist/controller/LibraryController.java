package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.LibraryService;
import little.ant.cms.tourist.validator.LibraryValidator;
import little.ant.cms.model.Library;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/library
 * /jf/cms/tourist/library/save
 * /jf/cms/tourist/library/edit
 * /jf/cms/tourist/library/update
 * /jf/cms/tourist/library/view
 * /jf/cms/tourist/library/delete
 * /common/library/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/library")
public class LibraryController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LibraryController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		LibraryService.service.list(splitPage);
		render("/cms/tourist/library/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(LibraryValidator.class)
	public void save() {
		getModel(Library.class).save();
		render("/cms/tourist/library/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Library library = Library.dao.findById(getPara());
		setAttr("library", library);
		render("/cms/tourist/library/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(LibraryValidator.class)
	public void update() {
		getModel(Library.class).update();
		redirect("/jf/cms/tourist/library");
	}

	/**
	 * 查看
	 */
	public void view() {
		Library library = Library.dao.findById(getPara());
		setAttr("library", library);
		render("/cms/tourist/library/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		LibraryService.service.delete(param);
		redirect("/jf/cms/tourist/library");
	}
	
}


