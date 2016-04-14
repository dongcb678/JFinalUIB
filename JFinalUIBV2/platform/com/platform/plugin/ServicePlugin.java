package com.platform.plugin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.IPlugin;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;
import com.platform.tools.ToolClassSearch;

/**
 * 加载Service实例
 * @author 董华健
 */
public class ServicePlugin implements IPlugin {

    protected static final Logger log = Logger.getLogger(ServicePlugin.class);
    
    /**
     * 存放service实例
     */
	private static final Map<String, BaseService> serviceMap = new HashMap<String, BaseService>();
	
	/**
	 * 获取service实例
	 * @param serviceName
	 * @return
	 */
	public static BaseService getService(String serviceName){
		return serviceMap.get(serviceName);
	}
    
	@SuppressWarnings({ "rawtypes", "unchecked" })
    @Override
    public boolean start() {
    	// 扫描service类
		List<Class<?>> modelClasses = ToolClassSearch.search(BaseService.class);
		modelClasses.add(BaseService.class);
		
		// 循环处理自动注册映射
		for (Class service : modelClasses) {
			// 获取注解对象
			Service serviceBind = (Service) service.getAnnotation(Service.class);
			if (serviceBind == null) {
				log.warn(service.getName() + "继承了BaseModel，但是没有注解绑定表名，请检查是否已经手动绑定 ！！！");
				continue;
			}

			// 获取映射属性
			String name = serviceBind.name().trim();
			if (name.equals("")) {
				log.error(service.getName() + "注解错误，Service name不能为空 ！！！");
				break;
			}

			if (serviceMap.get(name) == null) {
				BaseService baseService = null;
				if(serviceBind.tx()){
					baseService = Enhancer.enhance(service, Tx.class);
				}else{
					baseService = Enhancer.enhance(service);
				}
				serviceMap.put(name, baseService);
				log.debug("Service注册： name = " + name + ", class = " + service.getName());
			}else{
				log.error(service.getName() + "注解错误，Service name重复注册 ！！！");
				break;
			}
		}
		return true;
    }

    @Override
    public boolean stop() {
        return true;
    }
    
}
