package little.ant.blog.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class FavoriteService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(FavoriteService.class);
	
	public static final FavoriteService service = MyTxProxy.newProxy(FavoriteService.class);
	
}
