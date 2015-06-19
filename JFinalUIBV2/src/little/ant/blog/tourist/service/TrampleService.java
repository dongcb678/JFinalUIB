package little.ant.blog.tourist.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class TrampleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TrampleService.class);
	
	public static final TrampleService service = Enhancer.enhance(TrampleService.class, Tx.class);
	
}
