package com.platform.mvc.group;

import org.apache.log4j.Logger;

import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;

@Service(name = GroupService.serviceName)
public class GroupService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(GroupService.class);

	public static final String serviceName = "groupService";

	/**
	 * 保存
	 * @param group
	 * @return
	 */
	public String save(Group group){
		// 保存
		group.save();
		
		// 缓存
		Group.dao.cacheAdd(group.getPKValue());
		
		return group.getPKValue();
	}

	/**
	 * 更新
	 * @param group
	 */
	public void update(Group group){
		// 更新
		group.update();

		// 缓存
		Group.dao.cacheAdd(group.getPKValue());
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String groupIds : idsArr) {
			// 缓存
			Group.dao.cacheRemove(groupIds);
			
			// 删除
			Group.dao.deleteById(groupIds);
		}
	}
	
}
