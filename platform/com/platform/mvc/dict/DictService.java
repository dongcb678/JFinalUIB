package com.platform.mvc.dict;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.platform.annotation.Service;
import com.platform.constant.ConstantInit;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseService;

@Service(name = DictService.serviceName)
public class DictService extends BaseService {

	private static final Log log = Log.getLog(DictService.class);

	public static final String serviceName = "dictService";

	/**
	 * 保存
	 * @param dict
	 */
	public void save(Dict dict) {
		String pIds = dict.getStr(Dict.column_parentids);
		Dict parent = Dict.dao.findById(pIds);
		parent.set(Dict.column_isparent, "true").update();

		Long orderIds = dict.getNumber(Dict.column_orderids).longValue();
		if (orderIds < 2 || orderIds > 9) {
			dict.set(Dict.column_images, "2.png");
		} else {
			dict.set(Dict.column_images, orderIds + ".png");
		}

		dict.set(Dict.column_isparent, "false").set("levels", parent.getNumber(Dict.column_levels).longValue() + 1);
		dict.save();
		
		dict.set(Dict.column_paths, parent.get(Dict.column_paths) + "/" + dict.getPKValue()).update();
		
		// 缓存
		Dict.dao.cacheAdd(dict.getPKValue());
	}

	/**
	 * 更新
	 * @param dict
	 */
	public void update(Dict dict) {
		String pIds = dict.getStr(Dict.column_parentids);
		Dict parent = Dict.dao.findById(pIds);
		parent.set(Dict.column_isparent, "true").update();
		
		dict.set(Dict.column_parentids, pIds).set(Dict.column_levels, parent.getNumber(Dict.column_levels).longValue() + 1);
		dict.set(Dict.column_paths, parent.get(Dict.column_paths) + "/" + dict.getPKValue());
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
			if(dict.getStr(Dict.column_isparent).equals("true")){
				if(log.isErrorEnabled()) log.error("存在子节点，不能直接删除");
				return;
			}
			
			// 修改上级节点的isparent
			Dict pDict = Dict.dao.findById(dict.getStr(Dict.column_parentids));
			String sql = getSqlMy(Dict.sqlId_childCount);
			Record record = Db.use(ConstantInit.db_dataSource_main).findFirst(sql, pDict.getPKValue());
			Long counts = record.getNumber("counts").longValue();
		    if(counts == 1){
		    	pDict.set(Dict.column_isparent, "false");
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
	 * @param cxt
	 * @param parentIds
	 * @return
	 */
	public List<ZtreeNode> childNodeData(String cxt, String parentIds){
		List<Dict> list = null;
		if (null != parentIds) {
			String sql = getSqlMy(Dict.sqlId_treeChildNode);
			list = Dict.dao.find(sql, parentIds);
		} else {
			String sql = getSqlMy(Dict.sqlId_treeNodeRoot);
			list = Dict.dao.find(sql);
		}

		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		ZtreeNode node = null;
		
		for (Dict dict : list) {
			node = new ZtreeNode();
			node.setId(dict.getPKValue());
			node.setName(dict.getStr(Dict.column_names));
			node.setIsParent(Boolean.parseBoolean(dict.getStr(Dict.column_isparent)));
			node.setIcon(cxt + "/jsfile/ztree/css/zTreeStyle/img/diy/" + dict.getStr(Dict.column_images));
			nodeList.add(node);
		}
		
		return nodeList;
	}

}
