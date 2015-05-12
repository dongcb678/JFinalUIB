package little.ant.common.service;

import little.ant.common.model.IpBlacklist;
import little.ant.common.model.Link;
import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;

import org.apache.log4j.Logger;

public class LinkService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LinkService.class);
	
	public static final LinkService service = new LinkService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "common.link.splitPage");
	}

	/**
	 * 保存
	 * @param link
	 * @param userIds
	 * @return
	 */
	public String save(Link link, String userIds){
		link.set(IpBlacklist.colunm_createuser, userIds);
		link.set(IpBlacklist.colunm_createdate, ToolDateTime.getSqlTimestamp(null));
		link.set(IpBlacklist.colunm_isdelete, "0");
		link.save();
		return link.getPKValue();
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Link.dao.deleteById(id);
		}
	}
	
}
