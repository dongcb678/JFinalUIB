package com.platform.mvc.dept;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 部门model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = Department.table_name)
public class Department extends BaseModel<Department> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static final Log log = Log.getLog(Department.class);
	
	public static final Department dao = new Department().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_department";
	
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
	 * 字段描述：所有子节点ids 
	 * 字段类型：character varying  长度：2000
	 */
	public static final String column_allchildnodeids = "allchildnodeids";
	
	/**
	 * 字段描述：部门级别 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_departmentlevel = "departmentlevel";
	
	/**
	 * 字段描述：部门类型 
	 * 字段类型：character  长度：1
	 */
	public static final String column_depttype = "depttype";
	
	/**
	 * 字段描述：描述 
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：图标 
	 * 字段类型：character varying  长度：50
	 */
	public static final String column_images = "images";
	
	/**
	 * 字段描述：是否上级节点 
	 * 字段类型：character varying  长度：5
	 */
	public static final String column_isparent = "isparent";
	
	/**
	 * 字段描述：名称 
	 * 字段类型：character varying  长度：25
	 */
	public static final String column_names = "names";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_orderids = "orderids";
	
	/**
	 * 字段描述：url 
	 * 字段类型：character varying  长度：100
	 */
	public static final String column_url = "url";
	
	/**
	 * 字段描述：上级ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_parentdepartmentids = "parentdepartmentids";
	
	/**
	 * 字段描述：负责人ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_principaluserids = "principaluserids";
	
	/**
	 * sqlId : platform.department.noChecked
	 * 描述：查询根节点
	 */
	public static final String sqlId_rootNode = "platform.department.rootNode";

	/**
	 * sqlId : platform.department.childNode
	 * 描述：根据上级节点id查询子部门信息 
	 */
	public static final String sqlId_childNode = "platform.department.childNode";

	/**
	 * sqlId : platform.department.childCount
	 * 描述：根据上级节点id查询子节点数量
	 */
	public static final String sqlId_childCount = "platform.department.childCount";

	/**
	 * sqlId : platform.department.userCount
	 * 描述：查询部门下人员数量
	 */
	public static final String sqlId_userCount = "platform.department.userCount";

	private String ids;
	private Long version;
	private String allchildnodeids;
	private Long departmentlevel;
	private String depttype;
	private String description;
	private String images;
	private String isparent;
	private String names;
	private Long orderids;
	private String url;
	private String parentdepartmentids;
	private String principaluserids;
	
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
	public void setAllchildnodeids(String allchildnodeids){
		set(column_allchildnodeids, allchildnodeids);
	}
	public String getAllchildnodeids() {
		return get(column_allchildnodeids);
	}
	public void setDepartmentlevel(Long departmentlevel){
		set(column_departmentlevel, departmentlevel);
	}
	public Long getDepartmentlevel() {
		return get(column_departmentlevel);
	}
	public void setDepttype(String depttype){
		set(column_depttype, depttype);
	}
	public String getDepttype() {
		return get(column_depttype);
	}
	public void setDescription(String description){
		set(column_description, description);
	}
	public String getDescription() {
		return get(column_description);
	}
	public void setImages(String images){
		set(column_images, images);
	}
	public String getImages() {
		return get(column_images);
	}
	public void setIsparent(String isparent){
		set(column_isparent, isparent);
	}
	public String getIsparent() {
		return get(column_isparent);
	}
	public void setNames(String names){
		set(column_names, names);
	}
	public String getNames() {
		return get(column_names);
	}
	public void setOrderids(Long orderids){
		set(column_orderids, orderids);
	}
	public Long getOrderids() {
		return get(column_orderids);
	}
	public void setUrl(String url){
		set(column_url, url);
	}
	public String getUrl() {
		return get(column_url);
	}
	public void setParentdepartmentids(String parentdepartmentids){
		set(column_parentdepartmentids, parentdepartmentids);
	}
	public String getParentdepartmentids() {
		return get(column_parentdepartmentids);
	}
	public void setPrincipaluserids(String principaluserids){
		set(column_principaluserids, principaluserids);
	}
	public String getPrincipaluserids() {
		return get(column_principaluserids);
	}
	
}
