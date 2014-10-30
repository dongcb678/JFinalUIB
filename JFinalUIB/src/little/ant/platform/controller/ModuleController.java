package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.service.ModuleService;
import little.ant.platform.validator.ModuleValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/module")
public class ModuleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ModuleController.class);
	
	private String systemsIds;
	private String pIds;
	private String names;
	private int orderIds;
	
	public void index() {
		render("/pingtai/module/tree.html");
	}
	
	public void treeData()  {
		String jsonText = ModuleService.service.childNodeData(systemsIds, ids);
		renderJson(jsonText);
	}
	
	@Before(ModuleValidator.class)
	public void save() {
		ids = ModuleService.service.save(pIds, names, orderIds);
		renderText(ids);
	}
	
	@Before(ModuleValidator.class)
	public void update() {
		ModuleService.service.update(ids, pIds, names);
		renderText(ids);
	}
	
	public void delete() {
		ModuleService.service.delete(ids);
		renderText(ids);
	}

}


