package little.ant.blog.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class CircleuserService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CircleuserService.class);
	
	public static final CircleuserService service = MyTxProxy.newProxy(CircleuserService.class);
	
}
