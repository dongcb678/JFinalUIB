package com.platform.mvc.module;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.annotation.Service;
import com.platform.constant.ConstantInit;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseService;

@Service(name = ModuleService.serviceName)
public class ModuleService extends BaseService {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ModuleService.class);

	public static final String serviceName = "moduleService";

	/**
	 * 获取子节点数据
	 * @param cxt
	 * @param parentIds
	 * @return
	 */
	public List<ZtreeNode> childNodeData(String cxt, String systemsIds, String parentIds){
		List<Module> list = null;
		if (null != systemsIds && null == parentIds) {
			// 1.根据系统ID查询模块树
			String sql = getSqlMy(Module.sqlId_rootBySystemIds);
			list = Module.dao.find(sql, systemsIds);
			
		}else if(null == systemsIds && null == parentIds){
			// 2.模块单选初始化调用
			String sql = getSqlMy(Module.sqlId_root);
			list = Module.dao.find(sql);
			
		}else if(null != parentIds){
			// 3.通用子节点查询
			String sql = getSqlMy(Module.sqlId_child);
			list = Module.dao.find(sql, parentIds);
		}
		
		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		ZtreeNode node = null;
		
		for (Module module : list) {
			node = new ZtreeNode();
			node.setId(module.getPKValue());
			node.setName(module.getStr("names"));
			node.setIsParent(true);
			node.setIcon(cxt + "/jsfile/ztree/css/zTreeStyle/img/diy/" + module.getStr(Module.column_images));
			nodeList.add(node);
		}
		
		return nodeList;
	}
	
	/**
	 * 保存
	 * @param pIds
	 * @param names
	 * @param orderIds
	 * @return
	 */
	public String save(String pIds, String names, int orderIds) {
		Module pDept = Module.dao.findById(pIds);
		pDept.set(Module.column_isparent, "true").update();
		
		String images = "";
		if(orderIds < 2 || orderIds > 9){
			orderIds = 2;
			images = "2.png";
		}else{
			images = orderIds + ".png";
		}

		Module module = new Module();
		module.set(Module.column_isparent, "false");
		module.set(Module.column_parentmoduleids, pIds);
		module.set(Module.column_systemsids, pDept.getStr(Module.column_systemsids));//冗余系统ids
		module.set(Module.column_orderids, orderIds);
		module.set(Module.column_names, names);
		module.set(Module.column_images, images);
		module.save();
		
		return module.getPKValue();
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
		if(StrKit.notBlank(names)){
			//更新模块名称
			module.set(Module.column_names, names).update();
			
		}else if(StrKit.notBlank(pIds)){
			//更新上级模块
			module.set(Module.column_parentmoduleids, pIds).update();
		}
	}
	
	/**
	 * 删除
	 * @param ids
	 * @return
	 */
	public boolean delete(String ids) {
		Module module = Module.dao.findById(ids);
		
		// 是否存在子节点
		if(module.getStr(Module.column_isparent).equals("true")){
			return false; //存在子节点，不能直接删除
		}

		// 修改上级节点的isparent
		Module pModule = Module.dao.findById(module.getStr(Module.column_parentmoduleids));
		String sql = getSqlMy(Module.sqlId_childCount);
		Record record = Db.use(ConstantInit.db_dataSource_main).findFirst(sql, pModule.getPKValue());
		Long counts = record.getNumber("counts").longValue();
		if(counts == 1){
			pModule.set(Module.column_isparent, "false");
			pModule.update();
		}

		// 删除
	    Module.dao.deleteById(ids);
	    
	    return true;
	}
	
}
