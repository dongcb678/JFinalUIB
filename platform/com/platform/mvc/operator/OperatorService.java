package com.platform.mvc.operator;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.log.Log;
import com.platform.annotation.Service;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.module.Module;
import com.platform.mvc.roleoperator.RoleOperator;
import com.platform.mvc.roleoperator.RoleOperatorService;

@Service(name = OperatorService.serviceName)
public class OperatorService extends BaseService {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(OperatorService.class);

	public static final String serviceName = "operatorService";

	private RoleOperatorService roleOperatorService;
	
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
		Operator.cacheAdd(ids);
		
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
		Operator.cacheAdd(ids);
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		
		String sql = getSqlMy("platform.operator.getRoleoperatorByOperatorids");
		
		for (String operatorIds : idsArr) {
			// 缓存
			List<RoleOperator> roList = RoleOperator.dao.find(sql, operatorIds);
			for (RoleOperator roleOperator : roList) {
				roleOperatorService.del(roleOperator.getPKValue());
			}

			// 删除缓存
			Operator.cacheRemove(operatorIds);
			
			// 删除Operator
			Operator.dao.deleteById(operatorIds);
		}
		
	}

	/**
	 * 获取子节点数据
	 * @param cxt
	 * @param moduleIds
	 * @return
	 */
	public List<ZtreeNode> treeData(String cxt, String moduleIds){
		List<Module> listModule = new ArrayList<Module>();
		List<Operator> operatorList = new ArrayList<Operator>();
		
		if (null == moduleIds) {
			// 1.模块功能初始化调用
			String sql = getSqlMy(Operator.sqlId_rootModule);
			listModule = Module.dao.find(sql);
			
		} else if (null != moduleIds) {
			moduleIds = moduleIds.replace("module_", "");
			// 2.通用子节点查询
			String sqlModule = getSqlMy(Operator.sqlId_childModule);
			listModule = Module.dao.find(sqlModule, moduleIds);
			
			String sqlOperator = getSqlMy(Operator.sqlId_byModuleIds);
			operatorList = Operator.dao.find(sqlOperator, moduleIds);
		}

		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		ZtreeNode node = null;

		for (Module module : listModule) {
			node = new ZtreeNode();
			node.setId("module_" + module.getPKValue());
			node.setName(module.getStr(Module.column_names));
			node.setIsParent(true);
			//node.setChecked(false);
			node.setNocheck(true);
			node.setIcon(cxt + "/jsfile/ztree/css/zTreeStyle/img/diy/" + module.getStr(Module.column_images));
			nodeList.add(node);
		}
		
		for (Operator operator : operatorList) {
			node = new ZtreeNode();
			node.setId("operator_" + operator.getPKValue());
			node.setName(operator.getStr(Operator.column_names));
			node.setIsParent(false);
			node.setChecked(false);
			node.setIcon(cxt + "/jsfile/ztree/css/zTreeStyle/img/diy/5.png");
			nodeList.add(node);
		}

		return nodeList;
	}

	/**
	 * 获取节点数据
	 * @param cxt
	 * @return
	 */
	public List<ZtreeNode> tree(String cxt){
		// 1.根模块
		String sql = getSqlMy(Operator.sqlId_rootModule);
		List<Module> rootModuleList = Module.dao.find(sql);

		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		
		for (Module module : rootModuleList) {
			ZtreeNode node = new ZtreeNode();
			
			node.setId(module.getPKValue());
			node.setName(module.getStr(Module.column_names));
			node.setIsParent(true);
			//node.setChecked(false);
			node.setNocheck(true);
			node.setIcon(cxt + "/jsfile/ztree/css/zTreeStyle/img/diy/" + module.getStr(Module.column_images));
			
			recursion(cxt, node, module);
			
			nodeList.add(node);
		}
		
		return nodeList;
	}
	
	/**
	 * 递归获取节点信息
	 * @param cxt
	 * @param treeNode
	 * @param pModule
	 */
	private void recursion(String cxt, ZtreeNode treeNode, Module pModule){
		List<ZtreeNode> children = new ArrayList<ZtreeNode>();

		// 功能
		String sqlOperator = getSqlMy(Operator.sqlId_byModuleIds);
		List<Operator> operatorList = Operator.dao.find(sqlOperator, pModule.getPKValue());
		for (Operator operator : operatorList) {
			ZtreeNode node = new ZtreeNode();
			
			node.setId(operator.getPKValue());
			node.setName(operator.getStr(Operator.column_names));
			node.setIsParent(false);
			node.setChecked(false);
			node.setIcon(cxt + "/jsfile/ztree/css/zTreeStyle/img/diy/5.png");
			
			children.add(node);
		}
		
		// 模块
		String sqlModule = getSqlMy(Operator.sqlId_childModule);
		List<Module> moduleList = Module.dao.find(sqlModule, pModule.getPKValue());
		for (Module module : moduleList) {
			ZtreeNode node = new ZtreeNode();
			
			node.setId(module.getPKValue());
			node.setName(module.getStr(Module.column_names));
			node.setIsParent(true);
			//node.setChecked(false);
			node.setNocheck(true);
			node.setIcon(cxt + "/jsfile/ztree/css/zTreeStyle/img/diy/" + module.getStr(Module.column_images));
			
			recursion(cxt, node, module);
			
			children.add(node);
		}
		
		treeNode.setChildren(children);
	}
	
}
