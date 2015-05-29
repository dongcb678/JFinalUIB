package little.ant.weixin.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class LocationService extends BaseService {

	private static Logger log = Logger.getLogger(LocationService.class);

	public static final LocationService service = MyTxProxy.newProxy(LocationService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户位置管理：分页处理");
		String select = " select * ";
		splitPageBase(ConstantInit.db_dataSource_main, splitPage, select, "weixin.location.splitPage");
	}
	
}
