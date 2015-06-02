package little.ant.cms.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class YellowPageService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(YellowPageService.class);
	
	public static final YellowPageService service = MyTxProxy.newProxy(YellowPageService.class);
	
}
