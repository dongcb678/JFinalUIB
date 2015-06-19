package little.ant.cms.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class AnnouncementService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnnouncementService.class);
	
	public static final AnnouncementService service = Enhancer.enhance(AnnouncementService.class, Tx.class);
	
}
