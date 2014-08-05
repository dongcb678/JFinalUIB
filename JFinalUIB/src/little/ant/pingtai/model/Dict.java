package little.ant.pingtai.model;

import java.util.List;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_dict")
public class Dict extends BaseModel<Dict> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Dict.class);
	
	public static final Dict dao = new Dict();

	/**
	 * 根据主键查询字典，带国际化
	 * @param ids 主键
	 * @param i18n 国际化参数
	 * @return
	 */
	public Dict getByIds(String ids, String i18n){
		String val = "val" + i18n(i18n);
		Dict dict = dao.findFirst(" select ids, numbers, parentids, " + val + " as val from pt_dict where ids = ? ", ids);
		return dict;
	}
	
	/**
	 * 根据编号查询字典
	 * @param number
	 * @return
	 */
	public Dict getByNumber(String number){
		Dict dict = dao.findFirst(" select * from pt_dict where numbers = ? ", number);
		return dict;
	}
	
	/**
	 * 根据编号查询字典，带国际化
	 * @param number 编号
	 * @param i18n 国际化参数
	 * @return
	 */
	public Dict getByNumber(String number, String i18n){
		String val = "val" + i18n(i18n);
		Dict dict = dao.findFirst(" select ids, numbers, parentids, " + val + " as val from pt_dict where numbers = ? ", number);
		return dict;
	}

	/**
	 * 查询子节点字典
	 * @return
	 */
	public List<Dict> getChild(){
		return dao.find(" select * from pt_dict where parentids = ? order by orderids ", get("ids"));
	}

	/**
	 * 查询子节点字典
	 * @param prentIds
	 * @return
	 */
	public List<Dict> getChild(String prentIds){
		return dao.find(" select * from pt_dict where parentids = ? order by orderids ", prentIds);
	}

	/**
	 * 查询子节点字典，国际化
	 * @param prentIds
	 * @param i18n
	 * @return
	 */
	public List<Dict> getChild(String prentIds, String i18n){
		String val = "val" + i18n(i18n);
		return dao.find(" select ids, numbers, parentids, " + val + " as val from pt_dict where parentids = ? order by orderids ", prentIds);
	}

	/**
	 * 查询父节点字典
	 * @return
	 */
	public List<Dict> getParent(){
		return dao.find(" select * from pt_dict where ids = ? ", get("parentids"));
	}

	/**
	 * 查询父节点字典，国际化
	 * @param i18n
	 * @return
	 */
	public List<Dict> getParent(String i18n){
		String val = "val" + i18n(i18n);
		return dao.find(" select ids, numbers, parentids, " + val + " as val from pt_dict where ids = ? ", get("parentids"));
	}

}
