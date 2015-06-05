package little.ant.blog.admin.service;

import little.ant.blog.model.NewsDeliver;
import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class NewsDeliverService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(NewsDeliverService.class);
	
	public static final NewsDeliverService service = MyTxProxy.newProxy(NewsDeliverService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, NewsDeliver.sqlId_splitPage_select, NewsDeliver.sqlId_splitPage_from);
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
