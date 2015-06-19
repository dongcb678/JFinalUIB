package little.ant.cms.tourist.service;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class ContentService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ContentService.class);
	
	public static final ContentService service = Enhancer.enhance(ContentService.class, Tx.class);
	
}
