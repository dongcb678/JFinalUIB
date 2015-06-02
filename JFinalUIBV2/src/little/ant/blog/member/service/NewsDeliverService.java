package little.ant.blog.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class NewsDeliverService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(NewsDeliverService.class);
	
	public static final NewsDeliverService service = MyTxProxy.newProxy(NewsDeliverService.class);
	
}
