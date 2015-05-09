package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;

import org.apache.log4j.Logger;

/**
 * 部门model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_department")
public class Department extends BaseModel<Department> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Department.class);
	
	public static final Department dao = new Department();
	/**
	 * 主键
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 版本号
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 所有子节点ids
	 */
	public static final String colunm_allchildnodeids = "allchildnodeids";
	
	/**
	 * 部门级别
	 */
	public static final String colunm_departmentlevel = "departmentlevel";
	
	/**
	 * 部门类型
	 */
	public static final String colunm_depttype = "depttype";
	
	/**
	 * 描述
	 */
	public static final String colunm_description = "description";
	
	/**
	 * 图标
	 */
	public static final String colunm_images = "images";
	
	/**
	 * 是否上级节点
	 */
	public static final String colunm_isparent = "isparent";
	
	/**
	 * 名称
	 */
	public static final String colunm_names = "names";
	
	/**
	 * 排序号
	 */
	public static final String colunm_orderids = "orderids";
	
	/**
	 * url
	 */
	public static final String colunm_url = "url";
	
	/**
	 * 上级ids
	 */
	public static final String colunm_parentdepartmentids = "parentdepartmentids";
	
	/**
	 * 负责人ids
	 */
	public static final String colunm_principaluserids = "principaluserids";
	
}
