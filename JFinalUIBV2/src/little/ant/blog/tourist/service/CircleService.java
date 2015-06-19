package little.ant.blog.tourist.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class CircleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CircleService.class);
	
	public static final CircleService service = Enhancer.enhance(CircleService.class, Tx.class);
	
}
