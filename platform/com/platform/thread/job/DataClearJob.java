package com.platform.thread.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.jfinal.log.Log;
import com.platform.mvc.resources.ResourcesService;
import com.platform.mvc.syslog.SysLogService;
import com.platform.plugin.ServicePlugin;

public class DataClearJob implements Job {

	private static final Log log = Log.getLog(DataClearJob.class);
	
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		try {
			// 调度任务参数
//			JobDataMap dataMap = context.getJobDetail().getJobDataMap();
//			String xxx = (String) dataMap.get("xxx");
			
			try {
				if(log.isInfoEnabled()) log.info("清理访问日志数据");
				SysLogService slService = (SysLogService) ServicePlugin.getService(SysLogService.serviceName);
				slService.timerDataClear();
			} catch (Exception e) {
				if(log.isErrorEnabled()) log.error("清理访问日志数据失败：" + e.getMessage());
				e.printStackTrace();
			}

			try {
				if(log.isInfoEnabled()) log.info("清理资源负载日志数据");
				ResourcesService rService = (ResourcesService) ServicePlugin.getService(ResourcesService.serviceName);
				rService.timerDataClear();
			} catch (Exception e) {
				if(log.isErrorEnabled()) log.error("清理资源负载日志数据失败：" + e.getMessage());
				e.printStackTrace();
			}
		} catch (Exception e) {
			if(log.isInfoEnabled()) log.info("清理数据异常");
		}
	}
	
}
