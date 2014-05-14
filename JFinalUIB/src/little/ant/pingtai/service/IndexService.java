package little.ant.pingtai.service;

import java.util.List;

import little.ant.pingtai.common.EhcacheFactory;
import little.ant.pingtai.common.ParamInit;
import little.ant.pingtai.model.Group;
import little.ant.pingtai.model.Menu;
import little.ant.pingtai.model.Role;
import little.ant.pingtai.model.Station;
import little.ant.pingtai.model.User;

import org.apache.log4j.Logger;

public class IndexService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IndexService.class);
	
	/**
	 * 查询用户可操作的菜单
	 * @param systemsIds
	 * @param user
	 * @return
	 */
	public List<Menu> menu(String systemsIds, User user){
		//基于缓存查询
		EhcacheFactory cacheFactory = EhcacheFactory.getInstance();
		StringBuffer operatorIdsSb = new StringBuffer();
		
		//根据分组查询权限
		String groupIds = user.getStr("groupids");
		if(null != groupIds){
			String[] groupIdsArr = groupIds.split(",");
			for (String groupIdsTemp : groupIdsArr) {
				Group group = (Group) cacheFactory.get(EhcacheFactory.cache_name_system, ParamInit.cacheStart_group + groupIdsTemp);
				String roleIdsStr = group.getStr("roleids");
				String[] roleIdsArr = roleIdsStr.split(",");
				for (String roleIdsTemp : roleIdsArr) {
					Role role = (Role) cacheFactory.get(EhcacheFactory.cache_name_system, ParamInit.cacheStart_role + roleIdsTemp);
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
				Station station = (Station) cacheFactory.get(EhcacheFactory.cache_name_system, ParamInit.cacheStart_station + ids);
				String operatorIdsStr = station.getStr("operatorids");
				operatorIdsSb.append(operatorIdsStr);
			}
		}
		
		// 转换成过滤SQL
		String fitler = toSql(operatorIdsSb.toString()).replace("operator_", "");
		
		// 默认系统
		if(null == systemsIds || systemsIds.isEmpty()){
			systemsIds = "8a40c0353fa828a6013fa898d4ac0020";
		}
		
		// 查询根菜单节点
		Menu menu = Menu.dao.findFirst(" select ids from pt_menu where parentmenuids is null and systemsIds = ? ", systemsIds);
		String parentmenuids = menu.getStr("ids");
		
		// 一级菜单
		List<Menu> oneList = Menu.dao.find(" select ids, names from pt_menu where parentmenuids = ? order by orderids asc ", parentmenuids);
		for (Menu oneMenu : oneList) {
			String sql = " select m.names, o.url  from pt_menu m left join pt_operator o on m.operatorids=o.ids where parentmenuids = ? and m.operatorids in (" + fitler + ") order by orderids asc ";
			// 二级菜单
			List<Menu> twoList = Menu.dao.find(sql, oneMenu.get("ids"));
			oneMenu.put("subList", twoList);
		}
		return oneList;
	}
	
}
