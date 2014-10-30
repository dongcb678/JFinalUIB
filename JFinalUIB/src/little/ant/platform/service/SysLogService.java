package little.ant.platform.service;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.model.Syslog;
import little.ant.platform.tools.ToolSqlXml;

import org.apache.log4j.Logger;

public class SysLogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogService.class);

	public static final SysLogService service = new SysLogService();
	
	public Syslog view(String ids){
		String sql = ToolSqlXml.getSql("pingtai.sysLog.view");
		return Syslog.dao.findFirst(sql, ids);
	}

	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select o.names onames, o.url ourl, u.username, s.* ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "pingtai.sysLog.splitPage");
	}
	
}
