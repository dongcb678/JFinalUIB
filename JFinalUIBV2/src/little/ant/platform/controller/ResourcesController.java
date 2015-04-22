package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.service.ResourcesService;
import little.ant.platform.thread.ThreadParamInit;
import little.ant.platform.tools.ToolSqlXml;

import org.apache.log4j.Logger;

/**
 * 资源监控
 * @author 董华健
 */
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
	 * 刷新参数缓存，重新加载系统初始化参数
	 */
	public void refreshParamCache(){
		ThreadParamInit.cacheAll();
		redirect("/jf/platform/resources");
	}

	/**
	 * 刷新Sql缓存，重新加载Sql XML
	 */
	public void refreshSqlCache(){
		ToolSqlXml.init(false);
		redirect("/jf/platform/resources");
	}
	
}
