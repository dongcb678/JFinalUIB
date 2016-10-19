package com.platform.mvc.station;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseController;

/**
 * 岗位管理
 * @author 董华健
 */
@Controller("/platform/station")
public class StationController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(StationController.class);
	
	private StationService stationService;
	
	private String pIds;
	private String names;
	private int orderIds;

	/**
	 * 岗位首页tree
	 */
	public void index() {
		render("/platform/station/tree.html");
	}

	/**
	 * 岗位treeData
	 */
	public void treeData()  {
		List<ZtreeNode> nodeList = stationService.childNodeData(getCxt(), ids);
		renderJson(nodeList);
	}

	/**
	 * 保存岗位
	 */
	@Before(StationValidator.class)
	public void save() {
		ids = stationService.save(pIds, names, orderIds);
		renderText(ids);
	}

	/**
	 * 准备更新岗位
	 */
	@Before(StationValidator.class)
	public void update() {
		stationService.update(ids, pIds, names);
		renderText(ids);
	}

	/**
	 * 删除岗位
	 */
	public void delete() {
		stationService.delete(ids);
		renderText(ids);
	}

}


