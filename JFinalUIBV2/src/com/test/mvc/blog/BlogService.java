package com.test.mvc.blog;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.platform.mvc.base.BaseService;

public class BlogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(BlogService.class);
	
	public static final BlogService service = Enhancer.enhance(BlogService.class);
	
}
