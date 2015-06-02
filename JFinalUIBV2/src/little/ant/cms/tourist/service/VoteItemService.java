package little.ant.cms.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class VoteItemService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteItemService.class);
	
	public static final VoteItemService service = MyTxProxy.newProxy(VoteItemService.class);
	
}
