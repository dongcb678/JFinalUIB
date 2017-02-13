package com.platform.plugin;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.jfinal.aop.Enhancer;
import com.jfinal.log.Log;
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

	private static final Log log = Log.getLog(ServicePlugin.class);

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
		// 1.扫描所有继承BaseService的类
		Set<Class<?>> modelClasses = ToolClassSearch.searchByClassLoader(BaseService.class);
		modelClasses.add(BaseService.class); // 加入BaseService本身
		
		// 2.循环处理Service实例化
		for (Class serviceClass : modelClasses) {
			// 获取Service注解对象
			Service serviceBind = (Service) serviceClass.getAnnotation(Service.class);
			if (serviceBind == null) {
				if(log.isWarnEnabled()) log.warn(serviceClass.getName() + "继承了BaseService，但是没有注解绑定 ！！！");
				throw new RuntimeException(serviceClass.getName() + "继承了BaseService，但是没有注解绑定 ！！！");
			}
		
			// 获取Service注解属性
			String name = serviceBind.name().trim();
			if (name.equals("")) {
				if(log.isErrorEnabled()) log.error(serviceClass.getName() + "注解错误，name不能为空 ！！！");
				throw new RuntimeException(serviceClass.getName() + "注解错误，name不能为空 ！！！");
			}
		
			if (serviceMap.get(name) == null) {
				BaseService baseService = null;
				// 是否需要对service中的所有方法开启事务管理
				if(serviceBind.tx()){
					baseService = (BaseService) Enhancer.enhance(serviceClass, Tx.class); 	// 是
				}else{
					try {
						baseService = (BaseService) serviceClass.newInstance(); //Enhancer.enhance(service);	// 否
					} catch (InstantiationException  e) {
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					}
				}
				serviceMap.put(name, baseService);
				if(log.isDebugEnabled()) log.debug("Service注册： name = " + name + ", class = " + serviceClass.getName());
			}else{
				if(log.isErrorEnabled()) log.error(serviceClass.getName() + "注解错误，Service name重复注册 ！！！");
				throw new RuntimeException(serviceClass.getName() + "注解错误，Service name重复注册 ！！！");
			}
		}
		
		// 3.循环处理Service相互注入
		for (Class serviceClass : modelClasses) {
			// 获取Service注解对象
			Service serviceBind = (Service) serviceClass.getAnnotation(Service.class);
			
			// 获取Service注解属性
			String serviceName = serviceBind.name().trim();
			
			// 获取Service实例
			BaseService myService = ServicePlugin.getService(serviceName); 
			
			// 查找成员变量
			Field[] parentFields = serviceClass.getDeclaredFields();
			for (Field field : parentFields) {
				try {
					field.setAccessible(true);
					String name = field.getName();
					// 是否service类型成员变量
					if(BaseService.class.isAssignableFrom(field.getType())){
						// 获取目标Service实例
						BaseService targetService = ServicePlugin.getService(name); 
						// 注入目标service实例
						field.set(myService, targetService);
					}
				} catch (IllegalArgumentException e1) {
					e1.printStackTrace();
				} catch (IllegalAccessException e1) {
					e1.printStackTrace();
				} catch (Exception e1) {
					e1.printStackTrace();
				} finally {
					field.setAccessible(false);
				}
			}
		}
		
		return true;
    }

    @Override
    public boolean stop() {
        return true;
    }
    
}
