package com.platform.mvc.role;

import com.jfinal.log.Log;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;

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
		for (String roleIds : idsArr) {
			// 删除
			Role.dao.deleteById(roleIds);
		}
	}
	
}
