package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;

import org.apache.log4j.Logger;

/**
 * 模块model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_module")
public class Module extends BaseModel<Module> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Module.class);
	
	public static final Module dao = new Module();

	/**
	 * 主键
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 版本号
	 */
	public static final String colunm_version = "version";
	
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
	 * 上级模块ids
	 */
	public static final String colunm_parentmoduleids = "parentmoduleids";
	
	/**
	 * 所属系统ids
	 */
	public static final String colunm_systemsids = "systemsids";
	
}
