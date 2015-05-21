package little.ant.weixin.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
public class IndexService extends BaseService {

	private static Logger log = Logger.getLogger(IndexService.class);

	public static final IndexService service = MyTxProxy.newProxy(IndexService.class);
	
	

}
