package little.ant.blog.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class MoveCommentService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MoveCommentService.class);
	
	public static final MoveCommentService service = MyTxProxy.newProxy(MoveCommentService.class);
	
}
