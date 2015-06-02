package little.ant.cms.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class PhotogalleryItemService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryItemService.class);
	
	public static final PhotogalleryItemService service = MyTxProxy.newProxy(PhotogalleryItemService.class);
	
}
