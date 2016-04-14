package com.test.mvc.blog;

import org.apache.log4j.Logger;

import com.platform.annotation.Service;
import com.platform.mvc.base.BaseService;

@Service(name = "blogService")
public class BlogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(BlogService.class);
	
}
