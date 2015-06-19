package little.ant.cms.tourist.service;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

public class QuestionsService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(QuestionsService.class);
	
	public static final QuestionsService service = Enhancer.enhance(QuestionsService.class, Tx.class);
	
}
