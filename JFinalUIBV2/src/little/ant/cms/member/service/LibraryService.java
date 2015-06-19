package little.ant.cms.member.service;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class LibraryService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LibraryService.class);
	
	public static final LibraryService service = Enhancer.enhance(LibraryService.class, Tx.class);
	
}
