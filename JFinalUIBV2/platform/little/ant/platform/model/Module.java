package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;

import org.apache.log4j.Logger;

/**
 * 模块model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "pt_module")
public class Module extends BaseModel<Module> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Module.class);
	
	public static final Module dao = new Module();

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
	 * 字段描述：上级模块ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_parentmoduleids = "parentmoduleids";
	
	/**
	 * 字段描述：所属系统ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_systemsids = "systemsids";

	/**
	 * sqlId : platform.module.rootBySystemIds
	 * 描述：根节点
	 */
	public static final String sqlId_rootBySystemIds = "platform.module.rootBySystemIds";

	/**
	 * sqlId : platform.module.root
	 * 描述：根节点
	 */
	public static final String sqlId_root = "platform.module.root";

	/**
	 * sqlId : platform.module.child
	 * 描述：子节点
	 */
	public static final String sqlId_child = "platform.module.child";

	/**
	 * sqlId : platform.module.childCount
	 * 描述：子节点数量
	 */
	public static final String sqlId_childCount = "platform.module.childCount";

}
