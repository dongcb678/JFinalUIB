package little.ant.cms.tourist.service;

import org.apache.log4j.Logger;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.constant.ConstantInit;
import little.ant.cms.model.YellowPage;

public class YellowPageService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(YellowPageService.class);
	
	public static final YellowPageService service = MyTxProxy.newProxy(YellowPageService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantInit.db_dataSource_main, splitPage, select, "src.yellowPage.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			YellowPage.dao.deleteById(id);
		}
	}
	
}
