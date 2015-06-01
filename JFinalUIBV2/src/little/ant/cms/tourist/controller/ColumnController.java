package little.ant.cms.tourist.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.cms.tourist.service.ColumnService;
import little.ant.cms.tourist.validator.ColumnValidator;
import little.ant.cms.model.Column;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/cms/tourist/column
 * /jf/cms/tourist/column/save
 * /jf/cms/tourist/column/edit
 * /jf/cms/tourist/column/update
 * /jf/cms/tourist/column/view
 * /jf/cms/tourist/column/delete
 * /common/column/add.html
 * 
 */
@Controller(controllerKey = "/jf/cms/tourist/column")
public class ColumnController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ColumnController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		ColumnService.service.list(splitPage);
		render("/cms/tourist/column/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(ColumnValidator.class)
	public void save() {
		getModel(Column.class).save();
		render("/cms/tourist/column/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Column column = Column.dao.findById(getPara());
		setAttr("column", column);
		render("/cms/tourist/column/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(ColumnValidator.class)
	public void update() {
		getModel(Column.class).update();
		redirect("/jf/cms/tourist/column");
	}

	/**
	 * 查看
	 */
	public void view() {
		Column column = Column.dao.findById(getPara());
		setAttr("column", column);
		render("/cms/tourist/column/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		String param = (getPara() == null ? ids : getPara());
		ColumnService.service.delete(param);
		redirect("/jf/cms/tourist/column");
	}
	
}


