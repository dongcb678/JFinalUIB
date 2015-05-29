package little.ant.weixin.service;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class UserService extends BaseService {

	private static Logger log = Logger.getLogger(UserService.class);

	public static final UserService service = MyTxProxy.newProxy(UserService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户管理：分页处理");
		String select = " select * ";
		splitPageBase(ConstantInit.db_dataSource_main, splitPage, select, "weixin.user.splitPage");
	}
	
}
