package little.ant.platform.service;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import little.ant.platform.common.DictKeys;
import little.ant.platform.model.Resources;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.tools.ToolDateTime;
import little.ant.platform.tools.ToolOS;
import little.ant.platform.tools.ToolSqlXml;

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

	public static final ResourcesService service = new ResourcesService();
	
	/**
	 * 最近15天PV
	 * @return
	 */
	public Map<String, Object> pv(){
		Date endDate = ToolDateTime.endDateByDay(ToolDateTime.getDate());
		Date startDate = ToolDateTime.startDateByDay(endDate, -14);
		
		List<Record> list = null;
		String db_type = (String) PropertiesPlugin.getParamMapValue(DictKeys.db_type_key);
		if(db_type.equals(DictKeys.db_type_postgresql)){ // pg
			String sql = ToolSqlXml.getSql("platform.resources.pv_pg");
			list = Db.use(DictKeys.db_dataSource_main).find(sql, ToolDateTime.getSqlTimestamp(startDate), ToolDateTime.getSqlTimestamp(endDate));
		
		}else if(db_type.equals(DictKeys.db_type_mysql)){ // mysql
			String sql = ToolSqlXml.getSql("platform.resources.pv_mysql");
			list = Db.use(DictKeys.db_dataSource_main).find(sql, ToolDateTime.getSqlTimestamp(startDate), ToolDateTime.getSqlTimestamp(endDate));
		
		}else if(db_type.equals(DictKeys.db_type_oracle)){ // oracle
			String sql = ToolSqlXml.getSql("platform.resources.pv_oracle");
			list = Db.use(DictKeys.db_dataSource_main).find(sql, ToolDateTime.getSqlTimestamp(startDate), ToolDateTime.getSqlTimestamp(endDate));
		}
		
		List<String> adates = new LinkedList<String>();
		List<Long> acounts = new LinkedList<Long>();
		for (Record record : list) {
			adates.add(ToolDateTime.format(record.getStr("adates"), ToolDateTime.pattern_ymd, "MM-dd"));
			acounts.add(record.getNumber("acounts").longValue());
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

		String sql = ToolSqlXml.getSql("platform.resources.24hour");
		List<Resources> list = Resources.dao.find(sql, hostName, ToolDateTime.getSqlTimestamp(startDate), ToolDateTime.getSqlTimestamp(endDate));
		
		List<String> datesList = new LinkedList<String>();
		List<Integer> cpuList = new LinkedList<Integer>();
		List<Long> phymemoryList = new LinkedList<Long>();
		List<Long> jvmmemoryList = new LinkedList<Long>();
		List<Long> gccountList = new LinkedList<Long>();
		
		Long phymemory = 0l;
		Long jvmmaxmemory = 0l;
		
		for (Resources resources : list) {
			phymemory = resources.getNumber("phymemory").longValue();
			jvmmaxmemory = resources.getNumber("jvmmaxmemory").longValue();
			
			datesList.add(ToolDateTime.format(resources.getDate("createdate"), "HH:mm"));
			
			int cpuratio = (int)(resources.getBigDecimal("cpuratio").doubleValue() * 100);
			cpuList.add(Integer.valueOf(cpuratio));
			
			phymemoryList.add(resources.getNumber("phymemory").longValue() - resources.getNumber("phyfreememory").longValue());
			
			jvmmemoryList.add(resources.getNumber("jvmtotalmemory").longValue() - resources.getNumber("jvmfreememory").longValue());
			
			gccountList.add(resources.getNumber("gccount").longValue());
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
