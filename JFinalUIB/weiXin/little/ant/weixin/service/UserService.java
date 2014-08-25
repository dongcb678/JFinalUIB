package little.ant.weixin.service;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.service.BaseService;

import org.apache.log4j.Logger;

public class UserService extends BaseService {

	private static Logger log = Logger.getLogger(UserService.class);

	public static final UserService service = new UserService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户管理：分页处理");
		String select = " select * ";
		splitPageBase(splitPage, select, "weixin.user.splitPage");
	}
	
}
