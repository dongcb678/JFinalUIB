package little.ant.cms.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class JobService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(JobService.class);
	
	public static final JobService service = Enhancer.enhance(JobService.class, Tx.class);
	
}
