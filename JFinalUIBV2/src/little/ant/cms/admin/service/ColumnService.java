package little.ant.cms.admin.service;

import little.ant.cms.model.Column;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class ColumnService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ColumnService.class);
	
	public static final ColumnService service = Enhancer.enhance(ColumnService.class, Tx.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Column.sqlId_splitPage_select, Column.sqlId_splitPage_from);
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
