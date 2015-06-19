package little.ant.blog.tourist.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class FavoriteService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(FavoriteService.class);
	
	public static final FavoriteService service = Enhancer.enhance(FavoriteService.class, Tx.class);
	
}
