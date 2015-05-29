package little.ant.common.admin.service;

import little.ant.common.model.Link;
import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;

import org.apache.log4j.Logger;

public class LinkService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LinkService.class);
	
	public static final LinkService service = MyTxProxy.newProxy(LinkService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantInit.db_dataSource_main, splitPage, select, "common.link.splitPage");
	}

	/**
	 * 保存
	 * @param link
	 * @param userIds
	 * @return
	 */
	public String save(Link link, String userIds){
		link.set(Link.colunm_createuser, userIds);
		link.set(Link.colunm_createdate, ToolDateTime.getSqlTimestamp(null));
		link.set(Link.colunm_isdelete, "0");
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
