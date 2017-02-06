package com.platform.mvc.role;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 角色model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = Role.table_name)
public class Role extends BaseModel<Role> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(Role.class);
	
	public static final Role dao = new Role().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_role";
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：描述 
	 * 字段类型：character varying  长度：2000
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：名称 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_names = "names";
	
	/**
	 * 字段描述：编号 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_numbers = "numbers";
	
	/**
	 * sqlId : platform.role.noCheckedFilter
	 * 描述：
	 */
	public static final String sqlId_noCheckedFilter = "platform.role.noCheckedFilter";

	/**
	 * sqlId : platform.role.checkedFilter
	 * 描述：
	 */
	public static final String sqlId_checkedFilter = "platform.role.checkedFilter";

	/**
	 * sqlId : platform.role.noChecked
	 * 描述：
	 */
	public static final String sqlId_noChecked = "platform.role.noChecked";

	/**
	 * sqlId : platform.role.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "platform.role.splitPageSelect";

	/**
	 * sqlId : platform.role.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPageFrom = "platform.role.splitPageFrom";

	private String ids;
	private Long version;
	private String description;
	private String names;
	private String numbers;
	
	public void setIds(String ids){
		set(column_ids, ids);
	}
	public String getIds() {
		return get(column_ids);
	}
	public void setVersion(Long version){
		set(column_version, version);
	}
	public Long getVersion() {
		return get(column_version);
	}
	public void setDescription(String description){
		set(column_description, description);
	}
	public String getDescription() {
		return get(column_description);
	}
	public void setNames(String names){
		set(column_names, names);
	}
	public String getNames() {
		return get(column_names);
	}
	public void setNumbers(String numbers){
		set(column_numbers, numbers);
	}
	public String getNumbers() {
		return get(column_numbers);
	}
	
}
