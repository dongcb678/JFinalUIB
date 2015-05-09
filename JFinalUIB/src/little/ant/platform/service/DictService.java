package little.ant.platform.service;

import java.util.List;

import little.ant.platform.common.DictKeys;
import little.ant.platform.model.Dict;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class DictService extends BaseService {

	private static Logger log = Logger.getLogger(DictService.class);

	public static final DictService service = new DictService();
	
	/**
	 * 保存
	 * @param dict
	 */
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
		
		dict.set("paths", parent.get("paths") + "/" + dict.getPKValue()).update();
		
		// 缓存
		Dict.dao.cacheAdd(dict.getPKValue());
	}

	/**
	 * 更新
	 * @param dict
	 */
	public void update(Dict dict) {
		String pIds = dict.getStr("parentids");
		Dict parent = Dict.dao.findById(pIds);
		parent.set("isparent", "true").update();
		
		dict.set("parentids", pIds).set("levels", parent.getNumber("levels").longValue() + 1);
		dict.set("paths", parent.get("paths") + "/" + dict.getPKValue());
		dict.update();
		
		// 缓存
		Dict.dao.cacheAdd(dict.getPKValue());
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		Dict dict = Dict.dao.findById(ids);
		
		// 是否存在子节点
		if(dict.getStr("isparent").equals("true")){
			log.error("存在子节点，不能直接删除");
			return;
		}
		
		// 修改上级节点的isparent
		Dict pDict = Dict.dao.findById(dict.getStr("parentids"));
		String sql = getSql("platform.dict.childCount");
		Record record = Db.use(DictKeys.db_dataSource_main).findFirst(sql, pDict.getPKValue());
		Long counts = record.getNumber("counts").longValue();
	    if(counts == 1){
	    	pDict.set("isparent", "false");
	    	pDict.update();
	    }
	    
		// 缓存
		Dict.dao.cacheRemove(ids);
		
		// 删除
		Dict.dao.deleteById(ids);
	}

	/**
	 * 获取子节点数据
	 * @param parentIds
	 * @return
	 */
	public String childNodeData(String parentIds){
		List<Dict> list = null;
		if (null != parentIds) {
			String sql = getSql("platform.dict.treeChildNode");
			list = Dict.dao.find(sql, parentIds);
		} else {
			String sql = getSql("platform.dict.treeNodeRoot");
			list = Dict.dao.find(sql);
		}

		StringBuilder sb = new StringBuilder();
		sb.append("[");
		int size = list.size() - 1;
		for (Dict dict : list) {
			sb.append(" { ");
			sb.append(" id : '").append(dict.getPKValue()).append("', ");
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
