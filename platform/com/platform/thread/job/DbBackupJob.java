package com.platform.thread.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.jfinal.log.Log;
import com.platform.tools.ToolDataBase;

/**
 * 数据库定时备份
 * @author Administrator
 */
public class DbBackupJob implements Job {

	private static final Log log = Log.getLog(DbBackupJob.class);
	
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		// 调度任务参数
//		JobDataMap dataMap = context.getJobDetail().getJobDataMap();
//		String xxx = (String) dataMap.get("xxx");
			
		try {
			if(log.isInfoEnabled()) log.info("数据库定时备份");
			ToolDataBase.dbBackup("main");
		} catch (Exception e) {
			if(log.isErrorEnabled()) log.error("数据库定时备份失败：" + e.getMessage());
			e.printStackTrace();
		}
		
	}
	
}
