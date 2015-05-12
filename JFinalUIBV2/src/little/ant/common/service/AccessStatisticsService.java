package little.ant.common.service;

import little.ant.common.model.AccessStatistics;
import little.ant.common.model.IpBlacklist;
import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;

import org.apache.log4j.Logger;

public class AccessStatisticsService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AccessStatisticsService.class);
	
	public static final AccessStatisticsService service = new AccessStatisticsService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "common.accessStatistics.splitPage");
	}

	/**
	 * 保存
	 * @param accessStatistics
	 * @param userIds
	 * @return
	 */
	public String save(AccessStatistics accessStatistics, String userIds){
		accessStatistics.set(IpBlacklist.colunm_createuser, userIds);
		accessStatistics.set(IpBlacklist.colunm_createdate, ToolDateTime.getSqlTimestamp(null));
		accessStatistics.set(IpBlacklist.colunm_isdelete, "0");
		accessStatistics.save();
		return accessStatistics.getPKValue();
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			AccessStatistics.dao.deleteById(id);
		}
	}
	
}
