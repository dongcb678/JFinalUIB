package little.ant.blog.admin.service;

import little.ant.blog.model.Move;
import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class MoveService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(MoveService.class);
	
	public static final MoveService service = MyTxProxy.newProxy(MoveService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Move.sqlId_splitPage_select, Move.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Move.dao.deleteById(id);
		}
	}
	
}
