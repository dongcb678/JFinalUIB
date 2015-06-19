package little.ant.blog.admin.service;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.service.BaseService;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.blog.model.ArticleComment;

public class ArticleCommentService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ArticleCommentService.class);
	
	public static final ArticleCommentService service = Enhancer.enhance(ArticleCommentService.class, Tx.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, ArticleComment.sqlId_splitPage_select, ArticleComment.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			ArticleComment.dao.deleteById(id);
		}
	}
	
}
