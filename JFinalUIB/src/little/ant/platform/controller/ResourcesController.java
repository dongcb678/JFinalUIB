package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.service.ResourcesService;
import little.ant.platform.thread.ThreadParamInit;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Controller(controllerKey = "/jf/platform/resources")
public class ResourcesController extends BaseController {
	
	private static Logger log = Logger.getLogger(ResourcesController.class);

	/**
	 * 首页
	 */
	public void index(){;
		setAttrs(ResourcesService.service.pv());
		setAttrs(ResourcesService.service.getResources());
		render("/platform/resources/index.html");
	}
	
	/**
	 * 刷新参数缓存
	 */
	public void refreshParamCache(){
		new ThreadParamInit().start();
	}
	
}
