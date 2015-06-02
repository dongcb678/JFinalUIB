package little.ant.blog.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class MoveService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MoveService.class);
	
	public static final MoveService service = MyTxProxy.newProxy(MoveService.class);
	
}
