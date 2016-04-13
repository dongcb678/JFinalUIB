package com.platform.mvc.resources;

import java.math.BigDecimal;
import java.sql.Timestamp;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;

/**
 * 资源负载model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = "pt_resources")
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
	 * sqlId : platform.resources.pv
	 * 描述：
	 */
	public static final String sqlId_pv = "platform.resources.pv";

	/**
	 * sqlId : platform.resources.24hour
	 * 描述：
	 */
	public static final String sqlId_24hour = "platform.resources.24hour";

	private String ids;
	private String version;
	private String osname;
	private String ips;
	private String hostname;
	private String cpunumber;
	private String cpuratio;
	private String phymemory;
	private String phyfreememory;
	private String jvmtotalmemory;
	private String jvmfreememory;
	private String jvmmaxmemory;
	private String gccount;
	private String createdate;
	
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
	public void setOsname(String osname){
		set(column_osname, osname);
	}
	public String getOsname() {
		return get(column_osname);
	}
	public void setIps(String ips){
		set(column_ips, ips);
	}
	public String getIps() {
		return get(column_ips);
	}
	public void setHostname(String hostname){
		set(column_hostname, hostname);
	}
	public String getHostname() {
		return get(column_hostname);
	}
	public void setCpunumber(Long cpunumber){
		set(column_cpunumber, cpunumber);
	}
	public Long getCpunumber() {
		return get(column_cpunumber);
	}
	public void setCpuratio(BigDecimal cpuratio){
		set(column_cpuratio, cpuratio);
	}
	public BigDecimal getCpuratio() {
		return get(column_cpuratio);
	}
	public void setPhymemory(Long phymemory){
		set(column_phymemory, phymemory);
	}
	public Long getPhymemory() {
		return get(column_phymemory);
	}
	public void setPhyfreememory(Long phyfreememory){
		set(column_phyfreememory, phyfreememory);
	}
	public Long getPhyfreememory() {
		return get(column_phyfreememory);
	}
	public void setJvmtotalmemory(Long jvmtotalmemory){
		set(column_jvmtotalmemory, jvmtotalmemory);
	}
	public Long getJvmtotalmemory() {
		return get(column_jvmtotalmemory);
	}
	public void setJvmfreememory(Long jvmfreememory){
		set(column_jvmfreememory, jvmfreememory);
	}
	public Long getJvmfreememory() {
		return get(column_jvmfreememory);
	}
	public void setJvmmaxmemory(Long jvmmaxmemory){
		set(column_jvmmaxmemory, jvmmaxmemory);
	}
	public Long getJvmmaxmemory() {
		return get(column_jvmmaxmemory);
	}
	public void setGccount(Long gccount){
		set(column_gccount, gccount);
	}
	public Long getGccount() {
		return get(column_gccount);
	}
	public void setCreatedate(Timestamp createdate){
		set(column_createdate, createdate);
	}
	public Timestamp getCreatedate() {
		return get(column_createdate);
	}
	
}
