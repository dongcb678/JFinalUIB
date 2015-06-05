package little.ant.cms.admin.service;

import little.ant.cms.model.Answers;
import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class AnswersService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(AnswersService.class);
	
	public static final AnswersService service = MyTxProxy.newProxy(AnswersService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Answers.sqlId_splitPage_select, Answers.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Answers.dao.deleteById(id);
		}
	}
	
}
