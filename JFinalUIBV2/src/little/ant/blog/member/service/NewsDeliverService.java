package little.ant.blog.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class NewsDeliverService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(NewsDeliverService.class);
	
	public static final NewsDeliverService service = Enhancer.enhance(NewsDeliverService.class, Tx.class);
	
}
