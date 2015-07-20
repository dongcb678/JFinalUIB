package little.ant.platform.service;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.tx.Tx;

import little.ant.platform.model.Syslog;
import little.ant.platform.tools.ToolDateTime;

public class SysLogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogService.class);
	
	public static final SysLogService service = Enhancer.enhance(SysLogService.class, Tx.class);
	
	public Syslog view(String ids){
		String sql = getSql(Syslog.sqlId_view);
		return Syslog.dao.findFirst(sql, ids);
	}

	/**
	 * 删除
	 * @param ids
	 */
	public void delete(String ids){
		String[] idsArr = splitByComma(ids);
		for (String logIds : idsArr) {
			Syslog.dao.deleteById(logIds);
		}
	}

	/**
	 * 定时清理数据
	 */
	public void timerDataClear(){
		Date date = ToolDateTime.getDate(-365, 0, 0, 0, 0); // 设置时间为365天前
		Timestamp timestamp = ToolDateTime.getSqlTimestamp(date);
		Db.update(" delete from pt_syslog where startdate < ? ", timestamp);
	}
	
}
