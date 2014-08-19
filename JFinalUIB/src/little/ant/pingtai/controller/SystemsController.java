package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.SystemsModel;
import little.ant.pingtai.service.SystemsService;
import little.ant.pingtai.validator.SystemsValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/systems")
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
		systemsService.save(getModel(SystemsModel.class));
		redirect("/jf/systems");
	}
	
	public void edit() {
		setAttr("systems", SystemsModel.dao.findById(getPara()));
		render("/pingtai/systems/update.html");
	}
	
	@Before(SystemsValidator.class)
	public void update() {
		getModel(SystemsModel.class).update();
		redirect("/jf/systems");
	}
	
	public void delete() {
		systemsService.delete(getPara());
		redirect("/jf/systems");
	}

}


