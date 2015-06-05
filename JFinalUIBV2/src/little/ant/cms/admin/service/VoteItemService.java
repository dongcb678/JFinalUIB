package little.ant.cms.admin.service;

import little.ant.cms.model.VoteItem;
import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class VoteItemService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(VoteItemService.class);
	
	public static final VoteItemService service = MyTxProxy.newProxy(VoteItemService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, VoteItem.sqlId_splitPage_select, VoteItem.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			VoteItem.dao.deleteById(id);
		}
	}
	
}
