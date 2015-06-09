package little.ant.platform.service;

import java.util.List;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.common.DictKeys;
import little.ant.platform.model.Department;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class DepartmentService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DepartmentService.class);
	
	public static final DepartmentService service = MyTxProxy.newProxy(DepartmentService.class);
	
	/**
	 * 获取子节点数据
	 * @param parentIds
	 * @return
	 */
	public String childNodeData(String parentIds){
		List<Department> list = null;
		if(null != parentIds){
			String sql = getSql("platform.department.childNode");
			list = Department.dao.find(sql, parentIds);
			
		}else{
			String sql = getSql("platform.department.rootNode");
			list = Department.dao.find(sql);
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		
		int size = list.size() - 1;
		for (Department dept : list) {
			sb.append(" { ");
			sb.append(" id : '").append(dept.getPKValue()).append("', ");
			sb.append(" name : '").append(dept.getStr("names")).append("', ");
			sb.append(" isParent : true, ");
			sb.append(" font : {'font-weight':'bold'}, ");
			sb.append(" icon : '").append("/jsFile/zTree/css/zTreeStyle/img/diy/").append(dept.getStr("images")).append("' ");
			sb.append(" }");
			if(list.indexOf(dept) < size){
				sb.append(", ");
			}
		}
		
		sb.append("]");
		
		return sb.toString();
	}
	
	/**
	 * 保存
	 * @param pIds
	 * @param names
	 * @param orderIds
	 * @return
	 */
	public String save(String pIds, String names, int orderIds) {
		Department pDept = Department.dao.findById(pIds);
		pDept.set("isparent", "true").update();
		
		String images = "";
		if(orderIds < 2 || orderIds > 9){
			orderIds = 2;
			images = "2.png";
		}else{
			images = orderIds + ".png";
		}

		Department dept = new Department();
		dept.set("isparent", "false");
		dept.set("parentdepartmentids", pIds);
		dept.set("orderids", orderIds);
		dept.set("names", names);
		dept.set("images", images);
		dept.save();
		
		return dept.getPKValue();
	}
	
	/**
	 * 更新
	 * @param ids
	 * @param pIds
	 * @param names
	 * @param principalIds
	 */
	public void update(String ids, String pIds, String names, String principalIds) {
		Department dept = Department.dao.findById(ids);
		if(null != names && !names.isEmpty()){
			//更新模块名称
			dept.set("names", names).update();
			
		}else if(null != pIds && !pIds.isEmpty()){
			//更新上级模块
			dept.set("parentdepartmentids", pIds).update();
			
		}else if(null != principalIds && !principalIds.isEmpty()){
			//更新部门负责人
			dept.set("principaluserids", principalIds).update();
		}
	}
	
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	public boolean delete(String ids) {
		Department department = Department.dao.findById(ids);
		
		// 是否存在子节点
		if(department.getStr("isparent").equals("true")){
			return false; //存在子节点，不能直接删除
		}

		// 修改上级节点的isparent
		Department pDepartment = Department.dao.findById(department.getStr("parentdepartmentids"));
		String sql = getSql("platform.department.childCount");
		Record record = Db.use(DictKeys.db_dataSource_main).findFirst(sql, pDepartment.getPKValue());
		Long counts = record.getNumber("counts").longValue();
		if(counts == 1){
			pDepartment.set("isparent", "false");
			pDepartment.update();
		}

		// 删除
	    Department.dao.deleteById(ids);
	    
	    return true;
	}
	
}
