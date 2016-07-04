package com.platform.mvc.station;

import java.util.List;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.platform.annotation.Controller;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseController;

/**
 * 岗位管理
 * @author 董华健
 */
@Controller(controllerKey = "/platform/station")
public class StationController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(StationController.class);
	
	private StationService stationService;
	
	private String pIds;
	private String names;
	private int orderIds;

	private String moduleIds;
	private String operatorIds;
	
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

	/**
	 * 获取岗位对应的功能
	 */
	public void getOperator(){
		Station station = Station.dao.findById(ids);
		renderJson(station);
	}

	/**
	 * 设置岗位对应的功能
	 */
	public void setOperator(){
		stationService.setOperator(ids, moduleIds, operatorIds);
		renderJson(ids);
	}
	
}


