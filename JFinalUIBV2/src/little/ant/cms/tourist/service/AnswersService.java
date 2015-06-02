package little.ant.cms.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class AnswersService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnswersService.class);
	
	public static final AnswersService service = MyTxProxy.newProxy(AnswersService.class);
	
}
