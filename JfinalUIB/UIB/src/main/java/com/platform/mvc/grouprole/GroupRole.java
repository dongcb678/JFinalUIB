package com.platform.mvc.grouprole;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 分组角色 model
 * @author 董华健  dongcb678@163.com
 */
@SuppressWarnings("unused")
@Table(tableName = GroupRole.table_name)
public class GroupRole extends BaseModel<GroupRole> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(GroupRole.class);
	
	public static final GroupRole dao = new GroupRole().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_grouprole";
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：分组ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_groupids = "groupids";
	
	/**
	 * 字段描述：角色ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_roleids = "roleids";
	
	private String ids;
	private String groupids;
	private String roleids;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setGroupids(String groupids){
		set(column_groupids, groupids);
	}
	public String getGroupids() {
		return get(column_groupids);
	}
	public void setRoleids(String roleids){
		set(column_roleids, roleids);
	}
	public String getRoleids() {
		return get(column_roleids);
	}
	
}
