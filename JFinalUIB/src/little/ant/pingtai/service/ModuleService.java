package little.ant.pingtai.service;

import java.util.List;

import little.ant.pingtai.model.Module;
import little.ant.pingtai.tools.ToolUtils;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;

public class ModuleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ModuleService.class);
	
	/**
	 * 获取子节点数据
	 * @param parentIds
	 * @return
	 */
	public String childNodeData(String systemsIds, String parentIds){
		String sql = null;
		List<Module> list = null;
		if (null != systemsIds && null == parentIds) {
			// 1.根据系统ID查询模块树
			sql = " select ids, names, isparent, images from pt_module where parentModuleIds is null and systemsIds=? order by orderIds asc ";
			list = Module.dao.find(sql, systemsIds);
			
		}else if(null == systemsIds && null == parentIds){
			// 2.模块单选初始化调用
			sql = " select pm.ids, (select ps.names from pt_systems ps where ps.ids = pm.systemsIds) as names, pm.isParent, pm.images from pt_module pm where pm.parentModuleIds is null order by pm.orderIds asc ";
			list = Module.dao.find(sql);
			
		}else if(null != parentIds){
			// 3.通用子节点查询
			sql = " select ids, names, isparent, images from pt_module where parentModuleIds = ? order by orderIds asc ";
			list = Module.dao.find(sql, parentIds);
		}
		
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		
		int size = list.size() - 1;
		for (Module module : list) {
			sb.append(" { ");
			sb.append(" id : '").append(module.getStr("ids")).append("', ");
			sb.append(" name : '").append(module.getStr("names")).append("', ");
			sb.append(" isParent : true, ");
			sb.append(" font : {'font-weight':'bold'}, ");
			sb.append(" icon : '").append("/jsFile/zTree/css/zTreeStyle/img/diy/").append(module.getStr("images")).append("' ");
			sb.append(" }");
			if(list.indexOf(module) < size){
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
	@Before(Tx.class)
	public String save(String pIds, String names, int orderIds) {
		Module pDept = Module.dao.findById(pIds);
		pDept.set("isparent", "true").update();
		
		String images = "";
		if(orderIds < 2 || orderIds > 9){
			orderIds = 2;
			images = "2.png";
		}else{
			images = orderIds + ".png";
		}

		String ids = ToolUtils.getUuidByJdk(true);
		
		Module module = new Module();
		module.set("ids", ids);
		module.set("isparent", "true");
		module.set("parentmoduleids", pIds);
		module.set("systemsids", pDept.getStr("systemsids"));//冗余系统ids
		module.set("orderids", orderIds);
		module.set("names", names);
		module.set("images", images);
		module.save();
		
		return ids;
	}
	
	/**
	 * 更新
	 * @param ids
	 * @param pIds
	 * @param names
	 * @param principalIds
	 */
	public void update(String ids, String pIds, String names) {
		Module module = Module.dao.findById(ids);
		if(null != names && !names.isEmpty()){
			//更新模块名称
			module.set("names", names).update();
			
		}else if(null != pIds && !pIds.isEmpty()){
			//更新上级模块
			module.set("parentmoduleids", pIds).update();
		}
	}
	
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	public boolean delete(String ids) {
		Record record = Db.findFirst("select count(*) as counts from pt_module where parentmoduleids=?", ids);
		Long counts = record.getLong("counts");
	    if(counts > 1){
	    	return false;
	    }
	    Module.dao.deleteById(ids);
	    return true;
	}
	
}
