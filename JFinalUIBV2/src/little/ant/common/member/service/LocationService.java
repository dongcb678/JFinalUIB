package little.ant.common.member.service;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class LocationService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LocationService.class);
	
	public static final LocationService service = Enhancer.enhance(LocationService.class, Tx.class);
	
}
