package little.ant.cms.admin.service;

import org.apache.log4j.Logger;

import little.ant.platform.service.BaseService;
import little.ant.platform.common.SplitPage;
import little.ant.platform.common.ConstantPlatform;
import little.ant.cms.model.Library;

public class LibraryService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LibraryService.class);
	
	public static final LibraryService service = new LibraryService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "cms.library.splitPage");
	}
	
	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Library.dao.deleteById(id);
		}
	}
	
}
