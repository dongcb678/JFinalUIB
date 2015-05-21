package little.ant.common.admin.service;

import little.ant.common.model.Ad;
import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.common.SplitPage;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;

import org.apache.log4j.Logger;

public class AdService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AdService.class);
	
	public static final AdService service = MyTxProxy.newProxy(AdService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "common.ad.splitPage");
	}

	/**
	 * 保存
	 * @param ad
	 * @param userIds
	 * @return
	 */
	public String save(Ad ad, String userIds){
		ad.set(Ad.colunm_createuser, userIds);
		ad.set(Ad.colunm_createdate, ToolDateTime.getSqlTimestamp(null));
		ad.set(Ad.colunm_isdelete, "0");
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
