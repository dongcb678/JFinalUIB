package little.ant.pingtai.controller;

import little.ant.pingtai.annotation.ControllerBind;
import little.ant.pingtai.service.ResourcesService;

import org.apache.log4j.Logger;

@ControllerBind(controllerKey = "/jf/resources")
public class ResourcesController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ResourcesController.class);
	
	private ResourcesService resourcesService = new ResourcesService();
	
	
	
}
