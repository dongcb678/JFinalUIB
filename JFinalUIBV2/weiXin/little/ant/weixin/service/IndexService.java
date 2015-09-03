package little.ant.weixin.service;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;

import little.ant.platform.service.BaseService;

@SuppressWarnings("unused")
public class IndexService extends BaseService {

	private static Logger log = Logger.getLogger(IndexService.class);

	public static final IndexService service = Enhancer.enhance(IndexService.class);
	
	

}
