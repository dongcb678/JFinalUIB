package com.platform.run;

import com.jfinal.config.Routes;
import com.weixin.mvc.group.GroupController;
import com.weixin.mvc.index.IndexController;
import com.weixin.mvc.keyword.KeywordController;
import com.weixin.mvc.location.LocationController;
import com.weixin.mvc.message.MessageController;

/**
 * 微信路由
 */
public class WeiXinRoutes extends Routes {

	@Override
	public void config() {
		add("/jf/wx/index", IndexController.class);
		add("/jf/wx/group", GroupController.class);
		add("/jf/wx/keyword", KeywordController.class);
		add("/jf/wx/location", LocationController.class);
		add("/jf/wx/message", MessageController.class);
	}

}
