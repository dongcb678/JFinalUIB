package com.platform.mvc.usergroup;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 用户分组 model
 * @author 董华健  dongcb678@163.com
 */
@SuppressWarnings("unused")
@Table(tableName = UserGroup.table_name)
public class UserGroup extends BaseModel<UserGroup> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(UserGroup.class);
	
	public static final UserGroup dao = new UserGroup().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_usergroup";
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：用户ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_userids = "userids";
	
	/**
	 * 字段描述：分组ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_groupids = "groupids";
	
	
	/**
	 * sqlId : platform.userGroup.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPageFrom = "platform.userGroup.splitPageFrom";

	private String ids;
	private String userids;
	private String groupids;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setUserids(String userids){
		set(column_userids, userids);
	}
	public String getUserids() {
		return get(column_userids);
	}
	public void setGroupids(String groupids){
		set(column_groupids, groupids);
	}
	public String getGroupids() {
		return get(column_groupids);
	}
	
}
