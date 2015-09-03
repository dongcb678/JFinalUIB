package little.ant.platform.service;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;

import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.Syslog;
import little.ant.platform.tools.ToolDateTime;

public class SysLogService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(SysLogService.class);
	
	public static final SysLogService service = Enhancer.enhance(SysLogService.class);
	
	/**
	 * 定时清理数据
	 */
	public void timerDataClear(){
		Date date = ToolDateTime.getDate(-365, 0, 0, 0, 0); // 设置时间为365天前
		Timestamp timestamp = ToolDateTime.getSqlTimestamp(date);
		Db.use(ConstantInit.db_dataSource_main).update(getSql(Syslog.sqlId_clear), timestamp);
	}
	
}
