package little.ant.platform.service;

import java.util.ArrayList;
import java.util.List;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.ZtreeNode;
import little.ant.platform.model.Param;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class ParamService extends BaseService {

	private static Logger log = Logger.getLogger(ParamService.class);

	public static final ParamService service = MyTxProxy.newProxy(ParamService.class);
	
	/**
	 * 保存
	 * @param param
	 */
	public void save(Param param) {
		String pIds = param.getStr("parentids");
		Param parent = Param.dao.findById(pIds);
		parent.set("isparent", "true").update();

		Long orderIds = param.getNumber("orderids").longValue();
		if (orderIds < 2 || orderIds > 9) {
			param.set("images", "2.png");
		} else {
			param.set("images", orderIds + ".png");
		}

		param.set("isparent", "false").set("levels", parent.getNumber("levels").longValue() + 1);
		param.save();
		
		param.set("paths", parent.get("paths") + "/" + param.getPKValue()).update();
		
		// 缓存
		Param.dao.cacheAdd(param.getPKValue());
	}

	/**
	 * 更新
	 * @param param
	 */
	public void update(Param param) {
		String pIds = param.getStr("parentids");
		Param parent = Param.dao.findById(pIds);
		parent.set("isparent", "true").update();
		
		param.set("parentids", pIds).set("levels", parent.getNumber("levels").longValue() + 1);
		param.set("paths", parent.get("paths") + "/" + param.getPKValue());
		param.update();
		
		// 缓存
		Param.dao.cacheAdd(param.getPKValue());
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String paramIds : idsArr) {
			Param param = Param.dao.findById(paramIds);
			
			// 是否存在子节点
			if(param.getStr("isparent").equals("true")){
				log.error("存在子节点，不能直接删除");
				return;
			}
			
			// 修改上级节点的isparent
			Param pParam = Param.dao.findById(param.getStr(Param.colunm_parentids));
			String sql = getSql(Param.sqlId_childCount);
			Record record = Db.use(ConstantInit.db_dataSource_main).findFirst(sql, pParam.getPKValue());
			Long counts = record.getNumber("counts").longValue();
		    if(counts == 1){
		    	pParam.set("isparent", "false");
		    	pParam.update();
		    }
		    
			// 缓存
			Param.dao.cacheRemove(paramIds);
			
			// 删除
			Param.dao.deleteById(paramIds);
		}
	}

	/**
	 * 获取子节点数据
	 * @param parentIds
	 * @return
	 */
	public List<ZtreeNode> childNodeData(String parentIds){
		List<Param> list = null;
		if (null != parentIds) {
			String sql = getSql(Param.sqlId_treeChildNode);
			list = Param.dao.find(sql, parentIds);
		} else {
			String sql = getSql(Param.sqlId_treeNodeRoot);
			list = Param.dao.find(sql);
		}

		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		ZtreeNode node = null;
		
		for (Param param : list) {
			node = new ZtreeNode();
			node.setId(param.getPKValue());
			node.setName(param.getStr("names"));
			node.setIsParent(true);
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/" + param.getStr("images"));
			nodeList.add(node);
		}
		
		return nodeList;
	}

}
