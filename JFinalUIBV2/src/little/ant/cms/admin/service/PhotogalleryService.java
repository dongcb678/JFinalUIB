package little.ant.cms.admin.service;

import little.ant.cms.model.Photogallery;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;

import org.apache.log4j.Logger;

public class PhotogalleryService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryService.class);
	
	public static final PhotogalleryService service = Enhancer.enhance(PhotogalleryService.class, Tx.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Photogallery.sqlId_splitPage_select, Photogallery.sqlId_splitPage_from);
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Photogallery.dao.deleteById(id);
		}
	}
	
}
