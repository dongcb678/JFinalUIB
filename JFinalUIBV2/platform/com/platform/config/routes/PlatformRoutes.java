package com.platform.config.routes;

import com.jfinal.config.Routes;
import com.platform.mvc.dept.DepartmentController;
import com.platform.mvc.dict.DictController;
import com.platform.mvc.group.GroupController;
import com.platform.mvc.image.AuthImgController;
import com.platform.mvc.image.ImageController;
import com.platform.mvc.index.IndexController;
import com.platform.mvc.login.LoginController;
import com.platform.mvc.menu.MenuController;
import com.platform.mvc.module.ModuleController;
import com.platform.mvc.operator.OperatorController;
import com.platform.mvc.param.ParamController;
import com.platform.mvc.resources.ResourcesController;
import com.platform.mvc.role.RoleController;
import com.platform.mvc.station.StationController;
import com.platform.mvc.syslog.SysLogController;
import com.platform.mvc.systems.SystemsController;
import com.platform.mvc.test.TestController;
import com.platform.mvc.ueditor.UeditorController;
import com.platform.mvc.upload.UploadController;
import com.platform.mvc.user.UserController;

/**
 * 平台路由
 */
public class PlatformRoutes extends Routes {

	@Override
	public void config() {
		add("/jf/platform/login", LoginController.class);
		
		add("/jf/platform/", IndexController.class);
		add("/jf/platform/index", IndexController.class);

		add("/jf/platform/user", UserController.class);
		add("/jf/platform/dept", DepartmentController.class);
		add("/jf/platform/group", GroupController.class);
		add("/jf/platform/role", RoleController.class);
		add("/jf/platform/station", StationController.class);
		add("/jf/platform/operator", OperatorController.class);
		add("/jf/platform/module", ModuleController.class);
		add("/jf/platform/systems", SystemsController.class);
		add("/jf/platform/menu", MenuController.class);
		
		add("/jf/platform/dict", DictController.class);
		add("/jf/platform/param", ParamController.class);
		add("/jf/platform/sysLog", SysLogController.class);
		add("/jf/platform/resources", ResourcesController.class);

		add("/jf/platform/upload", UploadController.class);
		add("/jf/platform/image", ImageController.class);
		add("/jf/platform/authImg", AuthImgController.class);
		add("/jf/platform/ueditor", UeditorController.class);
		add("/jf/platform/test", TestController.class);
	}

}
