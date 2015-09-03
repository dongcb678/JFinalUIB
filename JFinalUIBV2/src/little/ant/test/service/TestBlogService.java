package little.ant.test.service;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;

import little.ant.platform.service.BaseService;

public class TestBlogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TestBlogService.class);
	
	public static final TestBlogService service = Enhancer.enhance(TestBlogService.class);
	
}
