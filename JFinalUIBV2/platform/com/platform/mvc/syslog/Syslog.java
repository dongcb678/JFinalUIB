package com.platform.mvc.syslog;

import org.apache.log4j.Logger;

import com.platform.annotation.Table;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseModel;

/**
 * 日志model
 * @author 董华健
 */
@SuppressWarnings("unused")
//@Table(tableName = "pt_syslog")
public class Syslog extends BaseModel<Syslog> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Syslog.class);
	
	public static final Syslog dao = new Syslog();

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
	 * 字段描述：action结束时间 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String column_actionenddate = "actionenddate";
	
	/**
	 * 字段描述：action结束时间 
	 * 字段类型 ：bigint 
	 */
	public static final String column_actionendtime = "actionendtime";
	
	/**
	 * 字段描述：action耗时 
	 * 字段类型 ：bigint 
	 */
	public static final String column_actionhaoshi = "actionhaoshi";
	
	/**
	 * 字段描述：action开始时间 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String column_actionstartdate = "actionstartdate";
	
	/**
	 * 字段描述：action开始时间 
	 * 字段类型 ：bigint 
	 */
	public static final String column_actionstarttime = "actionstarttime";
	
	/**
	 * 字段描述：失败原因 : 0没有权限,1URL不存在,2未登录,3业务代码异常 
	 * 字段类型 ：character 
	 */
	public static final String column_cause = "cause";
	
	/**
	 * 字段描述：cookie数据 
	 * 字段类型 ：character varying 
	 */
	public static final String column_cookie = "cookie";
	
	/**
	 * 字段描述：描述 
	 * 字段类型 ：text 
	 */
	public static final String column_description = "description";
	
	/**
	 * 字段描述：结束时间 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String column_enddate = "enddate";
	
	/**
	 * 字段描述：结束时间 
	 * 字段类型 ：bigint 
	 */
	public static final String column_endtime = "endtime";
	
	/**
	 * 字段描述：耗时 
	 * 字段类型 ：bigint 
	 */
	public static final String column_haoshi = "haoshi";
	
	/**
	 * 字段描述：客户端ip 
	 * 字段类型 ：character varying 
	 */
	public static final String column_ips = "ips";
	
	/**
	 * 字段描述：访问方法 
	 * 字段类型 ：character varying 
	 */
	public static final String column_method = "method";
	
	/**
	 * 字段描述：源引用 
	 * 字段类型 ：character varying 
	 */
	public static final String column_referer = "referer";
	
	/**
	 * 字段描述：请求路径 
	 * 字段类型 ：text 
	 */
	public static final String column_requestpath = "requestpath";
	
	/**
	 * 字段描述：开始时间 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String column_startdate = "startdate";
	
	/**
	 * 字段描述：开始时间 
	 * 字段类型 ：bigint 
	 */
	public static final String column_starttime = "starttime";
	
	/**
	 * 字段描述：账号状态 
	 * 字段类型 ：character 
	 */
	public static final String column_status = "status";
	
	/**
	 * 字段描述：useragent 
	 * 字段类型 ：character varying 
	 */
	public static final String column_useragent = "useragent";
	
	/**
	 * 字段描述：视图耗时 
	 * 字段类型 ：bigint 
	 */
	public static final String column_viewhaoshi = "viewhaoshi";
	
	/**
	 * 字段描述：菜单对应功能ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_operatorids = "operatorids";
	
	/**
	 * 字段描述：accept 
	 * 字段类型 ：character varying 
	 */
	public static final String column_accept = "accept";
	
	/**
	 * 字段描述：acceptencoding 
	 * 字段类型 ：character varying 
	 */
	public static final String column_acceptencoding = "acceptencoding";
	
	/**
	 * 字段描述：acceptlanguage 
	 * 字段类型 ：character varying 
	 */
	public static final String column_acceptlanguage = "acceptlanguage";
	
	/**
	 * 字段描述：connection 
	 * 字段类型 ：character varying 
	 */
	public static final String column_connection = "connection";
	
	/**
	 * 字段描述：host 
	 * 字段类型 ：character varying 
	 */
	public static final String column_host = "host";
	
	/**
	 * 字段描述：xrequestedwith 
	 * 字段类型 ：character varying 
	 */
	public static final String column_xrequestedwith = "xrequestedwith";
	
	/**
	 * 字段描述：pvids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_pvids = "pvids";
	
	/**
	 * 字段描述：访问用户ids 
	 * 字段类型 ：character varying 
	 */
	public static final String column_userids = "userids";

	/**
	 * sqlId : platform.sysLog.view
	 * 描述：
	 */
	public static final String sqlId_view = "platform.sysLog.view";

	/**
	 * sqlId : platform.sysLog.splitPageSelect
	 * 描述：分页Select
	 */
	public static final String sqlId_splitPage_select = "platform.sysLog.splitPageSelect";

	/**
	 * sqlId : platform.sysLog.splitPageFrom
	 * 描述：分页from
	 */
	public static final String sqlId_splitPage_from = "platform.sysLog.splitPageFrom";

	/**
	 * sqlId : platform.sysLog.clear
	 * 描述：清除数据
	 */
	public static final String sqlId_clear = "platform.sysLog.clear";

}
