package little.ant.test.service;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;

import little.ant.platform.service.BaseService;

public class BlogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(BlogService.class);
	
	public static final BlogService service = Enhancer.enhance(BlogService.class);
	
}
