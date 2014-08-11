package little.ant.pingtai.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.Group;
import little.ant.pingtai.model.User;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

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
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_group + group.getStr("ids"), group);
		
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
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_group + group.getStr("ids"), group);
	}

	/**
	 * 更新
	 * @param group
	 */
	public void delete(String groupIds){
		// 缓存
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_group + groupIds);
		
		// 删除
		Group.dao.deleteById(groupIds);
	}
	
	/**
	 * 用户组选择
	 * @param ids 用户ids
	 */
	public Map<String,Object> select(String ids){
		List<Group> noCheckedList = new ArrayList<Group>();
		List<Group> checkedList = new ArrayList<Group>();
		String groupIds = User.dao.findById(ids).getStr("groupids");
		if(null != groupIds && !groupIds.equals("")){
			String fitler = toSql(groupIds);

			Map<String, Object> param = new HashMap<String, Object>();
			param.put("fitler", fitler);
			
			noCheckedList = Group.dao.find(ToolSqlXml.getSql("pingtai.group.noCheckedFilter", param));
			checkedList = Group.dao.find(ToolSqlXml.getSql("pingtai.group.checkedFilter", param));
		}else{
			noCheckedList = Group.dao.find(ToolSqlXml.getSql("pingtai.group.noChecked"));
		}
		
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
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_group + group.getStr("ids"), group);
	}
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select ids, names ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuilder formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from pt_group where 1=1 ");

		Set<String> paramKeySet = queryParam.keySet();
		for (String paramKey : paramKeySet) {
			String value = queryParam.get(paramKey);
			switch (paramKey) {
			case "names":// 分组名称
				formSqlSb.append(" and names like ? ");
				paramValue.add("%" + value + "%");
				break;

			default:
				break;
			}
		}
	}
	
}
