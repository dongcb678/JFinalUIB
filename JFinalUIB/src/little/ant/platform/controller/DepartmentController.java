package little.ant.platform.controller;

import little.ant.platform.annotation.Controller;
import little.ant.platform.model.Department;
import little.ant.platform.service.DepartmentService;
import little.ant.platform.validator.DepartmentValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

@Controller(controllerKey = "/jf/dept")
public class DepartmentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DepartmentController.class);
	
	private String pIds;
	private String names;
	private int orderIds;
	private String principalIds;
	
	/**
	 * tree首页
	 */
	public void index() {
		render("/pingtai/department/tree.html");
	}
	
	/**
	 * tree节点数据
	 */
	public void treeData()  {
		String jsonText = DepartmentService.service.childNodeData(ids);
		renderJson(jsonText);
	}
	
	/**
	 * 保存
	 */
	@Before(DepartmentValidator.class)
	public void save() {
		ids = DepartmentService.service.save(pIds, names, orderIds);
		renderText(ids);
	}
	
	/**
	 * 更新
	 */
	@Before(DepartmentValidator.class)
	public void update() {
		DepartmentService.service.update(ids, pIds, names, principalIds);
		renderText(ids);
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		DepartmentService.service.delete(ids);
		renderText(ids);
	}
	
	/**
	 * 获取部门负责人
	 */
	public void getPrincipal(){
		Department dept = Department.dao.findById(ids);
		renderJson(dept);
	}
}


