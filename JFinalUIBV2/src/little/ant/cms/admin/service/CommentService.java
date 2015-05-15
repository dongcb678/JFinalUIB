package little.ant.cms.admin.service;

import org.apache.log4j.Logger;

import little.ant.platform.service.BaseService;
import little.ant.platform.common.SplitPage;
import little.ant.platform.common.ConstantPlatform;
import little.ant.cms.model.Comment;

public class CommentService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(CommentService.class);
	
	public static final CommentService service = new CommentService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "cms.comment.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Comment.dao.deleteById(id);
		}
	}
	
}
