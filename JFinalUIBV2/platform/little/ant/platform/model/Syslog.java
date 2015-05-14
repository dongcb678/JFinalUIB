package little.ant.platform.model;

import little.ant.platform.annotation.Table;
import little.ant.platform.common.DictKeys;

import org.apache.log4j.Logger;

/**
 * 日志model
 * @author 董华健
 */
@SuppressWarnings("unused")
@Table(dataSourceName = DictKeys.db_dataSource_main, tableName = "pt_syslog")
public class Syslog extends BaseModel<Syslog> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Syslog.class);
	
	public static final Syslog dao = new Syslog();

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
	 * 字段描述：action结束时间 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String colunm_actionenddate = "actionenddate";
	
	/**
	 * 字段描述：action结束时间 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_actionendtime = "actionendtime";
	
	/**
	 * 字段描述：action耗时 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_actionhaoshi = "actionhaoshi";
	
	/**
	 * 字段描述：action开始时间 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String colunm_actionstartdate = "actionstartdate";
	
	/**
	 * 字段描述：action开始时间 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_actionstarttime = "actionstarttime";
	
	/**
	 * 字段描述：失败原因 : 0没有权限,1URL不存在,2未登录,3业务代码异常 
	 * 字段类型 ：character 
	 */
	public static final String colunm_cause = "cause";
	
	/**
	 * 字段描述：cookie数据 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_cookie = "cookie";
	
	/**
	 * 字段描述：描述 
	 * 字段类型 ：text 
	 */
	public static final String colunm_description = "description";
	
	/**
	 * 字段描述：结束时间 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String colunm_enddate = "enddate";
	
	/**
	 * 字段描述：结束时间 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_endtime = "endtime";
	
	/**
	 * 字段描述：耗时 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_haoshi = "haoshi";
	
	/**
	 * 字段描述：客户端ip 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_ips = "ips";
	
	/**
	 * 字段描述：访问方法 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_method = "method";
	
	/**
	 * 字段描述：源引用 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_referer = "referer";
	
	/**
	 * 字段描述：请求路径 
	 * 字段类型 ：text 
	 */
	public static final String colunm_requestpath = "requestpath";
	
	/**
	 * 字段描述：开始时间 
	 * 字段类型 ：timestamp without time zone 
	 */
	public static final String colunm_startdate = "startdate";
	
	/**
	 * 字段描述：开始时间 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_starttime = "starttime";
	
	/**
	 * 字段描述：账号状态 
	 * 字段类型 ：character 
	 */
	public static final String colunm_status = "status";
	
	/**
	 * 字段描述：useragent 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_useragent = "useragent";
	
	/**
	 * 字段描述：视图耗时 
	 * 字段类型 ：bigint 
	 */
	public static final String colunm_viewhaoshi = "viewhaoshi";
	
	/**
	 * 字段描述：菜单对应功能ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_operatorids = "operatorids";
	
	/**
	 * 字段描述：accept 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_accept = "accept";
	
	/**
	 * 字段描述：acceptencoding 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_acceptencoding = "acceptencoding";
	
	/**
	 * 字段描述：acceptlanguage 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_acceptlanguage = "acceptlanguage";
	
	/**
	 * 字段描述：connection 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_connection = "connection";
	
	/**
	 * 字段描述：host 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_host = "host";
	
	/**
	 * 字段描述：xrequestedwith 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_xrequestedwith = "xrequestedwith";
	
	/**
	 * 字段描述：pvids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_pvids = "pvids";
	
	/**
	 * 字段描述：访问用户ids 
	 * 字段类型 ：character varying 
	 */
	public static final String colunm_userids = "userids";
	
}
