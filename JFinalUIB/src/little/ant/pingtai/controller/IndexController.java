package little.ant.pingtai.controller;

import java.util.List;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.Menu;
import little.ant.pingtai.model.Systems;
import little.ant.pingtai.model.User;
import little.ant.pingtai.service.IndexService;
import little.ant.pingtai.service.ResourcesService;
import little.ant.pingtai.tools.ToolContext;

import org.apache.log4j.Logger;

/**
 * 首页处理
 */
@SuppressWarnings("unused")
@Controller(controllerKey = {"/jf/", "/jf/index"})
public class IndexController extends BaseController {

	private static Logger log = Logger.getLogger(IndexController.class);
	
	private IndexService indexService = new IndexService();
	private ResourcesService resourcesService = new ResourcesService();

	private List<Systems> systemsList;
	private List<Menu> menuList;
	
	/**
	 * 首页
	 */
	public void index() {
		User user = ToolContext.getCurrentUser(getRequest()); // cookie认证自动登陆处理
		if(null != user){//后台
			systemsList = Systems.dao.find(" select ids, names from pt_systems order by orderids asc ");
			if(null == ids || ids.isEmpty()){ // 默认系统
				ids = "8a40c0353fa828a6013fa898d4ac0020";
			}
			menuList = indexService.menu(ids, user);
			render("/pingtai/index.html");
		}else{
			render("/pingtai/login.html");
		}
	}
	
	/**
	 * 首页content
	 */
	public void content(){;
		setAttrs(resourcesService.pv());
		setAttrs(resourcesService.getResources());
		render("/pingtai/content.html");
	}
	
}
