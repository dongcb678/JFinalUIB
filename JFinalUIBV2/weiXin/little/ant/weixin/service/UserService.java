package little.ant.weixin.service;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;

import little.ant.platform.service.BaseService;

public class UserService extends BaseService {

	private static Logger log = Logger.getLogger(UserService.class);

	public static final UserService service = Enhancer.enhance(UserService.class);
	
}
