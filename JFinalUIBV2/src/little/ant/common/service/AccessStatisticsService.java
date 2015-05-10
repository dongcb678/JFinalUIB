package little.ant.common.service;

import org.apache.log4j.Logger;

import little.ant.platform.service.BaseService;
import little.ant.platform.common.SplitPage;
import little.ant.platform.common.DictKeys;
import little.ant.common.model.AccessStatistics;

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
