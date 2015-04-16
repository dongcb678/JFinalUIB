package little.ant.platform.service;

import java.util.ArrayList;
import java.util.List;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.ZtreeNode;
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
		String[] idsArr = splitByComma(ids);
		for (String dictIds : idsArr) {
			Dict dict = Dict.dao.findById(dictIds);
			
			// 是否存在子节点
			if(dict.getStr("isparent").equals("true")){
				log.error("存在子节点，不能直接删除");
				return;
			}
			
			// 修改上级节点的isparent
			Dict pDict = Dict.dao.findById(dict.getStr("parentmenuids"));
			String sql = getSql("platform.dict.childCount");
			Record record = Db.use(DictKeys.db_dataSource_main).findFirst(sql, pDict.getPKValue());
			Long counts = record.getNumber("counts").longValue();
		    if(counts == 1){
		    	pDict.set("isparent", "false");
		    	pDict.update();
		    }
		    
			// 缓存
			Dict.dao.cacheRemove(dictIds);
			
			// 删除
			Dict.dao.deleteById(dictIds);
		}
	}

	/**
	 * 获取子节点数据
	 * @param parentIds
	 * @return
	 */
	public List<ZtreeNode> childNodeData(String parentIds){
		List<Dict> list = null;
		if (null != parentIds) {
			String sql = getSql("platform.dict.treeChildNode");
			list = Dict.dao.find(sql, parentIds);
		} else {
			String sql = getSql("platform.dict.treeNodeRoot");
			list = Dict.dao.find(sql);
		}

		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		ZtreeNode node = null;
		
		for (Dict dict : list) {
			node = new ZtreeNode();
			node.setId(dict.getPKValue());
			node.setName(dict.getStr("names"));
			node.setIsParent(Boolean.parseBoolean(dict.getStr("isparent")));
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/" + dict.getStr("images"));
			nodeList.add(node);
		}
		
		return nodeList;
	}

}
