package little.ant.cms.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class VoteService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteService.class);
	
	public static final VoteService service = Enhancer.enhance(VoteService.class, Tx.class);
	
}
