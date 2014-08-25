package little.ant.pingtai.service;

import java.util.List;

import little.ant.pingtai.model.Param;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;

public class ParamService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ParamService.class);

	public static final ParamService service = new ParamService();
	
	/**
	 * 保存
	 * @param param
	 */
	@Before(Tx.class)
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
		
		param.set("paths", parent.get("paths") + "/" + param.getStr("ids")).update();
		
		// 缓存
		Param.dao.cacheAdd(param.getStr("ids"));
	}

	/**
	 * 更新
	 * @param param
	 */
	@Before(Tx.class)
	public void update(Param param) {
		String pIds = param.getStr("parentids");
		Param parent = Param.dao.findById(pIds);
		parent.set("isparent", "true").update();
		
		param.set("parentids", pIds).set("levels", parent.getNumber("levels").longValue() + 1);
		param.set("paths", parent.get("paths") + "/" + param.getPrimaryKeyValue());
		param.update();
		
		// 缓存
		Param.dao.cacheAdd(param.getStr("ids"));
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		// 缓存
		Param.dao.cacheRemove(ids);

		// 删除
		Param.dao.deleteById(ids);
	}

	/**
	 * 获取子节点数据
	 * @param parentIds
	 * @return
	 */
	public String childNodeData(String parentIds){
		List<Param> list = null;
		if (null != parentIds) {
			String sql = ToolSqlXml.getSql("pingtai.param.treeChildNode");
			list = Param.dao.find(sql, parentIds);
		} else {
			String sql = ToolSqlXml.getSql("pingtai.param.treeNodeRoot");
			list = Param.dao.find(sql);
		}

		StringBuilder sb = new StringBuilder();
		sb.append("[");
		int size = list.size() - 1;
		for (Param param : list) {
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
