package little.ant.blog.admin.service;

import org.apache.log4j.Logger;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.service.BaseService;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.blog.model.Article;

public class ArticleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleService.class);
	
	public static final ArticleService service = MyTxProxy.newProxy(ArticleService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantInit.db_dataSource_main, splitPage, select, "src.article.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Article.dao.deleteById(id);
		}
	}
	
}
