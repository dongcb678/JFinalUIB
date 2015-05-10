package little.ant.cms.service;

import org.apache.log4j.Logger;

import little.ant.platform.service.BaseService;
import little.ant.platform.common.SplitPage;
import little.ant.platform.common.DictKeys;
import little.ant.cms.model.PhotogalleryItem;

public class PhotogalleryItemService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(PhotogalleryItemService.class);
	
	public static final PhotogalleryItemService service = new PhotogalleryItemService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "cms.photogalleryItem.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			PhotogalleryItem.dao.deleteById(id);
		}
	}
	
}
