package little.ant.blog.tourist.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class TypeService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TypeService.class);
	
	public static final TypeService service = MyTxProxy.newProxy(TypeService.class);
	
}
