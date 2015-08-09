package little.ant.weixin.service;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

public class LocationService extends BaseService {

	private static Logger log = Logger.getLogger(LocationService.class);

	public static final LocationService service = Enhancer.enhance(LocationService.class, Tx.class);
	
}
