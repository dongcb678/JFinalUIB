package little.ant.weixin.service;

import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.service.BaseService;

import org.apache.log4j.Logger;

public class GroupService extends BaseService {

	private static Logger log = Logger.getLogger(GroupService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户分组管理：分页处理");
		String select = " select * ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuilder formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from wx_group where 1=1 ");
		
		if(null == queryParam){
			return;
		}

		String name = queryParam.get("name");//组名称

		if(null!=name && !name.equals("")){
			formSqlSb.append(" and name like ? ");
			paramValue.add("%" + name.trim() + "%");
		}
	}


}
