package little.ant.pingtai.service;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.Syslog;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

public class SysLogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogService.class);
	
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
		splitPageBase(splitPage, select, "pingtai.sysLog.splitPage");
	}
	
}
