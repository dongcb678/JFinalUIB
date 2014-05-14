package little.ant.pingtai.controller;

import little.ant.pingtai.service.ModuleService;
import little.ant.pingtai.validator.ModuleValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

public class ModuleController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ModuleController.class);
	
	private ModuleService moduleService = new ModuleService();

	private String systemsIds;
	private String pIds;
	private String names;
	private int orderIds;
	
	public void index() {
		render("/pingtai/module/tree.html");
	}
	
	public void treeData()  {
		String jsonText = moduleService.childNodeData(systemsIds, ids);
		renderJson(jsonText);
	}
	
	@Before(ModuleValidator.class)
	public void save() {
		ids = moduleService.save(pIds, names, orderIds);
		renderText(ids);
	}
	
	@Before(ModuleValidator.class)
	public void update() {
		moduleService.update(ids, pIds, names);
		renderText(ids);
	}
	
	public void delete() {
		moduleService.delete(ids);
		renderText(ids);
	}

}


