/**
 * Copyright (c) 2011-2017, James Zhan 詹波 (jfinal@126.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.jfinal.core;

import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.InterceptorManager;
import com.jfinal.config.Interceptors;
import com.jfinal.config.Routes;
import com.jfinal.config.Routes.Route;

/**
 * ActionMapping
 */
final class ActionMapping {
	
	private static final String SLASH = "/";
	private Routes routes;
	// private Interceptors interceptors;
	
	private final Map<String, Action> mapping = new HashMap<String, Action>();
	
	ActionMapping(Routes routes, Interceptors interceptors) {
		this.routes = routes;
		// this.interceptors = interceptors;
	}
	
	private Set<String> buildExcludedMethodName() {
		Set<String> excludedMethodName = new HashSet<String>();
		Method[] methods = Controller.class.getMethods();
		for (Method m : methods) {
			if (m.getParameterTypes().length == 0)
				excludedMethodName.add(m.getName());
		}
		return excludedMethodName;
	}
	
	private List<Routes> getRoutesList() {
		List<Routes> routesList = Routes.getRoutesList();
		List<Routes> ret = new ArrayList<Routes>(routesList.size() + 1);
		ret.add(routes);
		ret.addAll(routesList);
		return ret;
	}
	
	void buildActionMapping() {
		mapping.clear();
		Set<String> excludedMethodName = buildExcludedMethodName(); // 需要排除的方法
		InterceptorManager interMan = InterceptorManager.me(); // 拦截器管理类
		for (Routes routes : getRoutesList()) {
		for (Route route : routes.getRouteItemList()) { // 循环已注册路由
			Class<? extends Controller> controllerClass = route.getControllerClass(); // 控制器类
			Interceptor[] controllerInters = interMan.createControllerInterceptor(controllerClass); // 控制器级拦截器
			
			boolean sonOfController = (controllerClass.getSuperclass() == Controller.class); // 是否Controller.class的一级子类
			Method[] methods = (sonOfController ? controllerClass.getDeclaredMethods() : controllerClass.getMethods()); // 如果是，获取类自身声明的所有方法，如果不是，获取类的所有共有方法
			for (Method method : methods) { // 循环处理方法
				String methodName = method.getName(); // 方法名称
				if (excludedMethodName.contains(methodName) || method.getParameterTypes().length != 0) // 如果，包含在排除方法集合中，或者为有参数方法，直接结束
					continue ;
				if (sonOfController && !Modifier.isPublic(method.getModifiers())) // 是Controller.class的一级子类，并且非public方法，直接结束
					continue ;
				
				Interceptor[] actionInters = interMan.buildControllerActionInterceptor(routes.getInterceptors(), controllerInters, controllerClass, method); // action级拦截器
				String controllerKey = route.getControllerKey(); // 路由注册controllerKey
				
				ActionKey ak = method.getAnnotation(ActionKey.class); // 获取ActionKey注解
				String actionKey;
				if (ak != null) {  // 如果存在ActionKey注解，actionkey等于注解值
					actionKey = ak.value().trim();
					if ("".equals(actionKey))
						throw new IllegalArgumentException(controllerClass.getName() + "." + methodName + "(): The argument of ActionKey can not be blank.");
					
					if (!actionKey.startsWith(SLASH))
						actionKey = SLASH + actionKey;
				}
				else if (methodName.equals("index")) { // 如果是index方法，actionKey等于路由注册时的controllerKey
					actionKey = controllerKey;
				}
				else { // actionKey 等于 controllerKey + 方法名
					actionKey = controllerKey.equals(SLASH) ? SLASH + methodName : controllerKey + SLASH + methodName;
				}
				
				// 创建 Action，每个Routes下都有自己的视图基础路径
				Action action = new Action(controllerKey, actionKey, controllerClass, method, methodName, actionInters, route.getFinalViewPath(routes.getBaseViewPath()));
				if (mapping.put(actionKey, action) != null) {
					throw new RuntimeException(buildMsg(actionKey, controllerClass, method));
				}
			}
		}
		}
		routes.clear();
		
		// support url = controllerKey + urlParas with "/" of controllerKey
		Action action = mapping.get("/");
		if (action != null) {
			mapping.put("", action);
		}
	}
	
	private static final String buildMsg(String actionKey, Class<? extends Controller> controllerClass, Method method) {
		StringBuilder sb = new StringBuilder("The action \"")
			.append(controllerClass.getName()).append(".")
			.append(method.getName()).append("()\" can not be mapped, ")
			.append("actionKey \"").append(actionKey).append("\" is already in use.");
		
		String msg = sb.toString();
		System.err.println("\nException: " + msg);
		return msg;
	}
	
	/**
	 * Support four types of url
	 * 1: http://abc.com/controllerKey                 ---> 00
	 * 2: http://abc.com/controllerKey/para            ---> 01
	 * 3: http://abc.com/controllerKey/method          ---> 10
	 * 4: http://abc.com/controllerKey/method/para     ---> 11
	 * The controllerKey can also contains "/"
	 * Example: http://abc.com/uvw/xyz/method/para
	 */
	Action getAction(String url, String[] urlPara) {
		Action action = mapping.get(url);
		if (action != null) {
			return action;
		}
		
		// --------
		int i = url.lastIndexOf(SLASH);
		if (i != -1) {
			action = mapping.get(url.substring(0, i));
			urlPara[0] = url.substring(i + 1);
		}
		
		return action;
	}
	
	List<String> getAllActionKeys() {
		List<String> allActionKeys = new ArrayList<String>(mapping.keySet());
		Collections.sort(allActionKeys);
		return allActionKeys;
	}
}







