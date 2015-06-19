package little.ant.blog.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class ArticleCommentService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleCommentService.class);
	
	public static final ArticleCommentService service = Enhancer.enhance(ArticleCommentService.class, Tx.class);
	
}
