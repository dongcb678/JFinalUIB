package com.platform.mvc.stationoperator;

import org.apache.log4j.Logger;

import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;

/**
 * 岗位功能 管理	
 * 描述：
 */
@Controller("/platform/stationOperator")
public class StationOperatorController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(StationOperatorController.class);
	
	private StationOperatorService stationOperatorService;
	
	/**
	 * 展示岗位拥有的功能和所有功能列表
	 */
	public void index(){
		defaultOrder(" sorder asc, ", " morder asc ");
		stationOperatorService.paging(splitPage);
		render("/platform/stationOperator/list.html");
	}

	/**
	 * 添加岗位拥有的功能
	 */
	public void add() {
		String stationIds = getPara("stationIds");
		String operatorIds = getPara("operatorIds");
		String ids = stationOperatorService.add(stationIds, operatorIds);
		renderSuccess(ids);
	}

	/**
	 * 删除岗位拥有的功能
	 */
	public void del() {
		String stationOperatorIds = getPara();
		stationOperatorService.del(stationOperatorIds);
		renderSuccess(null);
	}
	
}
