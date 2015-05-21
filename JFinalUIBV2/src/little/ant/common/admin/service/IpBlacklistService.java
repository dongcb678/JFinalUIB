package little.ant.common.admin.service;

import little.ant.common.model.IpBlacklist;
import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.common.SplitPage;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;

import org.apache.log4j.Logger;

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
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "common.ipBlacklist.splitPage");
	}
	
	/**
	 * 保存
	 * @param ipBlacklist
	 * @param userIds
	 * @return
	 */
	public String save(IpBlacklist ipBlacklist, String userIds){
		ipBlacklist.set(IpBlacklist.colunm_createuser, userIds);
		ipBlacklist.set(IpBlacklist.colunm_createdate, ToolDateTime.getSqlTimestamp(null));
		ipBlacklist.set(IpBlacklist.colunm_isdelete, "0");
		ipBlacklist.save();
		return ipBlacklist.getPKValue();
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
