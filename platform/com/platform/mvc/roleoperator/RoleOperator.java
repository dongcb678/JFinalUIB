package com.platform.mvc.roleoperator;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 角色功能 model
 * @author 董华健  dongcb678@163.com
 */
@SuppressWarnings("unused")
@Table(tableName = RoleOperator.table_name)
public class RoleOperator extends BaseModel<RoleOperator> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(RoleOperator.class);
	
	public static final RoleOperator dao = new RoleOperator().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_roleoperator";
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：角色ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_roleids = "roleids";
	
	/**
	 * 字段描述：功能ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_operatorids = "operatorids";
	
	/**
	 * sqlId : platform.roleOperator.splitPageSelect
	 * 描述：通用select *
	 */
	public static final String sqlId_splitPageSelect = "platform.roleOperator.splitPageSelect";

	/**
	 * sqlId : platform.roleOperator.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPageFrom = "platform.roleOperator.splitPageFrom";

	private String ids;
	private String roleids;
	private String operatorids;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setRoleids(String roleids){
		set(column_roleids, roleids);
	}
	public String getRoleids() {
		return get(column_roleids);
	}
	public void setOperatorids(String operatorids){
		set(column_operatorids, operatorids);
	}
	public String getOperatorids() {
		return get(column_operatorids);
	}
	
}
