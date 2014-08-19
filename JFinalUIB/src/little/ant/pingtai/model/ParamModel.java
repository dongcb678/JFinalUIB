package little.ant.pingtai.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_param")
public class ParamModel extends BaseModel<ParamModel> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(ParamModel.class);
	
	public static final ParamModel dao = new ParamModel();

	/**
	 * 根据主键查询参数，带国际化
	 * @param ids 主键
	 * @param i18n 国际化参数
	 * @return
	 */
	public ParamModel getByIds(String ids, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("val", val);
		
		String sql = ToolSqlXml.getSql("pingtai.param.idAndI18n", paramMap);
		
		ParamModel param = dao.findFirst(sql, ids);
		return param;
	}
	
	/**
	 * 根据编号查询参数
	 * @param number
	 * @return
	 */
	public ParamModel getByNumber(String number){
		String sql = ToolSqlXml.getSql("pingtai.param.numbers");
		ParamModel param = dao.findFirst(sql, number);
		return param;
	}
	
	/**
	 * 根据编号查询参数，带国际化
	 * @param number 编号
	 * @param i18n 国际化参数
	 * @return
	 */
	public ParamModel getByNumber(String number, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("val", val);
		
		String sql = ToolSqlXml.getSql("pingtai.param.numbersAndI18n", paramMap);
		
		ParamModel param = dao.findFirst(sql, number);
		return param;
	}

	/**
	 * 查询子节点参数
	 * @return
	 */
	public List<ParamModel> getChild(){
		String sql = ToolSqlXml.getSql("pingtai.param.child");
		return dao.find(sql, get("ids"));
	}

	/**
	 * 查询子节点参数
	 * @param prentIds
	 * @return
	 */
	public List<ParamModel> getChild(String prentIds){
		String sql = ToolSqlXml.getSql("pingtai.param.child");
		return dao.find(sql, prentIds);
	}

	/**
	 * 查询子节点参数，国际化
	 * @param prentIds
	 * @param i18n
	 * @return
	 */
	public List<ParamModel> getChild(String prentIds, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = ToolSqlXml.getSql("pingtai.param.childAndI8n", param);
		
		return dao.find(sql, prentIds);
	}

	/**
	 * 查询父节点参数
	 * @return
	 */
	public List<ParamModel> getParent(){
		String sql = ToolSqlXml.getSql("pingtai.param.parent");
		return dao.find(sql, get("parentids"));
	}

	/**
	 * 查询父节点参数，国际化
	 * @param i18n
	 * @return
	 */
	public List<ParamModel> getParent(String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = ToolSqlXml.getSql("pingtai..parentAndI18n", param);
		
		return dao.find(sql, get("parentids"));
	}

}
