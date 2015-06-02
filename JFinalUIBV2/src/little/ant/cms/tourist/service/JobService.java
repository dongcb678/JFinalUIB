package little.ant.cms.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class JobService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(JobService.class);
	
	public static final JobService service = MyTxProxy.newProxy(JobService.class);
	
}
