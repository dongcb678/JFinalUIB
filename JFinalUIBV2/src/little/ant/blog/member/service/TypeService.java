package little.ant.blog.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class TypeService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TypeService.class);
	
	public static final TypeService service = Enhancer.enhance(TypeService.class, Tx.class);
	
}
