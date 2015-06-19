package little.ant.cms.tourist.service;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class PhotogalleryItemService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryItemService.class);
	
	public static final PhotogalleryItemService service = Enhancer.enhance(PhotogalleryItemService.class, Tx.class);
	
}
