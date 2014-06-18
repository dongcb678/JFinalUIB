package little.ant.pingtai.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.Group;
import little.ant.pingtai.model.User;
import little.ant.pingtai.thread.ParamInit;
import little.ant.pingtai.tools.ToolEhcacheFactory;

import org.apache.log4j.Logger;

public class GroupService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(GroupService.class);
	
	/**
	 * 保存
	 * @param group
	 * @return
	 */
	public String save(Group group){
		group.save();
		
		// 缓存
		ToolEhcacheFactory.getInstance().add(ToolEhcacheFactory.cache_name_system, ParamInit.cacheStart_group + group.getStr("ids"), group);
		
		return group.getStr("ids");
	}

	/**
	 * 更新
	 * @param group
	 */
	public void update(Group group){
		// 更新
		group.update();

		// 缓存
		ToolEhcacheFactory.getInstance().update(ToolEhcacheFactory.cache_name_system, ParamInit.cacheStart_group + group.getStr("ids"), group);
	}

	/**
	 * 更新
	 * @param group
	 */
	public void delete(String groupIds){
		// 缓存
		ToolEhcacheFactory.getInstance().delete(ToolEhcacheFactory.cache_name_system, ParamInit.cacheStart_group + groupIds);
		
		// 删除
		Group.dao.deleteById(groupIds);
	}
	
	/**
	 * 用户组选择
	 * @param ids 用户ids
	 */
	public Map<String,Object> select(String ids){
		String groupIds = User.dao.findById(ids).getStr("groupids");
		if(null == groupIds){
			groupIds = "";
		}
		
		String fitler = toSql(groupIds);
		
		List<Group> noCheckedList = Group.dao.find("select ids, names from pt_group where ids not in (" + fitler + ") order by names asc");
		List<Group> checkedList = Group.dao.find("select ids, names from pt_group where ids in (" + fitler + ") order by names asc");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("noCheckedList", noCheckedList);
		map.put("checkedList", checkedList);
		return map;
	}

	/**
	 * 设置组拥有的角色
	 * @param userIds
	 * @param groupIds
	 */
	public void setRole(String groupIds, String roleIds){
		Group group = Group.dao.findById(groupIds);
		group.set("roleids", roleIds).update();
		
		// 缓存
		ToolEhcacheFactory.getInstance().update(ToolEhcacheFactory.cache_name_system, ParamInit.cacheStart_group + group.getStr("ids"), group);
	}
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select ids, names ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuffer formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from pt_group where 1=1 ");
		
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
