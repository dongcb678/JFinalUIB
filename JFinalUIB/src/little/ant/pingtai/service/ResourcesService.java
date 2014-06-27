package little.ant.pingtai.service;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.model.Resources;
import little.ant.pingtai.run.JfinalConfig;
import little.ant.pingtai.tools.ToolDateTime;
import little.ant.pingtai.tools.ToolOS;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * 系统资源负载
 * @author 董华健
 */
public class ResourcesService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ResourcesService.class);

	/**
	 * 最近15天PV
	 * @return
	 */
	public Map<String, Object> pv(){
		Date endDate = ToolDateTime.endDateByDay(ToolDateTime.getDate());
		Date startDate = ToolDateTime.startDateByDay(endDate, -14);
		
		List<Record> list = null;
		String db_type = (String) JfinalConfig.getParamMapValue(DictKeys.db_type_key);
		if(db_type.equals(DictKeys.db_type_postgresql)){ // pg
			StringBuffer sql = new StringBuffer();
			sql.append(" select to_char(startdate, 'yyyy-MM-DD') adates, count(*) acounts from pt_syslog ");
			sql.append(" where startdate>=? and startdate<=? ");
			sql.append(" group by adates order by adates asc ");
			list = Db.find(sql.toString(), ToolDateTime.getSqlTimestamp(startDate), ToolDateTime.getSqlTimestamp(endDate));
		
		}else if(db_type.equals(DictKeys.db_type_mysql)){ // mysql
			StringBuffer sql = new StringBuffer();
			sql.append(" select date_format(startdate,'%Y-%m-%d') adates, count(*) acounts from pt_syslog ");
			sql.append(" where startdate>=? and startdate<=? ");
			sql.append(" group by adates order by adates asc ");
			list = Db.find(sql.toString(), ToolDateTime.getSqlTimestamp(startDate), ToolDateTime.getSqlTimestamp(endDate));
		}
		
		List<String> adates = new LinkedList<String>();
		List<Long> acounts = new LinkedList<Long>();
		for (Record record : list) {
			adates.add(ToolDateTime.format(record.getStr("adates"), ToolDateTime.pattern_date, "MM-dd"));
			acounts.add(record.getLong("acounts"));
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("adates", JSON.toJSON(adates).toString());
		map.put("acounts", JSON.toJSON(acounts).toString());
		return map;
	}
	
	/**
	 * 获取系统负载信息
	 * @return
	 */
	public Map<String, Object> getResources(){
		Date endDate = ToolDateTime.endDateByHour(new Date());
		Date startDate = ToolDateTime.startDateByHour(endDate, -24);
		
		String hostName = ToolOS.getOsLocalHostName(); // 获取本机名称
		
		List<Resources> list = Resources.dao.find(" select * from pt_resources where hostname=? and createdate>=? and createdate<=? order by createdate asc", hostName, ToolDateTime.getSqlTimestamp(startDate), ToolDateTime.getSqlTimestamp(endDate));
		
		List<String> datesList = new LinkedList<String>();
		List<Integer> cpuList = new LinkedList<Integer>();
		List<Long> phymemoryList = new LinkedList<Long>();
		List<Long> jvmmemoryList = new LinkedList<Long>();
		List<Long> gccountList = new LinkedList<Long>();
		
		Long phymemory = 0l;
		Long jvmmaxmemory = 0l;
		
		for (Resources resources : list) {
			phymemory = resources.getLong("phymemory");
			jvmmaxmemory = resources.getLong("jvmmaxmemory");
			
			datesList.add(ToolDateTime.format(resources.getDate("createdate"), "HH:mm"));
			
			int cpuratio = (int)(resources.getBigDecimal("cpuratio").doubleValue() * 100);
			cpuList.add(Integer.valueOf(cpuratio));
			
			phymemoryList.add(resources.getLong("phymemory") - resources.getLong("phyfreememory"));
			
			jvmmemoryList.add(resources.getLong("jvmtotalmemory") - resources.getLong("jvmfreememory"));
			
			gccountList.add(resources.getLong("gccount"));
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dates", JSON.toJSON(datesList).toString());
		
		map.put("cpu", JSON.toJSON(cpuList).toString());
		
		map.put("phymemorymax", phymemory);
		map.put("phymemoryval", JSON.toJSON(phymemoryList).toString());

		map.put("jvmmemorymax", jvmmaxmemory);
		map.put("jvmmemoryval", JSON.toJSON(jvmmemoryList).toString());
		
		map.put("gccount", JSON.toJSON(gccountList).toString());
		return map;
	}
	
}
