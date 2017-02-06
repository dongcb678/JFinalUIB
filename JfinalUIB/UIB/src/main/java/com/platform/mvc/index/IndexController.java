package com.platform.mvc.index;

import java.util.List;

import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.menu.Menu;
import com.platform.mvc.resources.ResourcesService;
import com.platform.mvc.systems.Systems;
import com.platform.mvc.user.User;

/**
 * 首页处理
 */
@SuppressWarnings("unused")
@Controller({"/platform/", "/platform/index"})
public class IndexController extends BaseController {

	private static final Log log = Log.getLog(IndexController.class);
	
	private IndexService indexService;
	private ResourcesService resourcesService;
	
	private List<Systems> systemsList; // 系统列表
	private List<Menu> menuList; // 菜单列表
	
	/**
	 * 首页
	 */
	public void index() {
		User user = getCUser(); // cookie认证自动登陆处理
		if(null != user){//后台
			String sql = getSqlMy(Systems.sqlId_all);
			systemsList = Systems.dao.find(sql);
			if(StrKit.isBlank(ids)){
				ids = systemsList.get(0).getPKValue(); // 默认系统
			}
			menuList = indexService.menu(ids, user, geti18nColumnSuffix());
			render("/platform/index/index.html");
		}else{
			render("/platform/login/login.html");
		}
	}
	
	/**
	 * 首页content
	 */
	public void content(){;
		setAttrs(resourcesService.pv());
		setAttrs(resourcesService.getResources());
		render("/platform/index/content.html");
	}
	
}
