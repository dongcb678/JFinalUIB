package little.ant.platform.plugin;

import java.util.List;

import com.jfinal.config.Routes;
import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;

import little.ant.platform.annotation.Controller;
import little.ant.platform.controller.BaseController;
import little.ant.platform.tools.ToolClassSearch;

/**
 * 扫描Controller上的注解，绑定Controller和controllerKey
 * @author 董华健
 */
public class ControllerPlugin implements IPlugin {

    protected final Logger log = Logger.getLogger(getClass());
    
    private Routes me;

	public ControllerPlugin(Routes me){
		this.me = me;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public boolean start() {
		// 查询所有继承BaseController的子类
		List<Class<?>> controllerClasses = ToolClassSearch.search(BaseController.class);

		// 循环处理自动注册映射
		for (Class controller : controllerClasses) {
			// 获取注解对象
			Controller controllerBind = (Controller) controller.getAnnotation(Controller.class);
			if (controllerBind == null) {
				log.warn(controller.getName() + "继承了BaseController，但是没有注解绑定映射路径");
				continue;
			}

			// 获取映射路径数组
			String[] controllerKeys = controllerBind.controllerKey();
			for (String controllerKey : controllerKeys) {
				controllerKey = controllerKey.trim();
				if(controllerKey.equals("")){
					log.error(controller.getName() + "注解错误，映射路径为空");
					continue;
				}
				// 注册映射
				me.add(controllerKey, controller);
				log.debug("Controller注册： controller = " + controller + ", controllerKey = " + controllerKey);
			}
		}
		return true;
	}

	@Override
	public boolean stop() {
		return true;
	}

}
