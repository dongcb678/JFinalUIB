package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Systems;
import little.ant.platform.service.SystemsService;
import little.ant.platform.validator.SystemsValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/platform/systems")
public class SystemsController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SystemsController.class);
	
	public void index() {
		SystemsService.service.list(splitPage);
		render("/platform/systems/list.html");
	}
	
	@Before(SystemsValidator.class)
	public void save() {
		SystemsService.service.save(getModel(Systems.class));
		redirect("/jf/platform/systems");
	}
	
	public void edit() {
		setAttr("systems", Systems.dao.findById(getPara()));
		render("/platform/systems/update.html");
	}
	
	@Before(SystemsValidator.class)
	public void update() {
		getModel(Systems.class).update();
		redirect("/jf/platform/systems");
	}
	
	public void delete() {
		SystemsService.service.delete(getPara());
		redirect("/jf/platform/systems");
	}

}


