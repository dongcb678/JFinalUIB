package little.ant.platform.service;

import java.util.List;

import little.ant.platform.common.DictKeys;
import little.ant.platform.model.Param;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class ParamService extends BaseService {

	private static Logger log = Logger.getLogger(ParamService.class);

	public static final ParamService service = new ParamService();
	
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
			Param pParam = Param.dao.findById(param.getStr("parentmenuids"));
			String sql = getSql("platform.param.childCount");
			Record record = Db.use(DictKeys.db_dataSource_main).findFirst(sql, pParam.getPKValue());
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
	public String childNodeData(String parentIds){
		List<Param> list = null;
		if (null != parentIds) {
			String sql = getSql("platform.param.treeChildNode");
			list = Param.dao.find(sql, parentIds);
		} else {
			String sql = getSql("platform.param.treeNodeRoot");
			list = Param.dao.find(sql);
		}

		StringBuilder sb = new StringBuilder();
		sb.append("[");
		int size = list.size() - 1;
		for (Param param : list) {
			sb.append(" { ");
			sb.append(" id : '").append(param.getPKValue()).append("', ");
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
