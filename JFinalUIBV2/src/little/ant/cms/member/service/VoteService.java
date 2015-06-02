package little.ant.cms.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class VoteService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteService.class);
	
	public static final VoteService service = MyTxProxy.newProxy(VoteService.class);
	
}
