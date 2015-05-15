package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.ConstantPlatform;

import org.apache.log4j.Logger;

/**
 * 部门model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantPlatform.db_dataSource_main, tableName = "pt_department")
public class Department extends BaseModel<Department> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Department.class);
	
	public static final Department dao = new Department();

	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 字段描述：所有子节点ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_allchildnodeids = "allchildnodeids";
	
	/**
	 * 字段描述：部门级别 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_departmentlevel = "departmentlevel";
	
	/**
	 * 字段描述：部门类型 
	 * 字段类型 ：character 
	 */
	public static final String colunm_depttype = "depttype";
	
	/**
	 * 字段描述：描述 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_description = "description";
	
	/**
	 * 字段描述：图标 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_images = "images";
	
	/**
	 * 字段描述：是否上级节点 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_isparent = "isparent";
	
	/**
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_names = "names";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_orderids = "orderids";
	
	/**
	 * 字段描述：url 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_url = "url";
	
	/**
	 * 字段描述：上级ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_parentdepartmentids = "parentdepartmentids";
	
	/**
	 * 字段描述：负责人ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_principaluserids = "principaluserids";
	
}
