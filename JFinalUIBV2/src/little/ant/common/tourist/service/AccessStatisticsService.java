package little.ant.common.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class AccessStatisticsService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AccessStatisticsService.class);
	
	public static final AccessStatisticsService service = MyTxProxy.newProxy(AccessStatisticsService.class);
	
}
