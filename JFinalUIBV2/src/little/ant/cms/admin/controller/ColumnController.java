package little.ant.cms.admin.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.admin.service.ColumnService;
import little.ant.cms.admin.validator.ColumnValidator;
import little.ant.cms.model.Column;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/admin/column
 * /jf/cms/admin/column/save
 * /jf/cms/admin/column/edit
 * /jf/cms/admin/column/update
 * /jf/cms/admin/column/view
 * /jf/cms/admin/column/delete
 * /common/admin/column/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/admin/column")
public class ColumnController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ColumnController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		ColumnService.service.list(splitPage);
		render("/cms/admin/column/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(ColumnValidator.class)
	public void save() {
		getModel(Column.class).save();
		render("/cms/admin/column/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Column column = Column.dao.findById(getPara());
		setAttr("column", column);
		render("/cms/admin/column/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(ColumnValidator.class)
	public void update() {
		getModel(Column.class).update();
		redirect("/jf/cms/admin/column");
	}

	/**
	 * 查看
	 */
	public void view() {
		Column column = Column.dao.findById(getPara());
		setAttr("column", column);
		render("/cms/admin/column/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		ColumnService.service.delete(param);
		redirect("/jf/cms/admin/column");
	}
	
}


