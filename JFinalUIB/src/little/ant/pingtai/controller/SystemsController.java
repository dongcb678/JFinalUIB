package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.Systems;
import little.ant.pingtai.service.SystemsService;
import little.ant.pingtai.validator.SystemsValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/systems")
public class SystemsController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SystemsController.class);
	
	public void index() {
		SystemsService.service.list(splitPage);
		render("/pingtai/systems/list.html");
	}
	
	@Before(SystemsValidator.class)
	public void save() {
		SystemsService.service.save(getModel(Systems.class));
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
		SystemsService.service.delete(getPara());
		redirect("/jf/systems");
	}

}


