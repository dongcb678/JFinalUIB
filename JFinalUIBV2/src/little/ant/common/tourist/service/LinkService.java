package little.ant.common.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class LinkService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LinkService.class);
	
	public static final LinkService service = MyTxProxy.newProxy(LinkService.class);
	
}
