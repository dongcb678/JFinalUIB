package little.ant.blog.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class ArticleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleService.class);
	
	public static final ArticleService service = MyTxProxy.newProxy(ArticleService.class);
	
}
