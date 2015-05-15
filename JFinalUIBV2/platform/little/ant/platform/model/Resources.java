package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.ConstantPlatform;

import org.apache.log4j.Logger;

/**
 * 资源负载model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = ConstantPlatform.db_dataSource_main, tableName = "pt_resources")
public class Resources extends BaseModel<Resources> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Resources.class);
	
	public static final Resources dao = new Resources();

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
	 * 字段描述：系统名称 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_osname = "osname";
	
	/**
	 * 字段描述：ip地址 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_ips = "ips";
	
	/**
	 * 字段描述：主机名称 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_hostname = "hostname";
	
	/**
	 * 字段描述：cpu数量 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_cpunumber = "cpunumber";
	
	/**
	 * 字段描述：cpu使用率 
	 * 字段类型 ：numeric 
	 */
	public static final String colunm_cpuratio = "cpuratio";
	
	/**
	 * 字段描述：物理内存 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_phymemory = "phymemory";
	
	/**
	 * 字段描述：物理可用内存 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_phyfreememory = "phyfreememory";
	
	/**
	 * 字段描述：jvm总内存 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_jvmtotalmemory = "jvmtotalmemory";
	
	/**
	 * 字段描述：jvm可用内存 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_jvmfreememory = "jvmfreememory";
	
	/**
	 * 字段描述：jvm最大内存 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_jvmmaxmemory = "jvmmaxmemory";
	
	/**
	 * 字段描述：gc次数 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_gccount = "gccount";
	
	/**
	 * 字段描述：创建时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String colunm_createdate = "createdate";
	
}
