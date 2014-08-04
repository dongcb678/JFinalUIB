package little.ant.pingtai.service;

import java.util.List;

import little.ant.pingtai.model.Dict;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.tools.ToolEhcacheFactory;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;

public class DictService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(DictService.class);
	
	/**
	 * 保存
	 * @param dict
	 */
	@Before(Tx.class)
	public void save(Dict dict) {
		String pIds = dict.getStr("parentids");
		Dict parent = Dict.dao.findById(pIds);
		parent.set("isparent", "true").update();

		Long orderIds = dict.getNumber("orderids").longValue();
		if (orderIds < 2 || orderIds > 9) {
			dict.set("images", "2.png");
		} else {
			dict.set("images", orderIds + ".png");
		}

		dict.set("isparent", "false").set("levels", parent.getNumber("levels").longValue() + 1);
		dict.save();
		
		dict.set("paths", parent.get("paths") + "/" + dict.getStr("ids")).update();
		
		// 缓存
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.add(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("ids"), dict);
		cacheFactory.add(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("numbers"), dict);
		cacheFactory.add(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_dict_child + dict.getStr("ids"), dict.getChild());
	}

	/**
	 * 更新
	 * @param dict
	 */
	@Before(Tx.class)
	public void update(Dict dict) {
		String pIds = dict.getStr("parentids");
		Dict parent = Dict.dao.findById(pIds);
		parent.set("isparent", "true").update();
		
		dict.set("parentids", pIds).set("levels", parent.getNumber("levels").longValue() + 1);
		dict.set("paths", parent.get("paths") + "/" + dict.getPrimaryKeyValue());
		dict.update();
		
		// 缓存
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("ids"), dict);
		cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("numbers"), dict);
		cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_dict_child + dict.getStr("ids"), dict.getChild());
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		// 查询
		Dict dict = Dict.dao.findById(ids);
		
		// 缓存
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.delete(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_dict + ids);
		cacheFactory.delete(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_dict + dict.getStr("numbers"));
		cacheFactory.delete(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_dict_child + ids);
		
		// 删除
		dict.delete();
	}

	/**
	 * 获取子节点数据
	 * @param parentIds
	 * @return
	 */
	public String childNodeData(String parentIds){
		String sql = null;
		List<Dict> list = null;
		if (null != parentIds) {
			sql = " select ids, names, isparent, images from pt_dict where parentIds = ? order by orderids asc ";
			list = Dict.dao.find(sql, parentIds);
		} else {
			sql = " select ids, names, isparent, images from pt_dict where parentIds is null order by orderIds asc ";
			list = Dict.dao.find(sql);
		}

		StringBuilder sb = new StringBuilder();
		sb.append("[");
		int size = list.size() - 1;
		for (Dict dict : list) {
			sb.append(" { ");
			sb.append(" id : '").append(dict.getStr("ids")).append("', ");
			sb.append(" name : '").append(dict.getStr("names")).append("', ");
			sb.append(" isParent : ").append(dict.getStr("isparent")).append(", ");
			sb.append(" font : {'font-weight':'bold'}, ");
			sb.append(" icon : '/jsFile/zTree/css/zTreeStyle/img/diy/").append(dict.getStr("images")).append("' ");
			sb.append(" }");
			if (list.indexOf(dict) < size) {
				sb.append(", ");
			}
		}
		sb.append("]");

		return sb.toString();
	}

}
