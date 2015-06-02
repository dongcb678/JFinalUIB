package little.ant.common.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class AdService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AdService.class);
	
	public static final AdService service = MyTxProxy.newProxy(AdService.class);
	
}
