package little.ant.cms.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class VoteItemService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteItemService.class);
	
	public static final VoteItemService service = Enhancer.enhance(VoteItemService.class, Tx.class);
	
}
