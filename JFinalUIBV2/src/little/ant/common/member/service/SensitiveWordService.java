package little.ant.common.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class SensitiveWordService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SensitiveWordService.class);
	
	public static final SensitiveWordService service = MyTxProxy.newProxy(SensitiveWordService.class);
	
}
