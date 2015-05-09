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
	 * 主键
	 */
	public static final String colunm_ids = "ids";
	
	/**
	 * 版本号
	 */
	public static final String colunm_version = "version";
	
	/**
	 * action结束时间
	 */
	public static final String colunm_actionenddate = "actionenddate";
	
	/**
	 * action结束时间
	 */
	public static final String colunm_actionendtime = "actionendtime";
	
	/**
	 * action耗时
	 */
	public static final String colunm_actionhaoshi = "actionhaoshi";
	
	/**
	 * action开始时间
	 */
	public static final String colunm_actionstartdate = "actionstartdate";
	
	/**
	 * action开始时间
	 */
	public static final String colunm_actionstarttime = "actionstarttime";
	
	/**
	 * 失败原因 : 0没有权限,1URL不存在,2未登录,3业务代码异常
	 */
	public static final String colunm_cause = "cause";
	
	/**
	 * cookie数据
	 */
	public static final String colunm_cookie = "cookie";
	
	/**
	 * 描述
	 */
	public static final String colunm_description = "description";
	
	/**
	 * 结束时间
	 */
	public static final String colunm_enddate = "enddate";
	
	/**
	 * 结束时间
	 */
	public static final String colunm_endtime = "endtime";
	
	/**
	 * 耗时
	 */
	public static final String colunm_haoshi = "haoshi";
	
	/**
	 * 客户端ip
	 */
	public static final String colunm_ips = "ips";
	
	/**
	 * 访问方法
	 */
	public static final String colunm_method = "method";
	
	/**
	 * 源引用
	 */
	public static final String colunm_referer = "referer";
	
	/**
	 * 请求路径
	 */
	public static final String colunm_requestpath = "requestpath";
	
	/**
	 * 开始时间
	 */
	public static final String colunm_startdate = "startdate";
	
	/**
	 * 开始时间
	 */
	public static final String colunm_starttime = "starttime";
	
	/**
	 * 账号状态
	 */
	public static final String colunm_status = "status";
	
	/**
	 * useragent
	 */
	public static final String colunm_useragent = "useragent";
	
	/**
	 * 视图耗时
	 */
	public static final String colunm_viewhaoshi = "viewhaoshi";
	
	/**
	 * 菜单对应功能ids
	 */
	public static final String colunm_operatorids = "operatorids";
	
	/**
	 * accept
	 */
	public static final String colunm_accept = "accept";
	
	/**
	 * acceptencoding
	 */
	public static final String colunm_acceptencoding = "acceptencoding";
	
	/**
	 * acceptlanguage
	 */
	public static final String colunm_acceptlanguage = "acceptlanguage";
	
	/**
	 * connection
	 */
	public static final String colunm_connection = "connection";
	
	/**
	 * host
	 */
	public static final String colunm_host = "host";
	
	/**
	 * xrequestedwith
	 */
	public static final String colunm_xrequestedwith = "xrequestedwith";
	
	/**
	 * pvids
	 */
	public static final String colunm_pvids = "pvids";
	
	/**
	 * 访问用户ids
	 */
	public static final String colunm_userids = "userids";
	
}
