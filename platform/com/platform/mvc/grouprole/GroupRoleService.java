package com.platform.mvc.grouprole;

import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.kit.Ret;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;

@Service(name = GroupRoleService.serviceName)
public class GroupRoleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(GroupRoleService.class);
	
	public static final String serviceName = "groupRoleService";

	/**
	 * 分组角色选择
	 * @param groupIds 分组ids
	 */
	public Ret selectRole(String groupIds){
		Ret ret = Ret.create();

		String sqlChecked = getSql("platform.groupRole.findByGroupIds");
		List<Record> checkedList = Db.find(sqlChecked, groupIds);
		ret.put("checkedList", checkedList);
		
		String sqlNoChecked = getSql("platform.groupRole.findByNotGroupIds");
		List<Record> noCheckedList = Db.find(sqlNoChecked, groupIds);
		ret.put("noCheckedList", noCheckedList);
		
		return ret;
	}

	/**
	 * 添加分组拥有的角色
	 * @param groupIds
	 * @param roleIds
	 */
	public void addRole(String groupIds, String roleIds){
		GroupRole gr = new GroupRole();
		gr.setGroupids(groupIds);
		gr.setRoleids(roleIds);
		gr.save();
		
		// 缓存
		
	}

	/**
	 * 删除分组拥有的角色
	 * @param groupRoleIds
	 */
	public void delRole(String groupRoleIds){
		GroupRole.dao.deleteById(groupRoleIds);
		
		// 缓存
		
	}
	
}
