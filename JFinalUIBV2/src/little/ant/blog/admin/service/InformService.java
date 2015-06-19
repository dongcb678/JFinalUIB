package little.ant.blog.admin.service;

import little.ant.blog.model.Inform;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class InformService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(InformService.class);
	
	public static final InformService service = Enhancer.enhance(InformService.class, Tx.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Inform.sqlId_splitPage_select, Inform.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Inform.dao.deleteById(id);
		}
	}
	
}
