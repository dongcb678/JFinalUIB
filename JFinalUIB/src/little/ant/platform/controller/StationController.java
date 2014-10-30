package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Station;
import little.ant.platform.service.StationService;
import little.ant.platform.validator.StationValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/station")
public class StationController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(StationController.class);
	
	private String pIds;
	private String names;
	private int orderIds;

	private String moduleIds;
	private String operatorIds;
	
	public void index() {
		render("/pingtai/station/tree.html");
	}
	
	public void treeData()  {
		String jsonText = StationService.service.childNodeData(ids);
		renderJson(jsonText);
	}
	
	@Before(StationValidator.class)
	public void save() {
		ids = StationService.service.save(pIds, names, orderIds);
		renderText(ids);
	}
	
	@Before(StationValidator.class)
	public void update() {
		StationService.service.update(ids, pIds, names);
		renderText(ids);
	}
	
	public void delete() {
		StationService.service.delete(ids);
		renderText(ids);
	}

	public void getOperator(){
		Station station = Station.dao.findById(ids);
		renderJson(station);
	}

	public void setOperator(){
		StationService.service.setOperator(ids, moduleIds, operatorIds);
		renderJson(ids);
	}
	
}


