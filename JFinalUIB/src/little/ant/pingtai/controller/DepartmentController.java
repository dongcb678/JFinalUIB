package little.ant.pingtai.controller;

import little.ant.pingtai.model.Department;
import little.ant.pingtai.service.DepartmentService;
import little.ant.pingtai.validator.DepartmentValidator;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

public class DepartmentController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DepartmentController.class);
	
	private DepartmentService deptService = new DepartmentService();

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
		String jsonText = deptService.childNodeData(ids);
		renderJson(jsonText);
	}
	
	/**
	 * 保存
	 */
	@Before(DepartmentValidator.class)
	public void save() {
		ids = deptService.save(pIds, names, orderIds);
		renderText(ids);
	}
	
	/**
	 * 更新
	 */
	@Before(DepartmentValidator.class)
	public void update() {
		deptService.update(ids, pIds, names, principalIds);
		renderText(ids);
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		deptService.delete(ids);
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


