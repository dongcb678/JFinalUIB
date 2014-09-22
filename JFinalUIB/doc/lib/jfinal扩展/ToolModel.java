package com.jfinal.core;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import com.jfinal.plugin.activerecord.Model;

/**
 * Model Tools
 * @author wangkai
 * @date Feb 14, 2013 1:43:37 PM
 * 
 * 表单：	<input type="hidden" name="beans[${x_index}].ID" value="${(x.ID)!}"/>
 * 
 * 调用方法：  List<Const> beanList = ToolModel.batchInjectModel(getRequest(), Const.class, "beans");
 */
public class ToolModel {

	/**
	 * 将页面中的数组对象转换成List<Model>
	 * 
	 * @param <T>
	 * @param request
	 * @param modelClass
	 * @param prefix
	 * @return
	 * 
	 * @author wangkai
	 * @date Feb 14, 2013
	 * 
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static <T> List<T> batchInjectModel(final HttpServletRequest request, Class<? extends Model> modelClass, String prefix) {
		List<T> modelList = new ArrayList<T>();
		int size = getArrayLength(request, prefix);
		for (int i = 0; i < size; i++) {
			modelList.add((T) ModelInjector.inject(modelClass, prefix + "[" + i + "]", request, false));
		}
		return modelList;
	}

	/**
	 * Get array key beans[0].ID -->beans[0] beans[1].ID -->beans[1]
	 * 
	 * @param request
	 * @param prefix
	 * @return
	 * 
	 * @author wangkai
	 * @date Feb 14, 2013
	 * 
	 */
	public static Set<String> getArrayKeys(final HttpServletRequest request, String prefix) {
		Set<String> keys = new HashSet<String>();
		String arrayPrefix = prefix + "[";
		String key = null;
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			key = names.nextElement();
			if (!key.startsWith(arrayPrefix)) {
				continue;
			}
			if (key.indexOf("]") == -1) {
				continue;
			}
			keys.add(key.substring(0, key.indexOf("]") + 1));// Get all bean[X]
		}
		return keys;
	}

	/**
	 * Get array length
	 * 
	 * @param request
	 * @param prefix
	 * @return
	 * 
	 * @author wangkai
	 * @date Feb 14, 2013
	 * 
	 */
	public static int getArrayLength(final HttpServletRequest request, String prefix) {
		return getArrayKeys(request, prefix).size();
	}

}
