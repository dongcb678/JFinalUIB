package little.ant.platform.service;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.model.Syslog;

import org.apache.log4j.Logger;

public class SysLogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogService.class);

	public static final SysLogService service = new SysLogService();
	
	public Syslog view(String ids){
		String sql = getSql("platform.sysLog.view");
		return Syslog.dao.findFirst(sql, ids);
	}

	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select sy.names synames, m.names mnames, o.names onames, o.url ourl, u.username, s.* ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "platform.sysLog.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String logIds : idsArr) {
			Syslog.dao.deleteById(logIds);
		}
	}
	
}
