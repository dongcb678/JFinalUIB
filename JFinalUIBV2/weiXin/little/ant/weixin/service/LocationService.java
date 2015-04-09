package little.ant.weixin.service;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class LocationService extends BaseService {

	private static Logger log = Logger.getLogger(LocationService.class);

	public static final LocationService service = new LocationService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户位置管理：分页处理");
		String select = " select * ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "weixin.location.splitPage");
	}
	
}
