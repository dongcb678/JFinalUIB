package little.ant.blog.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class MessageService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MessageService.class);
	
	public static final MessageService service = MyTxProxy.newProxy(MessageService.class);
	
}
