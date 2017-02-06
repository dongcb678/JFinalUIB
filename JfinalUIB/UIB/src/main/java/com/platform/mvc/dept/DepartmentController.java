package com.platform.mvc.dept;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.log.Log;
import com.platform.annotation.Controller;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseController;

/**
 * 部门管理
 * @author 董华健
 */
@Controller("/platform/dept")
public class DepartmentController extends BaseController {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(DepartmentController.class);

	private DepartmentService departmentService;
	
	private String pIds; // 上级部门ids
	private String names; // 部门名称
	private int orderIds; // 部门排序号
	private String principalIds; // 部门负责人
	
	/**
	 * tree首页
	 */
	public void index() {
		render("/platform/department/tree.html");
	}
	
	/**
	 * tree节点数据
	 */
	public void treeData()  {
		List<ZtreeNode> nodeList = departmentService.childNodeData(getCxt(), ids);
		renderJson(nodeList);
	}
	
	/**
	 * 保存
	 */
	@Before(DepartmentValidator.class)
	public void save() {
		ids = departmentService.save(pIds, names, orderIds);
		renderText(ids);
	}
	
	/**
	 * 更新
	 */
	@Before(DepartmentValidator.class)
	public void update() {
		departmentService.update(ids, pIds, names, principalIds);
		renderText(ids);
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		boolean bool = departmentService.delete(ids);
		renderText(String.valueOf(bool));
	}
	
	/**
	 * 获取部门负责人
	 */
	public void getPrincipal(){
		Department dept = Department.dao.findById(ids);
		renderJson(dept);
	}
}


