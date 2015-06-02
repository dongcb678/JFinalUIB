package little.ant.cms.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class DownloadService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DownloadService.class);
	
	public static final DownloadService service = MyTxProxy.newProxy(DownloadService.class);
	
}
