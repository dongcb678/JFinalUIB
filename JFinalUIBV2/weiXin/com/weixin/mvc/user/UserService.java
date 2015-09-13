package com.weixin.mvc.user;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.platform.mvc.base.BaseService;

public class UserService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UserService.class);

	public static final UserService service = Enhancer.enhance(UserService.class);
	
}
