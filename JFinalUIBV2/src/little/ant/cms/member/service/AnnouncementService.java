package little.ant.cms.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class AnnouncementService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnnouncementService.class);
	
	public static final AnnouncementService service = MyTxProxy.newProxy(AnnouncementService.class);
	
}
