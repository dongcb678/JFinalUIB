package little.ant.blog.admin.service;

import little.ant.blog.model.Favorite;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class FavoriteService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(FavoriteService.class);
	
	public static final FavoriteService service = Enhancer.enhance(FavoriteService.class, Tx.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Favorite.sqlId_splitPage_select, Favorite.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Favorite.dao.deleteById(id);
		}
	}
	
}
