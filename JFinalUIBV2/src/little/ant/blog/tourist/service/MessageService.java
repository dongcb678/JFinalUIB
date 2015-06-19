package little.ant.blog.tourist.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class MessageService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MessageService.class);
	
	public static final MessageService service = Enhancer.enhance(MessageService.class, Tx.class);
	
}
