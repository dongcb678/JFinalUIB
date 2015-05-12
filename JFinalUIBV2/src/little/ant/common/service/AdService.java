package little.ant.common.service;

import little.ant.common.model.Ad;
import little.ant.common.model.IpBlacklist;
import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;

import org.apache.log4j.Logger;

public class AdService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AdService.class);
	
	public static final AdService service = new AdService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "common.ad.splitPage");
	}

	/**
	 * 保存
	 * @param ad
	 * @param userIds
	 * @return
	 */
	public String save(Ad ad, String userIds){
		ad.set(IpBlacklist.colunm_createuser, userIds);
		ad.set(IpBlacklist.colunm_createdate, ToolDateTime.getSqlTimestamp(null));
		ad.set(IpBlacklist.colunm_isdelete, "0");
		ad.save();
		return ad.getPKValue();
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Ad.dao.deleteById(id);
		}
	}
	
}
