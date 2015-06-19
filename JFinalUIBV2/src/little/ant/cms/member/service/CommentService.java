package little.ant.cms.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class CommentService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CommentService.class);
	
	public static final CommentService service = Enhancer.enhance(CommentService.class, Tx.class);
	
}
