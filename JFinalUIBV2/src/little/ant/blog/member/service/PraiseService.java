package little.ant.blog.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class PraiseService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PraiseService.class);
	
	public static final PraiseService service = MyTxProxy.newProxy(PraiseService.class);
	
}
