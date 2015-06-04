package little.ant.cms.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class QuestionsService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(QuestionsService.class);
	
	public static final QuestionsService service = MyTxProxy.newProxy(QuestionsService.class);
	
}
