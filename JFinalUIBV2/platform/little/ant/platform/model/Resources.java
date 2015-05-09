package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;

import org.apache.log4j.Logger;

/**
 * 资源负载model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_resources")
public class Resources extends BaseModel<Resources> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Resources.class);
	
	public static final Resources dao = new Resources();

	/**
	 * 主键
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 版本号
	 */
	public static final String colunm_version = "version";
	
	/**
	 * 系统名称
	 */
	public static final String colunm_osname = "osname";
	
	/**
	 * ip地址
	 */
	public static final String colunm_ips = "ips";
	
	/**
	 * 主机名称
	 */
	public static final String colunm_hostname = "hostname";
	
	/**
	 * cpu数量
	 */
	public static final String colunm_cpunumber = "cpunumber";
	
	/**
	 * cpu使用率
	 */
	public static final String colunm_cpuratio = "cpuratio";
	
	/**
	 * 物理内存
	 */
	public static final String colunm_phymemory = "phymemory";
	
	/**
	 * 物理可用内存
	 */
	public static final String colunm_phyfreememory = "phyfreememory";
	
	/**
	 * jvm总内存
	 */
	public static final String colunm_jvmtotalmemory = "jvmtotalmemory";
	
	/**
	 * jvm可用内存
	 */
	public static final String colunm_jvmfreememory = "jvmfreememory";
	
	/**
	 * jvm最大内存
	 */
	public static final String colunm_jvmmaxmemory = "jvmmaxmemory";
	
	/**
	 * gc次数
	 */
	public static final String colunm_gccount = "gccount";
	
	/**
	 * 创建时间
	 */
	public static final String colunm_createdate = "createdate";
	
}
