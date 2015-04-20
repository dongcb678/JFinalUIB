package little.ant.platform.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.platform.model.Group;
import little.ant.platform.model.Menu;
import little.ant.platform.model.Role;
import little.ant.platform.model.Station;
import little.ant.platform.model.User;

import org.apache.log4j.Logger;

public class IndexService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IndexService.class);

	public static final IndexService service = new IndexService();
	
	/**
	 * 查询用户可操作的菜单
	 * @param systemsIds
	 * @param user
	 * @param i18n
	 * @return
	 */
	public List<Menu> menu(String systemsIds, User user, String i18n){
		String names = "names" + i18n(i18n) + " as names";
		
		//基于缓存查询
		StringBuilder operatorIdsSb = new StringBuilder();
		
		//根据分组查询权限
		String groupIds = user.getStr("groupids");
		if(null != groupIds){
			String[] groupIdsArr = groupIds.split(",");
			for (String groupIdsTemp : groupIdsArr) {
				Group group = Group.dao.cacheGet(groupIdsTemp);
				String roleIdsStr = group.getStr("roleids");
				String[] roleIdsArr = roleIdsStr.split(",");
				for (String roleIdsTemp : roleIdsArr) {
					Role role = Role.dao.cacheGet(roleIdsTemp);
					String operatorIdsStr = role.getStr("operatorids");
					operatorIdsSb.append(operatorIdsStr);
				}
			}
		}
		
		//根据岗位查询权限
		String stationIds = user.getStr("stationids");
		if(null != stationIds){
			String[] stationIdsArr = stationIds.split(",");
			for (String ids : stationIdsArr) {
				Station station = Station.dao.cacheGet(ids);
				String operatorIdsStr = station.getStr("operatorids");
				operatorIdsSb.append(operatorIdsStr);
			}
		}
		
		// 转换成过滤SQL
		String fitler = toSql(operatorIdsSb.toString()).replace("operator_", "");
		
		// 查询根菜单节点
		Menu menu = Menu.dao.findFirst(getSql("platform.menu.rootId"), systemsIds);
		String parentmenuids = menu.getPKValue();
		
		// 一级菜单
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("names", names);
		List<Menu> oneList = Menu.dao.find(getSql("platform.menu.child", param), parentmenuids);
		param.put("fitler", fitler);
		for (Menu oneMenu : oneList) {
			// 二级菜单
			String sql = getSql("platform.menu.operator", param);
			List<Menu> twoList = Menu.dao.find(sql, oneMenu.getPKValue());
			oneMenu.put("subList", twoList);
		}
		
		return oneList;
	}
	
}
