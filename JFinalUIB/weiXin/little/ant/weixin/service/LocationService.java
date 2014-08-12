package little.ant.weixin.service;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.service.BaseService;

import org.apache.log4j.Logger;

public class LocationService extends BaseService {

	private static Logger log = Logger.getLogger(LocationService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户位置管理：分页处理");
		String select = " select * ";
		splitPageBase(splitPage, select, "weixin.location.splitPage");
	}
	
}
