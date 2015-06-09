package little.ant.platform.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.model.Group;
import little.ant.platform.model.User;

import org.apache.log4j.Logger;

public class GroupService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(GroupService.class);

	public static final GroupService service = MyTxProxy.newProxy(GroupService.class);
	
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
	 * @param group
	 */
	public void delete(String groupIds){
		// 缓存
		Group.dao.cacheRemove(groupIds);
		
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
			
			noCheckedList = Group.dao.find(getSql("platform.group.noCheckedFilter", param));
			checkedList = Group.dao.find(getSql("platform.group.checkedFilter", param));
		}else{
			noCheckedList = Group.dao.find(getSql("platform.group.noChecked"));
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
		Group.dao.cacheAdd(groupIds);
	}
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select ids, names, numbers ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "platform.group.splitPage");
	}
	
}
