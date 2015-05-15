package little.ant.common.service;

import little.ant.common.model.Location;
import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.common.SplitPage;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;

import org.apache.log4j.Logger;

public class LocationService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LocationService.class);
	
	public static final LocationService service = new LocationService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		String select = " select * ";
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "common.location.splitPage");
	}

	/**
	 * 保存
	 * @param location
	 * @param userIds
	 * @return
	 */
	public String save(Location location, String userIds){
		location.set(Location.colunm_adcount, 0);
		location.set(Location.colunm_createuser, userIds);
		location.set(Location.colunm_createdate, ToolDateTime.getSqlTimestamp(null));
		location.set(Location.colunm_isdelete, "0");
		location.save();
		return location.getPKValue();
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String id : idsArr) {
			Location.dao.deleteById(id);
		}
	}
	
}
