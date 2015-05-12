package little.ant.common.service;

import org.apache.log4j.Logger;

import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;
import little.ant.platform.common.SplitPage;
import little.ant.platform.common.DictKeys;
import little.ant.common.model.IpBlacklist;
import little.ant.common.model.Location;

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
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "common.location.splitPage");
	}

	/**
	 * 保存
	 * @param location
	 * @param userIds
	 * @return
	 */
	public String save(Location location, String userIds){
		location.set(IpBlacklist.colunm_createuser, userIds);
		location.set(IpBlacklist.colunm_createdate, ToolDateTime.getSqlTimestamp(null));
		location.set(IpBlacklist.colunm_isdelete, "0");
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
