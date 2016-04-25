package com.platform.mvc.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.group.Group;
import com.platform.mvc.menu.Menu;
import com.platform.mvc.role.Role;
import com.platform.mvc.station.Station;
import com.platform.mvc.user.User;

@Service(name = IndexService.serviceName)
public class IndexService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IndexService.class);

	public static final String serviceName = "indexService";

	/**
	 * 查询用户可操作的菜单
	 * @param systemsIds
	 * @param user
	 * @param i18n
	 * @return
	 */
	public List<Menu> menu(String systemsIds, User user, String i18nColumnSuffix){
		String names = "names" + i18nColumnSuffix + " as names";
		
		//基于缓存查询
		StringBuilder operatorIdsSb = new StringBuilder();
		
		//根据分组查询权限
		String groupIds = user.getStr(User.column_groupids);
		if(null != groupIds){
			String[] groupIdsArr = groupIds.split(",");
			for (String groupIdsTemp : groupIdsArr) {
				Group group = Group.dao.cacheGet(groupIdsTemp);
				String roleIdsStr = group.getStr(Group.column_roleids);
				String[] roleIdsArr = roleIdsStr.split(",");
				for (String roleIdsTemp : roleIdsArr) {
					Role role = Role.dao.cacheGet(roleIdsTemp);
					String operatorIdsStr = role.getStr(Role.column_operatorids);
					operatorIdsSb.append(operatorIdsStr);
				}
			}
		}
		
		//根据岗位查询权限
		String stationIds = user.getStr(User.column_stationids);
		if(null != stationIds){
			String[] stationIdsArr = stationIds.split(",");
			for (String ids : stationIdsArr) {
				Station station = Station.dao.cacheGet(ids);
				String operatorIdsStr = station.getStr(Station.column_operatorids);
				operatorIdsSb.append(operatorIdsStr);
			}
		}
		
		// 转换成过滤SQL
		String fitler = sqlIn(operatorIdsSb.toString()).replace("operator_", "");
		
		// 查询根菜单节点
		Menu menu = Menu.dao.findFirst(getSql(Menu.sqlId_rootId), systemsIds);
		String parentmenuids = menu.getPKValue();
		
		// 一级菜单
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("names", names);
		List<Menu> oneList = Menu.dao.find(getSqlByBeetl(Menu.sqlId_child, param), parentmenuids);
		param.put("fitler", fitler);
		for (Menu oneMenu : oneList) {
			// 二级菜单
			String sql = getSqlByBeetl(Menu.sqlId_operator, param);
			List<Menu> twoList = Menu.dao.find(sql, oneMenu.getPKValue());
			oneMenu.put("subList", twoList);
		}
		
		return oneList;
	}
	
}
