package little.ant.common.tourist.service;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class AdService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AdService.class);
	
	public static final AdService service = Enhancer.enhance(AdService.class, Tx.class);
	
}
