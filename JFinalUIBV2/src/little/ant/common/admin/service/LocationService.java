package little.ant.common.admin.service;

import little.ant.common.model.Location;
import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.service.BaseService;
import little.ant.platform.tools.ToolDateTime;

import org.apache.log4j.Logger;

public class LocationService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LocationService.class);
	
	public static final LocationService service = MyTxProxy.newProxy(LocationService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, Location.sqlId_splitPage_select, Location.sqlId_splitPage_from);
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
