package little.ant.blog.admin.service;

import little.ant.blog.model.Trample;
import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class TrampleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TrampleService.class);
	
	public static final TrampleService service = MyTxProxy.newProxy(TrampleService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Trample.sqlId_splitPage_select, Trample.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Trample.dao.deleteById(id);
		}
	}
	
}
