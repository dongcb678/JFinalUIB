package little.ant.blog.tourist.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class LinkService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LinkService.class);
	
	public static final LinkService service = Enhancer.enhance(LinkService.class, Tx.class);
	
}
