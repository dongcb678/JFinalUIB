package little.ant.platform.controller;

import java.util.List;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Menu;
import little.ant.platform.model.Systems;
import little.ant.platform.model.User;
import little.ant.platform.service.IndexService;
import little.ant.platform.service.ResourcesService;
import little.ant.platform.tools.ToolContext;
import little.ant.platform.tools.ToolSqlXml;

import org.apache.log4j.Logger;

/**
 * 首页处理
 */
@SuppressWarnings("unused")
@Controller(controllerKey = {"/jf/platform/", "/jf/platform/index"})
public class IndexController extends BaseController {

	private static Logger log = Logger.getLogger(IndexController.class);
	
	private List<Systems> systemsList; // 系统列表
	private List<Menu> menuList; // 菜单列表
	
	/**
	 * 首页
	 */
	public void index() {
		User user = ToolContext.getCurrentUser(getRequest(), true); // cookie认证自动登陆处理
		if(null != user){//后台
			String sql = ToolSqlXml.getSql("platform.systems.all");
			systemsList = Systems.dao.find(sql);
			if(null == ids || ids.isEmpty()){ // 默认系统
				ids = "8a40c0353fa828a6013fa898d4ac0020";
			}
			menuList = IndexService.service.menu(ids, user, getI18nPram());
			render("/platform/index/index.html");
		}else{
			render("/platform/login/login.html");
		}
	}
	
	/**
	 * 首页content
	 */
	public void content(){;
		setAttrs(ResourcesService.service.pv());
		setAttrs(ResourcesService.service.getResources());
		render("/platform/index/content.html");
	}
	
}
