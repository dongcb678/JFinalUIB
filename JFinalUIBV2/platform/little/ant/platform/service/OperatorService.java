package little.ant.platform.service;

import java.util.ArrayList;
import java.util.List;

import little.ant.platform.common.ConstantPlatform;
import little.ant.platform.common.SplitPage;
import little.ant.platform.common.ZtreeNode;
import little.ant.platform.model.Module;
import little.ant.platform.model.Operator;

import org.apache.log4j.Logger;

public class OperatorService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(OperatorService.class);

	public static final OperatorService service = new OperatorService();
	
	/**
	 * 保存
	 * @param operator
	 * @return
	 */
	public String save(Operator operator){
		// 保存
		operator.save();
		String ids = operator.getPKValue();
		
		// 缓存
		Operator.dao.cacheAdd(ids);
		
		return ids;
	}

	/**
	 * 更新
	 * @param operator
	 */
	public void update(Operator operator){
		// 更新
		operator.update();
		String ids = operator.getPKValue();
		
		// 缓存
		Operator.dao.cacheAdd(ids);
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String operatorIds : idsArr) {
			// 缓存
			Operator.dao.cacheRemove(operatorIds);
			
			// 删除
			Operator.dao.deleteById(operatorIds);
		}
		
	}
	
	/**
	 * 获取子节点数据
	 * @param moduleIds
	 * @return
	 */
	public List<ZtreeNode> treeData(String moduleIds){
		List<Module> listModule = new ArrayList<Module>();
		List<Operator> operatorList = new ArrayList<Operator>();
		
		if (null == moduleIds) {
			// 1.模块功能初始化调用
			String sql = getSql("platform.operator.rootModule");
			listModule = Module.dao.find(sql);
			
		} else if (null != moduleIds) {
			moduleIds = moduleIds.replace("module_", "");
			// 2.通用子节点查询
			String sqlModule = getSql("platform.operator.childModule");
			listModule = Module.dao.find(sqlModule, moduleIds);
			
			String sqlOperator = getSql("platform.operator.byModuleIds");
			operatorList = Operator.dao.find(sqlOperator, moduleIds);
		}

		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		ZtreeNode node = null;

		for (Module module : listModule) {
			node = new ZtreeNode();
			node.setId("module_" + module.getPKValue());
			node.setName(module.getStr(Module.colunm_names));
			node.setIsParent(true);
			//node.setChecked(false);
			node.setNocheck(true);
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/" + module.getStr(Module.colunm_images));
			nodeList.add(node);
		}
		
		for (Operator operator : operatorList) {
			node = new ZtreeNode();
			node.setId("operator_" + operator.getPKValue());
			node.setName(operator.getStr(Operator.colunm_names));
			node.setIsParent(false);
			node.setChecked(false);
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/5.png");
			nodeList.add(node);
		}

		return nodeList;
	}

	/**
	 * 获取子节点数据
	 * @param moduleIds
	 * @return
	 */
	public List<ZtreeNode> tree(){
		// 1.根模块
		String sql = getSql("platform.operator.rootModule");
		List<Module> rootModuleList = Module.dao.find(sql);

		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		
		for (Module module : rootModuleList) {
			ZtreeNode node = new ZtreeNode();
			
			node.setId(module.getPKValue());
			node.setName(module.getStr(Module.colunm_names));
			node.setIsParent(true);
			//node.setChecked(false);
			node.setNocheck(true);
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/" + module.getStr(Module.colunm_images));
			
			recursion(node, module);
			
			nodeList.add(node);
		}
		
		return nodeList;
	}
	
	/**
	 * 递归获取节点信息
	 * @param treeNode
	 * @param pModule
	 */
	private void recursion(ZtreeNode treeNode, Module pModule){
		List<ZtreeNode> children = new ArrayList<ZtreeNode>();

		// 功能
		String sqlOperator = getSql("platform.operator.byModuleIds");
		List<Operator> operatorList = Operator.dao.find(sqlOperator, pModule.getPKValue());
		for (Operator operator : operatorList) {
			ZtreeNode node = new ZtreeNode();
			
			node.setId(operator.getPKValue());
			node.setName(operator.getStr(Operator.colunm_names));
			node.setIsParent(false);
			node.setChecked(false);
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/5.png");
			
			children.add(node);
		}
		
		// 模块
		String sqlModule = getSql("platform.operator.childModule");
		List<Module> moduleList = Module.dao.find(sqlModule, pModule.getPKValue());
		for (Module module : moduleList) {
			ZtreeNode node = new ZtreeNode();
			
			node.setId(module.getPKValue());
			node.setName(module.getStr(Module.colunm_names));
			node.setIsParent(true);
			//node.setChecked(false);
			node.setNocheck(true);
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/" + module.getStr(Module.colunm_images));
			
			recursion(node, module);
			
			children.add(node);
		}
		
		treeNode.setChildren(children);
	}
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select o.ids, o.names, o.url, o.rowFilter, o.splitPage, o.formToken, o.privilegess, m.names as modulenames, s.names as systemsnames ";
		splitPageBase(ConstantPlatform.db_dataSource_main, splitPage, select, "platform.operator.splitPage");
	}
	
}
