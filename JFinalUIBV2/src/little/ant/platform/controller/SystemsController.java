package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Systems;
import little.ant.platform.service.SystemsService;
import little.ant.platform.validator.SystemsValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 系统管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/platform/systems")
public class SystemsController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SystemsController.class);
	
	/**
	 * 系统管理列表
	 */
	public void index() {
		SystemsService.service.list(splitPage);
		render("/platform/systems/list.html");
	}
	
	/**
	 * 保存系统
	 */
	@Before(SystemsValidator.class)
	public void save() {
		SystemsService.service.save(getModel(Systems.class));
		redirect("/jf/platform/systems");
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
		redirect("/jf/platform/systems");
	}

	/**
	 * 删除系统
	 */
	public void delete() {
		SystemsService.service.delete(getPara() == null ? ids : getPara());
		redirect("/jf/platform/systems");
	}

}


