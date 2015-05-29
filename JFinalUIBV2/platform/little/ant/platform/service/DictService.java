package little.ant.platform.service;

import java.util.ArrayList;
import java.util.List;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.ZtreeNode;
import little.ant.platform.model.Dict;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class DictService extends BaseService {

	private static Logger log = Logger.getLogger(DictService.class);

	public static final DictService service = MyTxProxy.newProxy(DictService.class);
	
	/**
	 * 保存
	 * @param dict
	 */
	public void save(Dict dict) {
		String pIds = dict.getStr(Dict.colunm_parentids);
		Dict parent = Dict.dao.findById(pIds);
		parent.set(Dict.colunm_isparent, "true").update();

		Long orderIds = dict.getNumber(Dict.colunm_orderids).longValue();
		if (orderIds < 2 || orderIds > 9) {
			dict.set(Dict.colunm_images, "2.png");
		} else {
			dict.set(Dict.colunm_images, orderIds + ".png");
		}

		dict.set(Dict.colunm_isparent, "false").set("levels", parent.getNumber(Dict.colunm_levels).longValue() + 1);
		dict.save();
		
		dict.set(Dict.colunm_paths, parent.get(Dict.colunm_paths) + "/" + dict.getPKValue()).update();
		
		// 缓存
		Dict.dao.cacheAdd(dict.getPKValue());
	}

	/**
	 * 更新
	 * @param dict
	 */
	public void update(Dict dict) {
		String pIds = dict.getStr(Dict.colunm_parentids);
		Dict parent = Dict.dao.findById(pIds);
		parent.set(Dict.colunm_isparent, "true").update();
		
		dict.set(Dict.colunm_parentids, pIds).set(Dict.colunm_levels, parent.getNumber(Dict.colunm_levels).longValue() + 1);
		dict.set(Dict.colunm_paths, parent.get(Dict.colunm_paths) + "/" + dict.getPKValue());
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
			if(dict.getStr(Dict.colunm_isparent).equals("true")){
				log.error("存在子节点，不能直接删除");
				return;
			}
			
			// 修改上级节点的isparent
			Dict pDict = Dict.dao.findById(dict.getStr(Dict.colunm_parentids));
			String sql = getSql("platform.dict.childCount");
			Record record = Db.use(ConstantInit.db_dataSource_main).findFirst(sql, pDict.getPKValue());
			Long counts = record.getNumber("counts").longValue();
		    if(counts == 1){
		    	pDict.set(Dict.colunm_isparent, "false");
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
			node.setName(dict.getStr(Dict.colunm_names));
			node.setIsParent(Boolean.parseBoolean(dict.getStr(Dict.colunm_isparent)));
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/" + dict.getStr(Dict.colunm_images));
			nodeList.add(node);
		}
		
		return nodeList;
	}

}
