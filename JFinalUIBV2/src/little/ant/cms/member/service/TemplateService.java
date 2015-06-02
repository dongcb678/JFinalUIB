package little.ant.cms.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class TemplateService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TemplateService.class);
	
	public static final TemplateService service = MyTxProxy.newProxy(TemplateService.class);
	
}
