package little.ant.pingtai.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.GroupModel;
import little.ant.pingtai.model.RoleModel;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

public class RoleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(RoleService.class);
	
	/**
	 * 保存
	 * @param role
	 * @return
	 */
	public String save(RoleModel role){
		role.save();
		
		// 缓存
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_role + role.getStr("ids"), role);
		
		return role.getPrimaryKeyValue();
	}

	/**
	 * 更新
	 * @param role
	 */
	public void update(RoleModel role){
		role.update();
		
		// 缓存
		role = RoleModel.dao.findById(role.getPrimaryKeyValue());
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_role + role.getStr("ids"), role);
	}

	/**
	 * 删除
	 * @param role
	 */
	public void delete(String roleIds){
		// 缓存
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_role + roleIds);
		
		// 删除
		RoleModel.dao.deleteById(roleIds);
	}
	
	/**
	 * 设置角色功能
	 * @param roleIds
	 * @param moduleIds
	 * @param operatorIds
	 */
	public void setOperator(String roleIds, String moduleIds, String operatorIds){
		RoleModel role = RoleModel.dao.findById(roleIds);
		role.set("moduleids", moduleIds).set("operatorids", operatorIds).update();
		
		// 缓存
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_role + roleIds, role);
	}
	
	/**
	 * 组角色选择
	 * @param ids 用户ids
	 */
	public Map<String,Object> select(String ids){
		List<RoleModel> noCheckedList = new ArrayList<RoleModel>();
		List<RoleModel> checkedList = new ArrayList<RoleModel>();
		String roleIds = GroupModel.dao.findById(ids).getStr("roleids");
		if(null != roleIds && !roleIds.equals("")){
			String fitler = toSql(roleIds);

			Map<String, Object> param = new HashMap<String, Object>();
			param.put("fitler", fitler);
			
			noCheckedList = RoleModel.dao.find(ToolSqlXml.getSql("pingtai.role.noCheckedFilter", param));
			checkedList = RoleModel.dao.find(ToolSqlXml.getSql("pingtai.role.checkedFilter", param));
		}else{
			noCheckedList = RoleModel.dao.find(ToolSqlXml.getSql("pingtai.role.noChecked"));
		}
		
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
		splitPageBase(splitPage, select, "pingtai.role.splitPage");
	}
	
}
