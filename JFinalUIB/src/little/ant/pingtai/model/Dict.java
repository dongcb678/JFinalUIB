package little.ant.pingtai.model;

import little.ant.pingtai.annotation.Table;

import org.apache.log4j.Logger;

@SuppressWarnings("unused")
@Table(tableName="pt_dict")
public class Dict extends BaseModel<Dict> {
	
	private static final long serialVersionUID = 2051998642258015518L;

	private static Logger log = Logger.getLogger(Dict.class);
	
	public static final Dict dao = new Dict();
	
	/**
	 * 根据编号查询字典
	 * @param number
	 * @return
	 */
	public Dict getByNumber(String number){
		Dict dict = dao.findFirst(" select ids, numbers, values form pt_dict from numbers = ? ", number);
		return dict;
	}
	
	/**
	 * 根据编号查询字典，带国际化
	 * @param number 编号
	 * @param i18n 国际化参数
	 * @return
	 */
	public Dict getByNumber(String number, String i18n){
		String values = "values";
		if(i18n.equals("zh") || i18n.equals("zh_CN")){
			values = "values_zhcn";
			
		} else if(i18n.equals("en") || i18n.equals("en_US")){
			values = "values_enus";
			
		} else if(i18n.equals("jp")){
			values = "values_jp";
			
		} else if(i18n.equals("zh_HK")){
			values = "values_zhhk";
			
		} else if(i18n.equals("zh_TW")){
			values = "values_zhtw";
			
		}
		Dict dict = dao.findFirst(" select ids, numbers, " + values + " values form pt_dict from numbers = ? ", number);
		return dict;
	}
	
	/**
	 * 根据主键查询字典，带国际化
	 * @param ids 主键
	 * @param i18n 国际化参数
	 * @return
	 */
	public Dict getByIds(String ids, String i18n){
		String values = "values";
		if(i18n.equals("zh") || i18n.equals("zh_CN")){
			values = "values_zhcn";
			
		} else if(i18n.equals("en") || i18n.equals("en_US")){
			values = "values_enus";
			
		} else if(i18n.equals("jp")){
			values = "values_jp";
			
		} else if(i18n.equals("zh_HK")){
			values = "values_zhhk";
			
		} else if(i18n.equals("zh_TW")){
			values = "values_zhtw";
			
		}
		Dict dict = dao.findFirst(" select ids, numbers, " + values + " values form pt_dict from ids = ? ", ids);
		return dict;
	}
	
}
