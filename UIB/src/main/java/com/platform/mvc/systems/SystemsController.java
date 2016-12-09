package com.platform.mvc.systems;

import com.jfinal.aop.Before;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.base.BaseModel;

/**
 * 系统管理
 * @author 董华健
 */
@Controller("/platform/systems")
public class SystemsController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(SystemsController.class);
	
	private SystemsService systemsService;
	
	/**
	 * 系统管理列表
	 */
	public void index() {
		paging(splitPage, BaseModel.sqlId_splitPageSelect, Systems.sqlId_splitPageFrom);
		render("/platform/systems/list.html");
	}
	
	/**
	 * 保存系统
	 */
	@Before(SystemsValidator.class)
	public void save() {
		systemsService.save(getModel(Systems.class));
		forwardAction("/platform/systems/backOff");
	}

	/**
	 * 准备更新系统
	 */
	public void edit() {
		setAttr("systems", Systems.dao.findById(getPara()));
		render("/platform/systems/update.html");
	}

	/**
	 * 更新系统
	 */
	@Before(SystemsValidator.class)
	public void update() {
		getModel(Systems.class).update();
		forwardAction("/platform/systems/backOff");
	}

	/**
	 * 删除系统
	 */
	public void delete() {
		systemsService.delete(getPara() == null ? ids : getPara());
		forwardAction("/platform/systems/backOff");
	}

}


