package little.ant.common.tourist.service;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class AccessStatisticsService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AccessStatisticsService.class);
	
	public static final AccessStatisticsService service = Enhancer.enhance(AccessStatisticsService.class, Tx.class);
	
}
