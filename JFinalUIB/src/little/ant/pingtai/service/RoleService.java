package little.ant.pingtai.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.EhcacheFactory;
import little.ant.pingtai.common.ParamInit;
import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.Group;
import little.ant.pingtai.model.Role;
import little.ant.pingtai.utils.ToolUtils;

import org.apache.log4j.Logger;

public class RoleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(RoleService.class);
	
	/**
	 * 保存
	 * @param role
	 * @return
	 */
	public String save(Role role){
		String ids = ToolUtils.getUuidByJdk(true);
		role.set("ids", ids).save();
		
		// 缓存
		EhcacheFactory.getInstance().add(EhcacheFactory.cache_name_system, ParamInit.cacheStart_role + role.getStr("ids"), role);
		
		return ids;
	}

	/**
	 * 更新
	 * @param role
	 */
	public void update(Role role){
		role.update();
		
		// 缓存
		EhcacheFactory.getInstance().update(EhcacheFactory.cache_name_system, ParamInit.cacheStart_role + role.getStr("ids"), role);
	}

	/**
	 * 删除
	 * @param role
	 */
	public void delete(String roleIds){
		// 缓存
		EhcacheFactory.getInstance().delete(EhcacheFactory.cache_name_system, ParamInit.cacheStart_role + roleIds);
		
		// 删除
		Role.dao.deleteById(roleIds);
	}
	
	/**
	 * 设置角色功能
	 * @param roleIds
	 * @param moduleIds
	 * @param operatorIds
	 */
	public void setOperator(String roleIds, String moduleIds, String operatorIds){
		Role role = Role.dao.findById(roleIds);
		role.set("moduleids", moduleIds).set("operatorids", operatorIds).update();
		
		// 缓存
		EhcacheFactory.getInstance().update(EhcacheFactory.cache_name_system, ParamInit.cacheStart_role + roleIds, role);
	}
	
	/**
	 * 组角色选择
	 * @param ids 用户ids
	 */
	public Map<String,Object> select(String ids){
		String roleIds = Group.dao.findById(ids).getStr("roleids");
		if(null == roleIds){
			roleIds = "";
		}

		String fitler = toSql(roleIds);
		
		List<Role> noCheckedList = Role.dao.find("select ids, names from pt_role where ids not in (" + fitler + ") order by names asc");
		List<Role> checkedList = Role.dao.find("select ids, names from pt_role where ids in (" + fitler + ") order by names asc");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noCheckedList", noCheckedList);
		map.put("checkedList", checkedList);
		return map;
	}
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select * ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuffer formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from pt_role where 1=1 ");
		
		if(null == queryParam){
			return;
		}
		
		String names = queryParam.get("names");//姓名
		
		if(null!=names && !names.equals("")){
			formSqlSb.append(" and names like ? ");
			paramValue.add("%" + names.trim() + "%");
		}
	}
	
}
