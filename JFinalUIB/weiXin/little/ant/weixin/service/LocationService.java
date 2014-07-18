package little.ant.weixin.service;

import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.service.BaseService;

import org.apache.log4j.Logger;

public class LocationService extends BaseService {

	private static Logger log = Logger.getLogger(LocationService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户位置管理：分页处理");
		String select = " select * ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuilder formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from wx_location where 1=1 ");
		
		if(null == queryParam){
			return;
		}

		String open_id = queryParam.get("open_id");//open_id

		if(null!=open_id && !open_id.equals("")){
			formSqlSb.append(" and open_id like ? ");
			paramValue.add("%" + open_id.trim() + "%");
		}
	}


}
