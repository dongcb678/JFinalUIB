package little.ant.common.tourist.service;

import org.apache.log4j.Logger;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.constant.ConstantInit;
import little.ant.common.model.IpBlacklist;

public class IpBlacklistService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(IpBlacklistService.class);
	
	public static final IpBlacklistService service = MyTxProxy.newProxy(IpBlacklistService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantInit.db_dataSource_main, splitPage, select, "src.ipBlacklist.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			IpBlacklist.dao.deleteById(id);
		}
	}
	
}
