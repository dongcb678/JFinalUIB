package little.ant.cms.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class TemplateService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TemplateService.class);
	
	public static final TemplateService service = Enhancer.enhance(TemplateService.class, Tx.class);
	
}
