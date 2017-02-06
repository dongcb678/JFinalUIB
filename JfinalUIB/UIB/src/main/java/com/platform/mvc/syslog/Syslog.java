package com.platform.mvc.syslog;

import java.sql.Timestamp;

import com.jfinal.log.Log;
import com.platform.annotation.Table;
import com.platform.mvc.base.BaseModel;

/**
 * 日志model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(tableName = Syslog.table_name)
public class Syslog extends BaseModel<Syslog> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static final Log log = Log.getLog(Syslog.class);
	
	public static final Syslog dao = new Syslog().dao();

	/**
	 * 表名称
	 */
	public static final String table_name = "pt_syslog";
	
	/**
	 * 字段描述：主键 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_ids = "ids";
	
	/**
	 * 字段描述：版本号 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_version = "version";
	
	/**
	 * 字段描述：action结束时间 
	 * 字段类型：timestamp without time zone  长度：null
	 */
	public static final String column_actionenddate = "actionenddate";
	
	/**
	 * 字段描述：action结束时间 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_actionendtime = "actionendtime";
	
	/**
	 * 字段描述：action耗时 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_actionhaoshi = "actionhaoshi";
	
	/**
	 * 字段描述：action开始时间 
	 * 字段类型：timestamp without time zone  长度：null
	 */
	public static final String column_actionstartdate = "actionstartdate";
	
	/**
	 * 字段描述：action开始时间 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_actionstarttime = "actionstarttime";
	
	/**
	 * 字段描述：失败原因 : 0没有权限,1URL不存在,2未登录,3业务代码异常 
	 * 字段类型：character  长度：1
	 */
	public static final String column_cause = "cause";
	
	/**
	 * 字段描述：cookie数据 
	 * 字段类型：character varying  长度：1024
	 */
	public static final String column_cookie = "cookie";
	
	/**
	 * 字段描述：描述 
	 * 字段类型：text  长度：null
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：结束时间 
	 * 字段类型：timestamp without time zone  长度：null
	 */
	public static final String column_enddate = "enddate";
	
	/**
	 * 字段描述：结束时间 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_endtime = "endtime";
	
	/**
	 * 字段描述：耗时 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_haoshi = "haoshi";
	
	/**
	 * 字段描述：客户端ip 
	 * 字段类型：character varying  长度：128
	 */
	public static final String column_ips = "ips";
	
	/**
	 * 字段描述：访问方法 
	 * 字段类型：character varying  长度：4
	 */
	public static final String column_method = "method";
	
	/**
	 * 字段描述：源引用 
	 * 字段类型：character varying  长度：500
	 */
	public static final String column_referer = "referer";
	
	/**
	 * 字段描述：请求路径 
	 * 字段类型：text  长度：null
	 */
	public static final String column_requestpath = "requestpath";
	
	/**
	 * 字段描述：开始时间 
	 * 字段类型：timestamp without time zone  长度：null
	 */
	public static final String column_startdate = "startdate";
	
	/**
	 * 字段描述：开始时间 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_starttime = "starttime";
	
	/**
	 * 字段描述：账号状态 
	 * 字段类型：character  长度：1
	 */
	public static final String column_status = "status";
	
	/**
	 * 字段描述：useragent 
	 * 字段类型：character varying  长度：1000
	 */
	public static final String column_useragent = "useragent";
	
	/**
	 * 字段描述：视图耗时 
	 * 字段类型：bigint  长度：null
	 */
	public static final String column_viewhaoshi = "viewhaoshi";
	
	/**
	 * 字段描述：菜单对应功能ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_operatorids = "operatorids";
	
	/**
	 * 字段描述：accept 
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_accept = "accept";
	
	/**
	 * 字段描述：acceptencoding 
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_acceptencoding = "acceptencoding";
	
	/**
	 * 字段描述：acceptlanguage 
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_acceptlanguage = "acceptlanguage";
	
	/**
	 * 字段描述：connection 
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_connection = "connection";
	
	/**
	 * 字段描述：host 
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_host = "host";
	
	/**
	 * 字段描述：xrequestedwith 
	 * 字段类型：character varying  长度：200
	 */
	public static final String column_xrequestedwith = "xrequestedwith";
	
	/**
	 * 字段描述：pvids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_pvids = "pvids";
	
	/**
	 * 字段描述：访问用户ids 
	 * 字段类型：character varying  长度：32
	 */
	public static final String column_userids = "userids";
	
	/**
	 * sqlId : platform.sysLog.view
	 * 描述：
	 */
	public static final String sqlId_view = "platform.sysLog.view";

	/**
	 * sqlId : platform.sysLog.splitPageSelect
	 * 描述：分页select
	 */
	public static final String sqlId_splitPageSelect = "platform.sysLog.splitPageSelect";

	/**
	 * sqlId : platform.sysLog.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPageFrom = "platform.sysLog.splitPageFrom";

	/**
	 * sqlId : platform.sysLog.clear
	 * 描述：清除数据
	 */
	public static final String sqlId_clear = "platform.sysLog.clear";

	private String ids;
	private Long version;
	private Timestamp actionenddate;
	private Long actionendtime;
	private Long actionhaoshi;
	private Timestamp actionstartdate;
	private Long actionstarttime;
	private String cause;
	private String cookie;
	private String description;
	private Timestamp enddate;
	private Long endtime;
	private Long haoshi;
	private String ips;
	private String method;
	private String referer;
	private String requestpath;
	private Timestamp startdate;
	private Long starttime;
	private String status;
	private String useragent;
	private Long viewhaoshi;
	private String operatorids;
	private String accept;
	private String acceptencoding;
	private String acceptlanguage;
	private String connection;
	private String host;
	private String xrequestedwith;
	private String pvids;
	private String userids;
	
	// 传值属性，不和数据库字段对应
	private String syslog;
	
	public String getSyslog() {
		return syslog;
	}
	public void setSyslog(String syslog) {
		this.syslog = syslog;
	}
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
	public void setActionenddate(Timestamp actionenddate){
		set(column_actionenddate, actionenddate);
	}
	public Timestamp getActionenddate() {
		return get(column_actionenddate);
	}
	public void setActionendtime(Long actionendtime){
		set(column_actionendtime, actionendtime);
	}
	public Long getActionendtime() {
		return get(column_actionendtime);
	}
	public void setActionhaoshi(Long actionhaoshi){
		set(column_actionhaoshi, actionhaoshi);
	}
	public Long getActionhaoshi() {
		return get(column_actionhaoshi);
	}
	public void setActionstartdate(Timestamp actionstartdate){
		set(column_actionstartdate, actionstartdate);
	}
	public Timestamp getActionstartdate() {
		return get(column_actionstartdate);
	}
	public void setActionstarttime(Long actionstarttime){
		set(column_actionstarttime, actionstarttime);
	}
	public Long getActionstarttime() {
		return get(column_actionstarttime);
	}
	public void setCause(String cause){
		set(column_cause, cause);
	}
	public String getCause() {
		return get(column_cause);
	}
	public void setCookie(String cookie){
		set(column_cookie, cookie);
	}
	public String getCookie() {
		return get(column_cookie);
	}
	public void setDescription(String description){
		set(column_description, description);
	}
	public String getDescription() {
		return get(column_description);
	}
	public void setEnddate(Timestamp enddate){
		set(column_enddate, enddate);
	}
	public Timestamp getEnddate() {
		return get(column_enddate);
	}
	public void setEndtime(Long endtime){
		set(column_endtime, endtime);
	}
	public Long getEndtime() {
		return get(column_endtime);
	}
	public void setHaoshi(Long haoshi){
		set(column_haoshi, haoshi);
	}
	public Long getHaoshi() {
		return get(column_haoshi);
	}
	public void setIps(String ips){
		set(column_ips, ips);
	}
	public String getIps() {
		return get(column_ips);
	}
	public void setMethod(String method){
		set(column_method, method);
	}
	public String getMethod() {
		return get(column_method);
	}
	public void setReferer(String referer){
		set(column_referer, referer);
	}
	public String getReferer() {
		return get(column_referer);
	}
	public void setRequestpath(String requestpath){
		set(column_requestpath, requestpath);
	}
	public String getRequestpath() {
		return get(column_requestpath);
	}
	public void setStartdate(Timestamp startdate){
		set(column_startdate, startdate);
	}
	public Timestamp getStartdate() {
		return get(column_startdate);
	}
	public void setStarttime(Long starttime){
		set(column_starttime, starttime);
	}
	public Long getStarttime() {
		return get(column_starttime);
	}
	public void setStatus(String status){
		set(column_status, status);
	}
	public String getStatus() {
		return get(column_status);
	}
	public void setUseragent(String useragent){
		set(column_useragent, useragent);
	}
	public String getUseragent() {
		return get(column_useragent);
	}
	public void setViewhaoshi(Long viewhaoshi){
		set(column_viewhaoshi, viewhaoshi);
	}
	public Long getViewhaoshi() {
		return get(column_viewhaoshi);
	}
	public void setOperatorids(String operatorids){
		set(column_operatorids, operatorids);
	}
	public String getOperatorids() {
		return get(column_operatorids);
	}
	public void setAccept(String accept){
		set(column_accept, accept);
	}
	public String getAccept() {
		return get(column_accept);
	}
	public void setAcceptencoding(String acceptencoding){
		set(column_acceptencoding, acceptencoding);
	}
	public String getAcceptencoding() {
		return get(column_acceptencoding);
	}
	public void setAcceptlanguage(String acceptlanguage){
		set(column_acceptlanguage, acceptlanguage);
	}
	public String getAcceptlanguage() {
		return get(column_acceptlanguage);
	}
	public void setConnection(String connection){
		set(column_connection, connection);
	}
	public String getConnection() {
		return get(column_connection);
	}
	public void setHost(String host){
		set(column_host, host);
	}
	public String getHost() {
		return get(column_host);
	}
	public void setXrequestedwith(String xrequestedwith){
		set(column_xrequestedwith, xrequestedwith);
	}
	public String getXrequestedwith() {
		return get(column_xrequestedwith);
	}
	public void setPvids(String pvids){
		set(column_pvids, pvids);
	}
	public String getPvids() {
		return get(column_pvids);
	}
	public void setUserids(String userids){
		set(column_userids, userids);
	}
	public String getUserids() {
		return get(column_userids);
	}
	
	
}
