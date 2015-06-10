package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.constant.ConstantInit;

import org.apache.log4j.Logger;

/**
 * 系统model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantInit.db_dataSource_main, tableName = "pt_systems")
public class Systems extends BaseModel<Systems> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Systems.class);
	
	public static final Systems dao = new Systems();

	/**
	 * 字段描述：主键 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型 ：bigint 
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：描述 
	 * 字段类型 ：character varying 
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_names = "names";
	
	/**
	 * 字段描述：编号 
	 * 字段类型 ：character varying 
	 */
	public static final String column_numbers = "numbers";
	
	/**
	 * 字段描述：排序号 
	 * 字段类型 ：bigint 
	 */
	public static final String column_orderids = "orderids";

	/**
	 * sqlId : platform.systems.all
	 * 描述：
	 */
	public static final String sqlId_all = "platform.systems.all";

	/**
	 * sqlId : platform.systems.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "platform.systems.splitPageSelect";

	/**
	 * sqlId : platform.systems.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "platform.systems.splitPageFrom";

}
