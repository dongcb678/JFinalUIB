package little.ant.pingtai.plugin;

import java.util.List;

import little.ant.pingtai.annotation.Controller;
import little.ant.pingtai.controller.BaseController;
import little.ant.pingtai.tools.ToolClassSearcher;

import com.jfinal.config.Routes;
import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;

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
		// 查询所有继承BaseController的类
		List<Class<? extends BaseController>> controllerClasses = ToolClassSearcher.of(BaseController.class).search();
//		List<String> jars = new ArrayList<>();
//		jars.add("littleant.jar");
//		ToolClassSearcher.of(BaseController.class).includeAllJarsInLib(true).injars(jars).search();// 可以指定查找jar包，jar名称固定，避免扫描所有文件
		// 循环处理自动注册映射
		for (Class controller : controllerClasses) {
			// 获取注解对象
			Controller controllerBind = (Controller) controller.getAnnotation(Controller.class);
			if (controllerBind == null) {
				log.error(controller.getName() + "继承了BaseController，但是没有注解绑定映射路径");
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
			}
		}
		return true;
	}

	@Override
	public boolean stop() {
		return true;
	}

}
