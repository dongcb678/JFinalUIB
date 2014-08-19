package little.ant.pingtai.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.model.GroupModel;
import little.ant.pingtai.model.MenuModel;
import little.ant.pingtai.model.RoleModel;
import little.ant.pingtai.model.StationModel;
import little.ant.pingtai.model.UserModel;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

public class IndexService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IndexService.class);
	
	/**
	 * 查询用户可操作的菜单
	 * @param systemsIds
	 * @param user
	 * @param i18n
	 * @return
	 */
	public List<MenuModel> menu(String systemsIds, UserModel user, String i18n){
		String names = "names" + i18n(i18n) + " as names";
		
		//基于缓存查询
		StringBuilder operatorIdsSb = new StringBuilder();
		
		//根据分组查询权限
		String groupIds = user.getStr("groupids");
		if(null != groupIds){
			String[] groupIdsArr = groupIds.split(",");
			for (String groupIdsTemp : groupIdsArr) {
				GroupModel group = (GroupModel) CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_group + groupIdsTemp);
				String roleIdsStr = group.getStr("roleids");
				String[] roleIdsArr = roleIdsStr.split(",");
				for (String roleIdsTemp : roleIdsArr) {
					RoleModel role = (RoleModel) CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_role + roleIdsTemp);
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
				StationModel station = (StationModel) CacheKit.get(DictKeys.cache_name_system, ThreadParamInit.cacheStart_station + ids);
				String operatorIdsStr = station.getStr("operatorids");
				operatorIdsSb.append(operatorIdsStr);
			}
		}
		
		// 转换成过滤SQL
		String fitler = toSql(operatorIdsSb.toString()).replace("operator_", "");
		
		// 查询根菜单节点
		MenuModel menu = MenuModel.dao.findFirst(ToolSqlXml.getSql("pingtai.menu.rootId"), systemsIds);
		String parentmenuids = menu.getStr("ids");
		
		// 一级菜单
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("names", names);
		List<MenuModel> oneList = MenuModel.dao.find(ToolSqlXml.getSql("pingtai.menu.child", param), parentmenuids);
		param.put("fitler", fitler);
		for (MenuModel oneMenu : oneList) {
			// 二级菜单
			String sql = ToolSqlXml.getSql("pingtai.menu.operator", param);
			List<MenuModel> twoList = MenuModel.dao.find(sql, oneMenu.getPrimaryKeyValue());
			oneMenu.put("subList", twoList);
		}
		return oneList;
	}
	
}
