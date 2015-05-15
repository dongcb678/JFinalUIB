package little.ant.blog.service;

import org.apache.log4j.Logger;

import little.ant.platform.service.BaseService;
import little.ant.platform.common.SplitPage;
import little.ant.platform.common.ConstantPlatform;
import little.ant.blog.model.Circle;

public class CircleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CircleService.class);
	
	public static final CircleService service = new CircleService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "blog.circle.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Circle.dao.deleteById(id);
		}
	}
	
}
