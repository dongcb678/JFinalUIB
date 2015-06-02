package little.ant.blog.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class CircleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CircleService.class);
	
	public static final CircleService service = MyTxProxy.newProxy(CircleService.class);
	
}
