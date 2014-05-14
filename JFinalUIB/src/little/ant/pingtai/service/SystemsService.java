package little.ant.pingtai.service;

import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;

import org.apache.log4j.Logger;

public class SystemsService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SystemsService.class);

	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select * ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuffer formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from pt_systems where 1=1 ");
		
		if(null == queryParam){
			return;
		}
		
		String names = queryParam.get("names");//
		
		if(null!=names && !names.equals("")){
			formSqlSb.append(" and names like ? ");
			paramValue.add("%" + names.trim() + "%");
		}
	}
	
}
