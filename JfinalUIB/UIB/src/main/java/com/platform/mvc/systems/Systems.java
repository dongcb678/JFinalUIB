package com.platform.mvc.systems;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 系统model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = Systems.table_name)
public class Systems extends BaseModel<Systems> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(Systems.class);
	
	public static final Systems dao = new Systems().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_systems";
	
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
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：名称 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_names = "names";
	
	/**
	 * 字段描述：编号 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_numbers = "numbers";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_orderids = "orderids";
	
	/**
	 * sqlId : platform.systems.all
	 * 描述：
	 */
	public static final String sqlId_all = "platform.systems.all";

	/**
	 * sqlId : platform.systems.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPageFrom = "platform.systems.splitPageFrom";

	private String ids;
	private Long version;
	private String description;
	private String names;
	private String numbers;
	private Long orderids;
	
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
	public void setOrderids(Long orderids){
		set(column_orderids, orderids);
	}
	public Long getOrderids() {
		return get(column_orderids);
	}
	
}
