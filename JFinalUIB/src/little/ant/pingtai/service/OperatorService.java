package little.ant.pingtai.service;

import java.util.ArrayList;
import java.util.List;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.ModuleModel;
import little.ant.pingtai.model.OperatorModel;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.plugin.ehcache.CacheKit;

public class OperatorService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(OperatorService.class);
	
	/**
	 * 保存
	 * @param operator
	 * @return
	 */
	public String save(OperatorModel operator){
		operator.save();
		
		// 缓存
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr("ids"), operator);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr("url"), operator);
		
		return operator.getStr("ids");
	}

	/**
	 * 更新
	 * @param operator
	 */
	public void update(OperatorModel operator){
		operator.update();
		
		// 缓存
		operator = OperatorModel.dao.findById(operator.getPrimaryKeyValue());
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr("ids"), operator);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr("url"), operator);
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		OperatorModel operator = OperatorModel.dao.findById(ids);;
		// 缓存
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr("ids"));
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_operator + operator.getStr("url"));
		
		// 删除
		operator.delete();
	}
	
	/**
	 * 获取子节点数据
	 * @param moduleIds
	 * @return
	 */
	public String childNodeData(String moduleIds){
		List<ModuleModel> listModule = new ArrayList<ModuleModel>();
		List<OperatorModel> operatorList = new ArrayList<OperatorModel>();
		
		if (null == moduleIds) {
			// 1.模块功能初始化调用
			String sql = ToolSqlXml.getSql("pingtai.operator.rootModule");
			listModule = ModuleModel.dao.find(sql);
			
		} else if (null != moduleIds) {
			moduleIds = moduleIds.replace("module_", "");
			// 2.通用子节点查询
			String sqlModule = ToolSqlXml.getSql("pingtai.operator.childModule");
			listModule = ModuleModel.dao.find(sqlModule, moduleIds);
			
			String sqlOperator = ToolSqlXml.getSql("pingtai.operator.byModuleIds");
			operatorList = OperatorModel.dao.find(sqlOperator, moduleIds);
		}

		StringBuilder sb = new StringBuilder();
		sb.append("[");

		int operatorSize = operatorList.size();
		int operatorIndexSize = operatorSize - 1;
		for (OperatorModel operator : operatorList) {
			sb.append(" { ");
			sb.append(" id : '").append("operator_").append(operator.getStr("ids")).append("', ");
			sb.append(" name : '").append(operator.getStr("names")).append("', ");
			sb.append(" isParent : false, ");

			sb.append(" checked : false, ");

			sb.append(" font : {'font-weight':'bold'}, ");
			sb.append(" icon : '/jsFile/zTree/css/zTreeStyle/img/diy/5.png' ");
			sb.append(" }");
			if (operatorList.indexOf(operator) < operatorIndexSize) {
				sb.append(", ");
			}
		}

		int moduleSize = listModule.size();
		int moduleIndexSize = moduleSize - 1;
		if (operatorSize > 0 && moduleSize > 0) {
			sb.append(", ");
		}
		for (ModuleModel module : listModule) {
			sb.append(" { ");
			sb.append(" id : '").append("module_").append(module.getStr("ids")).append("', ");
			sb.append(" name : '").append(module.getStr("names")).append("', ");
			sb.append(" isParent : ").append(module.getStr("isparent")).append(", ");
			sb.append(" nocheck : true, ");
			sb.append(" font : {'font-weight':'bold'}, ");
			sb.append(" icon : '/jsFile/zTree/css/zTreeStyle/img/diy/").append(module.getStr("images")).append("' ");
			sb.append(" }");
			if (listModule.indexOf(module) < moduleIndexSize) {
				sb.append(", ");
			}
		}

		sb.append("]");

		return sb.toString();
	}
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select o.ids, o.names, o.url, o.rowFilter, o.splitPage, o.formToken, o.privilegess, m.names as modulenames, s.names as systemsnames ";
		splitPageBase(splitPage, select, "pingtai.operator.splitPage");
	}
	
}
