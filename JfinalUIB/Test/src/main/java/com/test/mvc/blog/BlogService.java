package com.test.mvc.blog;

import com.jfinal.log.Log;
import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;

@Service(name = BlogService.serviceName)
public class BlogService extends BaseService {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(BlogService.class);
	
	public static final String serviceName = "blogService";
	
}
