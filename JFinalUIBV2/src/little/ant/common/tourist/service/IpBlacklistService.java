package little.ant.common.tourist.service;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class IpBlacklistService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IpBlacklistService.class);
	
	public static final IpBlacklistService service = Enhancer.enhance(IpBlacklistService.class, Tx.class);
	
}
