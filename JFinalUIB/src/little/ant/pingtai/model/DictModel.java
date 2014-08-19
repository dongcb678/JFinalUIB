package little.ant.pingtai.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.annotation.Table;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_dict")
public class DictModel extends BaseModel<DictModel> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(DictModel.class);
	
	public static final DictModel dao = new DictModel();

	/**
	 * 根据主键查询字典，带国际化
	 * @param ids 主键
	 * @param i18n 国际化参数
	 * @return
	 */
	public DictModel getByIds(String ids, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = ToolSqlXml.getSql("pingtai.dict.idAndI18n", param);
		
		DictModel dict = dao.findFirst(sql, ids);
		
		return dict;
	}
	
	/**
	 * 根据编号查询字典
	 * @param number
	 * @return
	 */
	public DictModel getByNumber(String number){
		String sql = ToolSqlXml.getSql("pingtai.dict.numbers");
		DictModel dict = dao.findFirst(sql, number);
		return dict;
	}
	
	/**
	 * 根据编号查询字典，带国际化
	 * @param number 编号
	 * @param i18n 国际化参数
	 * @return
	 */
	public DictModel getByNumber(String number, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = ToolSqlXml.getSql("pingtai.dict.numbersAndI18n", param);
		
		DictModel dict = dao.findFirst(sql, number);
		
		return dict;
	}

	/**
	 * 查询子节点字典
	 * @return
	 */
	public List<DictModel> getChild(){
		String sql = ToolSqlXml.getSql("pingtai.dict.child");
		return dao.find(sql, get("ids"));
	}

	/**
	 * 查询子节点字典
	 * @param prentIds
	 * @return
	 */
	public List<DictModel> getChild(String prentIds){
		String sql = ToolSqlXml.getSql("pingtai.dict.child");
		return dao.find(sql, prentIds);
	}

	/**
	 * 查询子节点字典，国际化
	 * @param prentIds
	 * @param i18n
	 * @return
	 */
	public List<DictModel> getChild(String prentIds, String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = ToolSqlXml.getSql("pingtai.dict.childAndI8n", param);
		
		return dao.find(sql, prentIds);
	}

	/**
	 * 查询父节点字典
	 * @return
	 */
	public List<DictModel> getParent(){
		String sql = ToolSqlXml.getSql("pingtai.dict.parent");
		return dao.find(sql, get("parentids"));
	}

	/**
	 * 查询父节点字典，国际化
	 * @param i18n
	 * @return
	 */
	public List<DictModel> getParent(String i18n){
		String val = "val" + i18n(i18n);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("val", val);
		
		String sql = ToolSqlXml.getSql("pingtai.dict.parentAndI18n", param);
		
		return dao.find(sql, get("parentids"));
	}

}
