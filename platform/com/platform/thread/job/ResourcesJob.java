package com.platform.thread.job;

import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.platform.tools.ToolDateTime;

public class ResourcesJob implements Job {

	@Override
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		
		System.out.println("quartz测试" + ToolDateTime.format(new Date(), ToolDateTime.pattern_ymd_hms_s));

	}

}
