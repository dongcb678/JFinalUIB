package little.ant.cms.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class YellowPageService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(YellowPageService.class);
	
	public static final YellowPageService service = Enhancer.enhance(YellowPageService.class, Tx.class);
	
}
