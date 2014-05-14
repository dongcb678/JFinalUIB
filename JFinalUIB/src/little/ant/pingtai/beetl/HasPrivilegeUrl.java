package little.ant.pingtai.beetl;

import little.ant.pingtai.common.EhcacheFactory;
import little.ant.pingtai.common.ParamInit;
import little.ant.pingtai.model.Group;
import little.ant.pingtai.model.Operator;
import little.ant.pingtai.model.Role;
import little.ant.pingtai.model.Station;
import little.ant.pingtai.model.User;

import org.apache.log4j.Logger;
import org.beetl.core.Context;
import org.beetl.core.Function;

public class HasPrivilegeUrl implements Function {

	private static Logger log = Logger.getLogger(HasPrivilegeUrl.class);
			
	@Override
	public Object call(Object[] arg, Context context) {
		if(arg.length != 2 || null == arg[0] || null == arg[1]){
			return false;
		}
		String url = null;
		String userIds = null;
		try {
			url = (String) arg[0]; 
			userIds = (String) arg[1]; 
		} catch (Exception e) {
			return false;
		}
		
		//基于缓存查询operator
		EhcacheFactory cacheFactory = EhcacheFactory.getInstance();
		Object operatorObj = cacheFactory.get(EhcacheFactory.cache_name_system, ParamInit.cacheStart_operator + url);
		if(null == operatorObj){
			log.error("URL缓存不存在：" + url);
			return false;
		}
		Operator operator = (Operator) operatorObj;
		
		//基于缓存查询user
		Object userObj = cacheFactory.get(EhcacheFactory.cache_name_system, ParamInit.cacheStart_user+ userIds);
		if(null == userObj){
			log.error("用户缓存不存在：" + userIds);
			return false;
		}
		User user = (User) userObj;

		// 权限验证对象
		String operatorIds = operator.getStr("ids") + ",";
		String groupIds = user.getStr("groupids");
		String stationIds = user.getStr("stationids");
		
		//根据分组查询权限
		if(null != groupIds){
			String[] groupIdsArr = groupIds.split(",");
			for (String groupIdsTemp : groupIdsArr) {
				Group group = (Group) cacheFactory.get(EhcacheFactory.cache_name_system, ParamInit.cacheStart_group + groupIdsTemp);
				String roleIdsStr = group.getStr("roleids");
				String[] roleIdsArr = roleIdsStr.split(",");
				for (String roleIdsTemp : roleIdsArr) {
					Role role = (Role) cacheFactory.get(EhcacheFactory.cache_name_system, ParamInit.cacheStart_role + roleIdsTemp);
					String operatorIdsStr = role.getStr("operatorids");
					if(operatorIdsStr.indexOf(operatorIds) != -1){
						return true;
					}
				}
			}
		}
		
		//根据岗位查询权限
		if(null != stationIds){
			String[] stationIdsArr = stationIds.split(",");
			for (String ids : stationIdsArr) {
				Station station = (Station) cacheFactory.get(EhcacheFactory.cache_name_system, ParamInit.cacheStart_station + ids);
				String operatorIdsStr = station.getStr("operatorids");
				if(operatorIdsStr.indexOf(operatorIds) != -1){
					return true;
				}
			}
		}
		
		return false;
	}

}
