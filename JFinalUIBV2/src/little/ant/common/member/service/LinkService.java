package little.ant.common.member.service;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class LinkService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LinkService.class);
	
	public static final LinkService service = Enhancer.enhance(LinkService.class, Tx.class);
	
}
