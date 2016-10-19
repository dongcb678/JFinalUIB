package com.platform.mvc.syslog;

import java.sql.Timestamp;
import java.util.Date;

import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.platform.annotation.Service;
import com.platform.constant.ConstantInit;
import com.platform.mvc.base.BaseService;
import com.platform.tools.ToolDateTime;

@Service(name = SysLogService.serviceName)
public class SysLogService extends BaseService {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(SysLogService.class);

	public static final String serviceName = "sysLogService";

	/**
	 * 定时清理数据
	 */
	public void timerDataClear(){
		Date date = ToolDateTime.getDate(-365, 0, 0, 0, 0); // 设置时间为365天前
		Timestamp timestamp = ToolDateTime.getSqlTimestamp(date);
		Db.use(ConstantInit.db_dataSource_main).update(getSql(Syslog.sqlId_clear), timestamp);
	}
	
}
