package little.ant.blog.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class TrampleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TrampleService.class);
	
	public static final TrampleService service = MyTxProxy.newProxy(TrampleService.class);
	
}
