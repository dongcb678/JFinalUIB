package little.ant.pingtai.controller;

import java.util.List;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.model.MenuModel;
import little.ant.pingtai.model.SystemsModel;
import little.ant.pingtai.model.UserModel;
import little.ant.pingtai.service.IndexService;
import little.ant.pingtai.service.ResourcesService;
import little.ant.pingtai.tools.ToolContext;
import little.ant.pingtai.tools.ToolSqlXml;

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

	private List<SystemsModel> systemsList;
	private List<MenuModel> menuList;
	
	/**
	 * 首页
	 */
	public void index() {
		UserModel user = ToolContext.getCurrentUser(getRequest(), true); // cookie认证自动登陆处理
		if(null != user){//后台
			String sql = ToolSqlXml.getSql("pingtai.systems.all");
			systemsList = SystemsModel.dao.find(sql);
			if(null == ids || ids.isEmpty()){ // 默认系统
				ids = "8a40c0353fa828a6013fa898d4ac0020";
			}
			menuList = indexService.menu(ids, user, getI18nPram());
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
