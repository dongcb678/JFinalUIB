package com.platform.mvc.resources;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;

/**
 * 资源负载model
 * @author 董华健
 */
@SuppressWarnings("unused")
//@Table(tableName = "pt_resources")
public class Resources extends BaseModel<Resources> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Resources.class);
	
	public static final Resources dao = new Resources();

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
	 * 字段描述：系统名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_osname = "osname";
	
	/**
	 * 字段描述：ip地址 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ips = "ips";
	
	/**
	 * 字段描述：主机名称 
	 * 字段类型 ：character varying 
	 */
	public static final String column_hostname = "hostname";
	
	/**
	 * 字段描述：cpu数量 
	 * 字段类型 ：bigint 
	 */
	public static final String column_cpunumber = "cpunumber";
	
	/**
	 * 字段描述：cpu使用率 
	 * 字段类型 ：numeric 
	 */
	public static final String column_cpuratio = "cpuratio";
	
	/**
	 * 字段描述：物理内存 
	 * 字段类型 ：bigint 
	 */
	public static final String column_phymemory = "phymemory";
	
	/**
	 * 字段描述：物理可用内存 
	 * 字段类型 ：bigint 
	 */
	public static final String column_phyfreememory = "phyfreememory";
	
	/**
	 * 字段描述：jvm总内存 
	 * 字段类型 ：bigint 
	 */
	public static final String column_jvmtotalmemory = "jvmtotalmemory";
	
	/**
	 * 字段描述：jvm可用内存 
	 * 字段类型 ：bigint 
	 */
	public static final String column_jvmfreememory = "jvmfreememory";
	
	/**
	 * 字段描述：jvm最大内存 
	 * 字段类型 ：bigint 
	 */
	public static final String column_jvmmaxmemory = "jvmmaxmemory";
	
	/**
	 * 字段描述：gc次数 
	 * 字段类型 ：bigint 
	 */
	public static final String column_gccount = "gccount";
	
	/**
	 * 字段描述：创建时间 
	 * 字段类型 ：timestamp with time zone 
	 */
	public static final String column_createdate = "createdate";

	/**
	 * sqlId : platform.resources.pv_pg
	 * 描述：
	 */
	public static final String sqlId_pv_pg = "platform.resources.pv_pg";

	/**
	 * sqlId : platform.resources.pv_mysql
	 * 描述：
	 */
	public static final String sqlId_pv_mysql = "platform.resources.pv_mysql";

	/**
	 * sqlId : platform.resources.pv_oracle
	 * 描述：
	 */
	public static final String sqlId_pv_oracle = "platform.resources.pv_oracle";

	/**
	 * sqlId : platform.resources.24hour
	 * 描述：
	 */
	public static final String sqlId_24hour = "platform.resources.24hour";
	
}
