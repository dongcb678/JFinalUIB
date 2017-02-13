package com.platform.config;

import java.util.Set;

import com.jfinal.config.Routes;
import com.jfinal.kit.StrKit;
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
		// setBaseViewPath("/platform"); // 设置视图模板公共路径，值针对当前Routes，每个Routes调用设置完全独立
		
		// 查询所有继承BaseController的子类
		Set<Class<?>> controllerClasses = ToolClassSearch.searchByClassLoader(BaseController.class);
		
		// 循环处理自动注册映射
		for (Class controller : controllerClasses) {
			// 获取注解对象
			Controller controllerBind = (Controller) controller.getAnnotation(Controller.class);
			if (controllerBind == null) {
				if(log.isWarnEnabled()) log.warn(controller.getName() + "继承了BaseController，但是没有注解绑定映射路径，请检查是否已经手动绑定 ！！！");
				throw new RuntimeException(controller.getName() + "继承了BaseController，但是没有注解绑定映射路径，请检查是否已经手动绑定 ！！！");
			}

			// 获取映射路径数组
			String[] controllerKeys = controllerBind.value();
			String viewPath = controllerBind.viewPath();
			for (String controllerKey : controllerKeys) {
				controllerKey.trim();
				if (controllerKey.equals("")) {
					if(log.isErrorEnabled()) log.error(controller.getName() + "注解错误，映射路径为空");
					throw new RuntimeException(controller.getName() + "注解错误，映射路径为空");
				}
				// 注册映射
				if(StrKit.notBlank(viewPath)){
					add(controllerKey, controller, viewPath);
				}else{
					add(controllerKey, controller);
				}
				if(log.isDebugEnabled()) log.debug("Controller注册： controller = " + controller + ", " + controllerKey);
			}
		}
	}

}
