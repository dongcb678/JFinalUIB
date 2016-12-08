package com.platform.mvc.resources;

import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;
import com.platform.plugin.ParamInitPlugin;
import com.platform.plugin.SqlXmlPlugin;

/**
 * 资源监控
 * @author 董华健
 */
@SuppressWarnings("unused")
@Controller("/platform/resources")
public class ResourcesController extends BaseController {
	
	private static final Log log = Log.getLog(ResourcesController.class);

	private ResourcesService resourcesService;
	
	/**
	 * 首页
	 */
	public void index(){;
		setAttrs(resourcesService.pv());
		setAttrs(resourcesService.getResources());
		render("/platform/resources/index.html");
	}
	
	/**
	 * 刷新参数缓存，重新加载系统初始化参数
	 */
	public void refreshParamCache(){
		new ParamInitPlugin().start();
		redirect("/platform/resources");
	}

	/**
	 * 刷新Sql缓存，重新加载Sql XML
	 */
	public void refreshSqlCache(){
		SqlXmlPlugin.initByClassLoader(false);
		redirect("/platform/resources");
	}
	
}
