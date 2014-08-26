package little.ant.pingtai.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.Group;
import little.ant.pingtai.model.Role;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

public class RoleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(RoleService.class);

	public static final RoleService service = new RoleService();
	
	/**
	 * 保存
	 * @param role
	 * @return
	 */
	public String save(Role role){
		// 保存
		role.save();
		String ids = role.getStr("ids");
		
		// 缓存
		Role.dao.cacheAdd(ids);
		
		return ids;
	}

	/**
	 * 更新
	 * @param role
	 */
	public void update(Role role){
		// 更新
		role.update();
		
		// 缓存
		Role.dao.cacheAdd(role.getStr("ids"));
	}

	/**
	 * 删除
	 * @param role
	 */
	public void delete(String roleIds){
		// 缓存
		Role.dao.cacheRemove(roleIds);
		
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
		//role.set("moduleids", moduleIds);
		role.set("operatorids", operatorIds).update();
		
		// 缓存
		Role.dao.cacheAdd(roleIds);
	}
	
	/**
	 * 组角色选择
	 * @param ids 用户ids
	 */
	public Map<String,Object> select(String ids){
		List<Role> noCheckedList = new ArrayList<Role>();
		List<Role> checkedList = new ArrayList<Role>();
		String roleIds = Group.dao.findById(ids).getStr("roleids");
		if(null != roleIds && !roleIds.equals("")){
			String fitler = toSql(roleIds);

			Map<String, Object> param = new HashMap<String, Object>();
			param.put("fitler", fitler);
			
			noCheckedList = Role.dao.find(ToolSqlXml.getSql("pingtai.role.noCheckedFilter", param));
			checkedList = Role.dao.find(ToolSqlXml.getSql("pingtai.role.checkedFilter", param));
		}else{
			noCheckedList = Role.dao.find(ToolSqlXml.getSql("pingtai.role.noChecked"));
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
