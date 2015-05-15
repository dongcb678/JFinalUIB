package little.ant.blog.service;

import org.apache.log4j.Logger;

import little.ant.platform.service.BaseService;
import little.ant.platform.common.SplitPage;
import little.ant.platform.common.ConstantPlatform;
import little.ant.blog.model.Inform;

public class InformService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(InformService.class);
	
	public static final InformService service = new InformService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "blog.inform.splitPage");
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
