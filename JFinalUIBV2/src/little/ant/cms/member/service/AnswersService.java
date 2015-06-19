package little.ant.cms.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class AnswersService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnswersService.class);
	
	public static final AnswersService service = Enhancer.enhance(AnswersService.class, Tx.class);
	
}
