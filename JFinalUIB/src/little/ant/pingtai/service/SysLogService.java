package little.ant.pingtai.service;

import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.Syslog;

import org.apache.log4j.Logger;

public class SysLogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogService.class);
	
	public Syslog view(String ids){
		StringBuffer sql = new StringBuffer();
		sql.append(" select s.*, o.names onames, o.url ourl, u.username ");
		sql.append(" from pt_syslog s ");
		sql.append(" left join pt_user u on s.userids = u.ids ");
		sql.append(" left join pt_operator o on s.operatorids = o.ids ");
		sql.append(" where s.ids = ? ");
		return Syslog.dao.findFirst(sql.toString(), ids);
	}

	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select o.names onames, o.url ourl, u.username, s.* ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuffer formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from pt_syslog s ");
		formSqlSb.append(" left join pt_user u on s.userids = u.ids ");
		formSqlSb.append(" left join pt_operator o on s.operatorids = o.ids ");
		formSqlSb.append(" where 1=1 ");
		
		if(null == queryParam){
			return;
		}

		String names = queryParam.get("names");//操作名称
		if(null!=names && !names.equals("")){
			formSqlSb.append(" and o.names like ? ");
			paramValue.add("%" + names.trim() + "%");
		}
		
		String username = queryParam.get("username");//用户名称
		if(null!=username && !username.equals("")){
			formSqlSb.append(" and u.username like ? ");
			paramValue.add("%" + username.trim() + "%");
		}

		String ips = queryParam.get("ips");//ip
		if(null!=ips && !ips.equals("")){
			formSqlSb.append(" and s.ips like ? ");
			paramValue.add("%" + ips.trim() + "%");
		}

		String status = queryParam.get("status");//状态
		if(null!=status && !status.equals("")){
			formSqlSb.append(" and s.status = ? ");
			paramValue.add(status);
		}
	}
	
}
