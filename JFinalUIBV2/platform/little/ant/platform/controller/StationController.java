package little.ant.platform.controller;

import java.util.List;

import little.ant.platform.annotation.Controller;
import little.ant.platform.common.ZtreeNode;
import little.ant.platform.model.Station;
import little.ant.platform.service.StationService;
import little.ant.platform.validator.StationValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

/**
 * 岗位管理
 * @author 董华健
 */
@Controller(controllerKey = "/jf/platform/station")
public class StationController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(StationController.class);
	
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
		List<ZtreeNode> nodeList = StationService.service.childNodeData(ids);
		renderJson(nodeList);
	}

	/**
	 * 保存岗位
	 */
	@Before(StationValidator.class)
	public void save() {
		ids = StationService.service.save(pIds, names, orderIds);
		renderText(ids);
	}

	/**
	 * 准备更新岗位
	 */
	@Before(StationValidator.class)
	public void update() {
		StationService.service.update(ids, pIds, names);
		renderText(ids);
	}

	/**
	 * 删除岗位
	 */
	public void delete() {
		StationService.service.delete(ids);
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
		StationService.service.setOperator(ids, moduleIds, operatorIds);
		renderJson(ids);
	}
	
}


