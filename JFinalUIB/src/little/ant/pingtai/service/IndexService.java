package little.ant.pingtai.service;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.model.Group;
import little.ant.pingtai.model.Menu;
import little.ant.pingtai.model.Role;
import little.ant.pingtai.model.Station;
import little.ant.pingtai.model.User;
import little.ant.pingtai.run.JfinalConfig;
import little.ant.pingtai.thread.ParamInit;
import little.ant.pingtai.tools.ToolDateTime;
import little.ant.pingtai.tools.ToolEhcacheFactory;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

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
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		StringBuffer operatorIdsSb = new StringBuffer();
		
		//根据分组查询权限
		String groupIds = user.getStr("groupids");
		if(null != groupIds){
			String[] groupIdsArr = groupIds.split(",");
			for (String groupIdsTemp : groupIdsArr) {
				Group group = (Group) cacheFactory.get(ToolEhcacheFactory.cache_name_system, ParamInit.cacheStart_group + groupIdsTemp);
				String roleIdsStr = group.getStr("roleids");
				String[] roleIdsArr = roleIdsStr.split(",");
				for (String roleIdsTemp : roleIdsArr) {
					Role role = (Role) cacheFactory.get(ToolEhcacheFactory.cache_name_system, ParamInit.cacheStart_role + roleIdsTemp);
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
				Station station = (Station) cacheFactory.get(ToolEhcacheFactory.cache_name_system, ParamInit.cacheStart_station + ids);
				String operatorIdsStr = station.getStr("operatorids");
				operatorIdsSb.append(operatorIdsStr);
			}
		}
		
		// 转换成过滤SQL
		String fitler = toSql(operatorIdsSb.toString()).replace("operator_", "");
		
		// 查询根菜单节点
		Menu menu = Menu.dao.findFirst(" select ids from pt_menu where parentmenuids is null and systemsIds = ? ", systemsIds);
		String parentmenuids = menu.getStr("ids");
		
		// 一级菜单
		List<Menu> oneList = Menu.dao.find(" select ids, names from pt_menu where parentmenuids = ? order by orderids asc ", parentmenuids);
		for (Menu oneMenu : oneList) {
			String sql = " select m.names, o.url  from pt_menu m left join pt_operator o on m.operatorids=o.ids where parentmenuids = ? and m.operatorids in (" + fitler + ") order by orderids asc ";
			// 二级菜单
			List<Menu> twoList = Menu.dao.find(sql, oneMenu.getPrimaryKeyValue());
			oneMenu.put("subList", twoList);
		}
		return oneList;
	}
	
	public Map<String, Object> pv(){
		Date endDate = ToolDateTime.endDate(new Date());
		Date startDate = ToolDateTime.startDate(endDate, -14);
		
		List<Record> list = null;
		String db_type = (String) JfinalConfig.getParamMapValue(DictKeys.db_type_key);
		if(db_type.equals(DictKeys.db_type_postgresql)){ // pg
			StringBuffer sql = new StringBuffer();
			sql.append(" select to_char(startdate, 'yyyy-MM-DD') adates, count(*) acounts from pt_syslog ");
			sql.append(" where startdate>=? and startdate<=? ");
			sql.append(" group by adates order by adates asc ");
			list = Db.find(sql.toString(), new java.sql.Timestamp(startDate.getTime()), new java.sql.Timestamp(endDate.getTime()));
		
		}else if(db_type.equals(DictKeys.db_type_mysql)){ // mysql
			StringBuffer sql = new StringBuffer();
			sql.append(" select date_format(startdate,'%Y-%m-%d') adates, count(*) acounts from pt_syslog ");
			sql.append(" where startdate>=? and startdate<=? ");
			sql.append(" group by adates order by adates asc ");
			list = Db.find(sql.toString(), new java.sql.Timestamp(startDate.getTime()), new java.sql.Timestamp(endDate.getTime()));
		}
		
		List<String> adates = new LinkedList<String>();
		List<Long> acounts = new LinkedList<Long>();
		for (Record record : list) {
			adates.add(ToolDateTime.format(record.getStr("adates"), ToolDateTime.pattern_date, "MM-dd"));
			acounts.add(record.getLong("acounts"));
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("adates", JSON.toJSON(adates).toString());
		map.put("acounts", JSON.toJSON(acounts).toString());
		return map;
	}
	
}
