package little.ant.blog.admin.service;

import little.ant.blog.model.Type;
import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class TypeService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(TypeService.class);
	
	public static final TypeService service = MyTxProxy.newProxy(TypeService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Type.sqlId_splitPage_select, Type.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Type.dao.deleteById(id);
		}
	}
	
}
