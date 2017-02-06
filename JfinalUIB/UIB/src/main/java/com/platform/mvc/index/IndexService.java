package com.platform.mvc.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.log.Log;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.menu.Menu;
import com.platform.mvc.user.User;

@Service(name = IndexService.serviceName)
public class IndexService extends BaseService {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(IndexService.class);

	public static final String serviceName = "indexService";

	/**
	 * 查询用户可操作的菜单
	 * @param systemsIds
	 * @param user
	 * @param i18n
	 * @return
	 */
	public List<Menu> menu(String systemsIds, User user, String i18nColumnSuffix){
		String userIds = user.getPKValue();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("names", "names" + i18nColumnSuffix + " as names");
		
		String oneSql = getSqlByBeetl(Menu.sqlId_child, param);
		String twoSql = getSqlByBeetl(Menu.sqlId_operator, param);
		
		// 查询根菜单节点
		Menu menu = Menu.dao.findFirst(getSqlMy(Menu.sqlId_rootId), systemsIds);
		String parentmenuids = menu.getPKValue();
		
		// 一级菜单
		List<Menu> oneList = Menu.dao.find(oneSql, parentmenuids);
		for (Menu oneMenu : oneList) {
			// 二级菜单
			String pMenuIds = oneMenu.getPKValue();
			List<Menu> twoList = Menu.dao.find(twoSql, pMenuIds, userIds, userIds);
			oneMenu.put("subList", twoList);
		}
		
		return oneList;
	}
	
}
