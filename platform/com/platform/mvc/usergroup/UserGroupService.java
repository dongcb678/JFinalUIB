package com.platform.mvc.usergroup;

import java.util.List;

import com.jfinal.kit.Ret;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.user.User;

@Service(name = UserGroupService.serviceName)
public class UserGroupService extends BaseService {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(UserGroupService.class);
	
	public static final String serviceName = "userGroupService";

	/**
	 * 用户组选择
	 * @param ids 用户ids
	 */
	public Ret select(String userIds){
		Ret ret = Ret.create();
		
		String sqlChecked = getSql("platform.userGroup.findByUserIds");
		List<Record> checkedList = Db.find(sqlChecked, userIds);
		ret.put("checkedList", checkedList);
		
		String sqlNoChecked = getSql("platform.userGroup.findByNotUserIds");
		List<Record> noCheckedList = Db.find(sqlNoChecked, userIds);
		ret.put("noCheckedList", noCheckedList);
		
		return ret;
	}

	/**
	 * 添加用户拥有的组
	 * @param userIds
	 * @param groupIds
	 */
	public void addGroup(String userIds, String groupIds){
		UserGroup ug = new UserGroup();
		ug.setUserids(userIds);
		ug.setGroupids(groupIds);
		ug.save();
		
		// 缓存
		User.cacheAdd(userIds);
	}

	/**
	 * 删除用户拥有的组
	 * @param userGroupIds
	 */
	public void delGroup(String userGroupIds){
		UserGroup ug = UserGroup.dao.findById(userGroupIds);
		String userIds = ug.getUserids();

		// 删除
		ug.delete();
		
		// 缓存
		User.cacheAdd(userIds);
	}
	
}
