package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.ControllerBind;
import little.ant.pingtai.model.Systems;
import little.ant.pingtai.service.SystemsService;
import little.ant.pingtai.validator.SystemsValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@ControllerBind(controllerKey = "/jf/systems")
public class SystemsController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SystemsController.class);
	
	private SystemsService systemsService = new SystemsService();
	
	public void index() {
		systemsService.list(splitPage);
		render("/pingtai/systems/list.html");
	}
	
	@Before(SystemsValidator.class)
	public void save() {
		systemsService.save(getModel(Systems.class));
		redirect("/jf/systems");
	}
	
	public void edit() {
		setAttr("systems", Systems.dao.findById(getPara()));
		render("/pingtai/systems/update.html");
	}
	
	@Before(SystemsValidator.class)
	public void update() {
		getModel(Systems.class).update();
		redirect("/jf/systems");
	}
	
	public void delete() {
		systemsService.delete(getPara());
		redirect("/jf/systems");
	}

}


