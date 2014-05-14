package little.ant.pingtai.controller;

import java.util.List;

import little.ant.pingtai.common.ContextBase;
import little.ant.pingtai.model.Menu;
import little.ant.pingtai.model.Systems;
import little.ant.pingtai.model.User;
import little.ant.pingtai.service.IndexService;

import org.apache.log4j.Logger;

/**
 * 首页处理
 */
public class IndexController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IndexController.class);
	
	private IndexService indexService = new IndexService();

	private List<Systems> systemsList;
	private List<Menu> menuList;
	
	/**
	 * 首页
	 */
	public void index() {
		User user = ContextBase.getCurrentUser(getRequest()); // cookie认证自动登陆处理
		if(null != user){//后台
			systemsList = Systems.dao.find(" select ids, names from pt_systems order by orderids asc ");
			menuList = indexService.menu(ids, user);
			render("/pingtai/index.html");
		}else{
			render("/pingtai/login.html");
		}
	}
	
	/**
	 * 首页content
	 */
	public void content(){
		render("/pingtai/content.html");
	}
	
}
