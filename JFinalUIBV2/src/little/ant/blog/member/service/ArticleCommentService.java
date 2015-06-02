package little.ant.blog.member.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class ArticleCommentService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleCommentService.class);
	
	public static final ArticleCommentService service = MyTxProxy.newProxy(ArticleCommentService.class);
	
}
