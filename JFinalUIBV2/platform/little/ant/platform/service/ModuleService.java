package little.ant.platform.service;

import java.util.ArrayList;
import java.util.List;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.ZtreeNode;
import little.ant.platform.model.Module;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class ModuleService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ModuleService.class);

	public static final ModuleService service = new ModuleService();
	
	/**
	 * 获取子节点数据
	 * @param parentIds
	 * @return
	 */
	public List<ZtreeNode> childNodeData(String systemsIds, String parentIds){
		List<Module> list = null;
		if (null != systemsIds && null == parentIds) {
			// 1.根据系统ID查询模块树
			String sql = getSql("platform.module.rootBySystemIds");
			list = Module.dao.find(sql, systemsIds);
			
		}else if(null == systemsIds && null == parentIds){
			// 2.模块单选初始化调用
			String sql = getSql("platform.module.root");
			list = Module.dao.find(sql);
			
		}else if(null != parentIds){
			// 3.通用子节点查询
			String sql = getSql("platform.module.child");
			list = Module.dao.find(sql, parentIds);
		}
		
		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		ZtreeNode node = null;
		
		for (Module module : list) {
			node = new ZtreeNode();
			node.setId(module.getPKValue());
			node.setName(module.getStr("names"));
			node.setIsParent(true);
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/" + module.getStr(Module.colunm_images));
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
		pDept.set(Module.colunm_isparent, "true").update();
		
		String images = "";
		if(orderIds < 2 || orderIds > 9){
			orderIds = 2;
			images = "2.png";
		}else{
			images = orderIds + ".png";
		}

		Module module = new Module();
		module.set(Module.colunm_isparent, "true");
		module.set(Module.colunm_parentmoduleids, pIds);
		module.set(Module.colunm_systemsids, pDept.getStr(Module.colunm_systemsids));//冗余系统ids
		module.set(Module.colunm_orderids, orderIds);
		module.set(Module.colunm_names, names);
		module.set(Module.colunm_images, images);
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
		if(null != names && !names.isEmpty()){
			//更新模块名称
			module.set(Module.colunm_names, names).update();
			
		}else if(null != pIds && !pIds.isEmpty()){
			//更新上级模块
			module.set(Module.colunm_parentmoduleids, pIds).update();
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
		if(module.getStr(Module.colunm_isparent).equals("true")){
			return false; //存在子节点，不能直接删除
		}

		// 修改上级节点的isparent
		Module pModule = Module.dao.findById(module.getStr(Module.colunm_parentmoduleids));
		String sql = getSql("platform.module.childCount");
		Record record = Db.use(DictKeys.db_dataSource_main).findFirst(sql, pModule.getPKValue());
		Long counts = record.getNumber("counts").longValue();
		if(counts == 1){
			pModule.set(Module.colunm_isparent, "false");
			pModule.update();
		}

		// 删除
	    Module.dao.deleteById(ids);
	    
	    return true;
	}
	
}
