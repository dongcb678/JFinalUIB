package com.platform.run;

import java.util.List;

import com.jfinal.config.Routes;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;
import com.platform.tools.ToolClassSearch;

/**
 * 扫描Controller上的注解，绑定Controller和controllerKey
 * 
 * @author 董华健 dongcb678@163.com
 */
public class RoutesScan extends Routes {

	private static final Log log = Log.getLog(RoutesScan.class);

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void config() {
		// 查询所有继承BaseController的子类
		List<Class<?>> controllerClasses = ToolClassSearch.search(BaseController.class);

		// 循环处理自动注册映射
		for (Class controller : controllerClasses) {
			// 获取注解对象
			Controller controllerBind = (Controller) controller.getAnnotation(Controller.class);
			if (controllerBind == null) {
				log.warn(controller.getName() + "继承了BaseController，但是没有注解绑定映射路径，请检查是否已经手动绑定 ！！！");
				throw new RuntimeException(controller.getName() + "继承了BaseController，但是没有注解绑定映射路径，请检查是否已经手动绑定 ！！！");
			}

			// 获取映射路径数组
			String[] controllerKeys = controllerBind.value();
			for (String controllerKey : controllerKeys) {
				controllerKey.trim();
				if (controllerKey.equals("")) {
					log.error(controller.getName() + "注解错误，映射路径为空");
					throw new RuntimeException(controller.getName() + "注解错误，映射路径为空");
				}
				// 注册映射
				add(controllerKey, controller);
				log.debug("Controller注册： controller = " + controller + ", " + controllerKey);
			}
		}
	}

}
