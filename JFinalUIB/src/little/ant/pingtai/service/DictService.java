package little.ant.pingtai.service;

import java.util.List;

import little.ant.pingtai.model.Dict;
import little.ant.pingtai.thread.ParamInit;
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

		Long orderIds = dict.getLong("orderids");
		if (orderIds < 2 || orderIds > 9) {
			dict.set("images", "2.png");
		} else {
			dict.set("images", orderIds + ".png");
		}

		dict.set("isparent", "false").set("levels", parent.getLong("levels") + 1);
		dict.save();
		
		dict.set("paths", parent.get("paths") + "/" + dict.getStr("ids")).update();
		
		// 缓存
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.add(ToolEhcacheFactory.cache_name_system, ParamInit.cacheStart_dict + dict.getStr("ids"), dict);
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
		
		dict.set("parentids", pIds).set("levels", parent.getLong("levels") + 1);
		dict.set("paths", parent.get("paths") + "/" + dict.getPrimaryKeyValue());
		dict.update();
		
		// 缓存
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.update(ToolEhcacheFactory.cache_name_system, ParamInit.cacheStart_dict + dict.getStr("ids"), dict);
	}

	/**
	 * 更新
	 * @param ids
	 */
	public void delete(String ids){
		// 缓存
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.delete(ToolEhcacheFactory.cache_name_system, ParamInit.cacheStart_dict + ids);
		
		// 删除
		Dict.dao.deleteById(ids);
	}

	/**
	 * 获取子节点数据
	 * 
	 * @param parentIds
	 * @return
	 * @throws Exception
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

		StringBuffer sb = new StringBuffer();
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
