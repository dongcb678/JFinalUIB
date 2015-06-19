package little.ant.cms.admin.service;

import little.ant.cms.model.YellowPage;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class YellowPageService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(YellowPageService.class);
	
	public static final YellowPageService service = Enhancer.enhance(YellowPageService.class, Tx.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, YellowPage.sqlId_splitPage_select, YellowPage.sqlId_splitPage_from);
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
