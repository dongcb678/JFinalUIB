package little.ant.cms.tourist.service;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class AnnouncementService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnnouncementService.class);
	
	public static final AnnouncementService service = Enhancer.enhance(AnnouncementService.class, Tx.class);
	
}
