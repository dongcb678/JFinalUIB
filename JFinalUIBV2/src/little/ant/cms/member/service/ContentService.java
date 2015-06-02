package little.ant.cms.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class ContentService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ContentService.class);
	
	public static final ContentService service = MyTxProxy.newProxy(ContentService.class);
	
}
