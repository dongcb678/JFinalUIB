package com.platform.tools;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.core.Injector;
import com.jfinal.kit.StrKit;
import com.platform.mvc.base.BaseModel;

/**
 * 表单数组映射List<Model>
 * 
 * @author 董华健  dongcb678@163.com
 *
 * 描述：
 * 		表单	
 *		<input type="hidden" name="groupList[0].ids" value="111"/>
 *		<input type="text" name="groupList[0].names" value="222"/>
 *		
 *		<input type="hidden" name="groupList[1].ids" value="333"/>
 *		<input type="text" name="groupList[1].names" value="444"/>
 *		
 *		<input type="hidden" name="groupList[3].ids" value="555"/>
 *		<input type="text" name="groupList[3].names" value="666"/>
 * 
 * 		调用方法 
 * 		List<Group> groupList = ToolModelInjector.injectModels(getRequest(), Group.class, "groupList");
 * 		List<Group> groupList = ToolModelInjector.injectModels(getRequest(), Group.class); // 默认的prefix是Model类的首字母小写加上List
 */
public class ToolModelInjector {
	
	/**
	 * 将页面中的数组对象转换成List
	 * @param request
	 * @param modelClass model类
	 * @return
	 */
	public static <T extends BaseModel<T>> List<T> injectModels(final HttpServletRequest request, Class<? extends T> modelClass) {
		String modelName = modelClass.getSimpleName();
		String prefix = StrKit.firstCharToLowerCase(modelName) + "List";
		return injectModels(request, modelClass, prefix);
	}

	/**
	 * 将页面中的数组对象转换成List
	 * @param request
	 * @param modelClass	model类
	 * @param prefix		数组前缀
	 * @return
	 */
	public static <T extends BaseModel<T>> List<T> injectModels(final HttpServletRequest request, Class<? extends T> modelClass, String prefix) {
		int index = 0;
		
		String arrayPrefix = prefix + "[";
		String key = null;
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			key = names.nextElement();
			if (key.startsWith(arrayPrefix) && key.indexOf("]") != -1) {
				int indexTemp = Integer.parseInt(key.substring(key.indexOf("[") + 1, key.indexOf("]")));
				if(indexTemp > index){
					index = indexTemp; // 找到最大的数组索引
				}
			}
		}
		
		List<T> modelList = new ArrayList<T>();
		for (int i = 0; i <= index; i++) {
			T baseModel = (T) Injector.injectModel(modelClass, prefix + "[" + i + "]", request, false);
			modelList.add(baseModel);
		}
		return modelList;
	}

}
