package little.ant.common.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class LocationService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LocationService.class);
	
	public static final LocationService service = MyTxProxy.newProxy(LocationService.class);
	
}
