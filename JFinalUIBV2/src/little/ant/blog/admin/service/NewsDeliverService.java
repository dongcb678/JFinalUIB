package little.ant.blog.admin.service;

import org.apache.log4j.Logger;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;
import little.ant.platform.common.SplitPage;
import little.ant.platform.common.ConstantPlatform;
import little.ant.blog.model.NewsDeliver;

public class NewsDeliverService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(NewsDeliverService.class);
	
	public static final NewsDeliverService service = MyTxProxy.newProxy(NewsDeliverService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "src.newsDeliver.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			NewsDeliver.dao.deleteById(id);
		}
	}
	
}
