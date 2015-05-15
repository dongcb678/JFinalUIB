package little.ant.cms.admin.service;

import org.apache.log4j.Logger;

import little.ant.platform.service.BaseService;
import little.ant.platform.common.SplitPage;
import little.ant.platform.common.ConstantPlatform;
import little.ant.cms.model.Column;

public class ColumnService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ColumnService.class);
	
	public static final ColumnService service = new ColumnService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "cms.column.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Column.dao.deleteById(id);
		}
	}
	
}
