package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.plugin.ParamInitPlugin;
import little.ant.platform.plugin.SqlXmlPlugin;
import little.ant.platform.service.ResourcesService;

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
		new ParamInitPlugin().start();
		redirect("/jf/platform/resources");
	}

	/**
	 * 刷新Sql缓存，重新加载Sql XML
	 */
	public void refreshSqlCache(){
		SqlXmlPlugin.init(false);
		redirect("/jf/platform/resources");
	}
	
}
