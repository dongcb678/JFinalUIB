package little.ant.cms.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class PhotogalleryService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryService.class);
	
	public static final PhotogalleryService service = MyTxProxy.newProxy(PhotogalleryService.class);
	
}
