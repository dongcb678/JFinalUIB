package little.ant.pingtai.model;

import java.util.List;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_param")
public class Param extends BaseModel<Param> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Param.class);
	
	public static final Param dao = new Param();

	/**
	 * 根据主键查询参数，带国际化
	 * @param ids 主键
	 * @param i18n 国际化参数
	 * @return
	 */
	public Param getByIds(String ids, String i18n){
		String val = "val" + i18n(i18n);
		Param dict = dao.findFirst(" select ids, numbers, parentids, " + val + " as val from pt_param where ids = ? ", ids);
		return dict;
	}
	
	/**
	 * 根据编号查询参数
	 * @param number
	 * @return
	 */
	public Param getByNumber(String number){
		Param dict = dao.findFirst(" select * from pt_param where numbers = ? ", number);
		return dict;
	}
	
	/**
	 * 根据编号查询参数，带国际化
	 * @param number 编号
	 * @param i18n 国际化参数
	 * @return
	 */
	public Param getByNumber(String number, String i18n){
		String val = "val" + i18n(i18n);
		Param dict = dao.findFirst(" select ids, numbers, parentids, " + val + " as val from pt_param where numbers = ? ", number);
		return dict;
	}

	/**
	 * 查询子节点参数
	 * @return
	 */
	public List<Param> getChild(){
		return dao.find(" select * from pt_param where parentids = ? order by orderids ", get("ids"));
	}

	/**
	 * 查询子节点参数
	 * @param prentIds
	 * @return
	 */
	public List<Param> getChild(String prentIds){
		return dao.find(" select * from pt_param where parentids = ? order by orderids ", prentIds);
	}

	/**
	 * 查询子节点参数，国际化
	 * @param prentIds
	 * @param i18n
	 * @return
	 */
	public List<Param> getChild(String prentIds, String i18n){
		String val = "val" + i18n(i18n);
		return dao.find(" select ids, numbers, parentids, " + val + " as val from pt_param where parentids = ? order by orderids ", prentIds);
	}

	/**
	 * 查询父节点参数
	 * @return
	 */
	public List<Param> getParent(){
		return dao.find(" select * from pt_param where ids = ? ", get("parentids"));
	}

	/**
	 * 查询父节点参数，国际化
	 * @param i18n
	 * @return
	 */
	public List<Param> getParent(String i18n){
		String val = "val" + i18n(i18n);
		return dao.find(" select ids, numbers, parentids, " + val + " as val from pt_param where ids = ? ", get("parentids"));
	}

}
