package com.platform.mvc.role;

import java.util.List;

import com.jfinal.log.Log;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.grouprole.GroupRole;
import com.platform.mvc.grouprole.GroupRoleService;
import com.platform.mvc.roleoperator.RoleOperator;

@Service(name = RoleService.serviceName)
public class RoleService extends BaseService {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(RoleService.class);

	public static final String serviceName = "roleService";

	/**
	 * 保存
	 * @param role
	 * @return
	 */
	public String save(Role role) {
		// 保存
		role.save();
		return role.getPKValue();
	}

	/**
	 * 更新
	 * @param role
	 */
	public void update(Role role){
		// 更新
		role.update();
	}

	/**
	 * 删除
	 * @param role
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);

		String roSql = getSqlMy("platform.role.getRoleoperatorByRoleids");
		String grSql = getSqlMy("platform.role.getGrouproleByRoleids");
		
		for (String roleIds : idsArr) {
			// 删除角色功能关联数据
			List<RoleOperator> roList = RoleOperator.dao.find(roSql, roleIds);
			for (RoleOperator ro : roList) {
				
				ro.delete(); 
			}
			
			// 删除分组角色关联数据，并重新缓存分组功能
			List<GroupRole> grList = GroupRole.dao.find(grSql, roleIds);
			for (GroupRole gr : grList) {
				String groupIds = gr.getGroupids();
				
				// 删除关联数据
				gr.delete(); 
				
				// 重新缓存
				GroupRoleService.cacheAdd(groupIds);
			}
			
			// 删除角色
			Role.dao.deleteById(roleIds);
		}
	}
	
}
