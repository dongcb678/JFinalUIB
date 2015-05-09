package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;

import org.apache.log4j.Logger;

/**
 * 系统model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_systems")
public class Systems extends BaseModel<Systems> {

	private static final long serialVersionUID = 6761767368352810428L;

	private static Logger log = Logger.getLogger(Systems.class);
	
	public static final Systems dao = new Systems();

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
	 * 名称
	 */
	public static final String colunm_names = "names";
	
	/**
	 * 编号
	 */
	public static final String colunm_numbers = "numbers";
	
	/**
	 * 排序号
	 */
	public static final String colunm_orderids = "orderids";
	
}
