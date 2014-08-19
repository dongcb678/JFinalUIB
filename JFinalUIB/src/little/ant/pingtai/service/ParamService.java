package little.ant.pingtai.service;

import java.util.List;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.model.ParamModel;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.ehcache.CacheKit;

public class ParamService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ParamService.class);
	
	/**
	 * 保存
	 * @param param
	 */
	@Before(Tx.class)
	public void save(ParamModel param) {
		String pIds = param.getStr("parentids");
		ParamModel parent = ParamModel.dao.findById(pIds);
		parent.set("isparent", "true").update();

		Long orderIds = param.getNumber("orderids").longValue();
		if (orderIds < 2 || orderIds > 9) {
			param.set("images", "2.png");
		} else {
			param.set("images", orderIds + ".png");
		}

		param.set("isparent", "false").set("levels", parent.getNumber("levels").longValue() + 1);
		param.save();
		
		param.set("paths", parent.get("paths") + "/" + param.getStr("ids")).update();
		
		// 缓存
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + param.getStr("ids"), param);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + param.getStr("numbers"), param);
		
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + parent.getStr("parentids"), parent.getChild());
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + parent.getStr("numbers"), parent.getChild());
	}

	/**
	 * 更新
	 * @param param
	 */
	@Before(Tx.class)
	public void update(ParamModel param) {
		String pIds = param.getStr("parentids");
		ParamModel parent = ParamModel.dao.findById(pIds);
		parent.set("isparent", "true").update();
		
		param.set("parentids", pIds).set("levels", parent.getNumber("levels").longValue() + 1);
		param.set("paths", parent.get("paths") + "/" + param.getPrimaryKeyValue());
		param.update();
		
		// 缓存
		param = ParamModel.dao.findById(param.getPrimaryKeyValue());
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + param.getStr("ids"), param);
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + param.getStr("numbers"), param);
		
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + parent.getStr("parentids"), parent.getChild());
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + parent.getStr("numbers"), parent.getChild());
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		// 查询
		ParamModel param = ParamModel.dao.findById(ids);
		String pIds = param.getStr("parentids");
		ParamModel parent = ParamModel.dao.findById(pIds);

		// 删除
		param.delete();
		
		// 缓存
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + ids);
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param + param.getStr("numbers"));
		CacheKit.remove(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + ids);
		
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + parent.getStr("parentids"), parent.getChild());
		CacheKit.put(DictKeys.cache_name_system, ThreadParamInit.cacheStart_param_child + parent.getStr("numbers"), parent.getChild());
	}

	/**
	 * 获取子节点数据
	 * @param parentIds
	 * @return
	 */
	public String childNodeData(String parentIds){
		List<ParamModel> list = null;
		if (null != parentIds) {
			String sql = ToolSqlXml.getSql("pingtai.param.treeChildNode");
			list = ParamModel.dao.find(sql, parentIds);
		} else {
			String sql = ToolSqlXml.getSql("pingtai.param.treeNodeRoot");
			list = ParamModel.dao.find(sql);
		}

		StringBuilder sb = new StringBuilder();
		sb.append("[");
		int size = list.size() - 1;
		for (ParamModel param : list) {
			sb.append(" { ");
			sb.append(" id : '").append(param.getStr("ids")).append("', ");
			sb.append(" name : '").append(param.getStr("names")).append("', ");
			sb.append(" isParent : ").append(param.getStr("isparent")).append(", ");
			sb.append(" font : {'font-weight':'bold'}, ");
			sb.append(" icon : '/jsFile/zTree/css/zTreeStyle/img/diy/").append(param.getStr("images")).append("' ");
			sb.append(" }");
			if (list.indexOf(param) < size) {
				sb.append(", ");
			}
		}
		sb.append("]");

		return sb.toString();
	}

}
