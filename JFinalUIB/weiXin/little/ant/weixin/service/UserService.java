package little.ant.weixin.service;

import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.service.BaseService;

import org.apache.log4j.Logger;

public class UserService extends BaseService {

	private static Logger log = Logger.getLogger(UserService.class);
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户管理：分页处理");
		String select = " select * ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuffer formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from wx_user where 1=1 ");
		
		if(null == queryParam){
			return;
		}

		String openid = queryParam.get("openid");//用户的标识
		String nickname = queryParam.get("nickname");//昵称

		if(null!=openid && !openid.equals("")){
			formSqlSb.append(" and openid like ? ");
			paramValue.add("%" + openid.trim() + "%");
		}
		if(null!=nickname && !nickname.equals("")){
			formSqlSb.append(" and nickname like ? ");
			paramValue.add("%" + nickname.trim() + "%");
		}
	}

}
