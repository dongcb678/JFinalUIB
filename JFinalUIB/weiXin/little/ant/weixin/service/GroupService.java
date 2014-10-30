package little.ant.weixin.service;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class GroupService extends BaseService {

	private static Logger log = Logger.getLogger(GroupService.class);

	public static final GroupService service = new GroupService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户分组管理：分页处理");
		String select = " select * ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "weixin.group.splitPage");
	}
	
}
