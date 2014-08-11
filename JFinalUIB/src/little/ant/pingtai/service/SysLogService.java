package little.ant.pingtai.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.Syslog;
import little.ant.pingtai.tools.ToolSqlXml;

import org.apache.log4j.Logger;

public class SysLogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogService.class);
	
	public Syslog view(String ids){
		String sql = ToolSqlXml.getSql("pingtai.sysLog.view");
		return Syslog.dao.findFirst(sql, ids);
	}

	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select o.names onames, o.url ourl, u.username, s.* ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuilder formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from pt_syslog s ");
		formSqlSb.append(" left join pt_user u on s.userids = u.ids ");
		formSqlSb.append(" left join pt_operator o on s.operatorids = o.ids ");
		formSqlSb.append(" where 1=1 ");
		
		Set<String> paramKeySet = queryParam.keySet();
		for (String paramKey : paramKeySet) {
			String value = queryParam.get(paramKey);
			switch (paramKey) {
			case "url":	//操作url
				formSqlSb.append(" and o.url like ? ");
				paramValue.add("%" + value + "%");
				break;

			case "names":	//操作名称
				formSqlSb.append(" and o.names like ? ");
				paramValue.add("%" + value + "%");
				break;

			case "username":	//用户名称
				formSqlSb.append(" and u.username like ? ");
				paramValue.add("%" + value + "%");
				break;

			case "ips":	//ip
				formSqlSb.append(" and s.ips like ? ");
				paramValue.add("%" + value + "%");
				break;

			case "status":	//状态
				formSqlSb.append(" and s.status = ? ");
				paramValue.add(value);
				break;

			default:
				break;
			}
		}
	}
	
}
