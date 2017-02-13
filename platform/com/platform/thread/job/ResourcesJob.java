package com.platform.thread.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.jfinal.log.Log;
import com.platform.mvc.resources.Resources;
import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolOS;

public class ResourcesJob implements Job {

	private static final Log log = Log.getLog(ResourcesJob.class);
	
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		try {
			// 调度任务参数
//			JobDataMap dataMap = context.getJobDetail().getJobDataMap();
//			String xxx = (String) dataMap.get("xxx");
			
			if(log.isInfoEnabled()) log.info("定时记录系统资源负载开始");
			resources();
			if(log.isInfoEnabled()) log.info("定时记录系统资源负载结束");
		} catch (Exception e) {
			if(log.isErrorEnabled()) log.error("定时记录系统资源负载异常");
		}
	}
	
	/**
	 * 获取资源信息入库
	 */
	private void resources(){
		String osName = ToolOS.getOsName(); // 获取操作系统类型名称
		String ip = ToolOS.getOsLocalHostIp(); // 获取本机IP
		String hostName = ToolOS.getOsLocalHostName(); // 获取本机名称
		int cpuNumber = ToolOS.getOsCpuNumber(); // 获取CPU数量
		double cpuRatio = ToolOS.getOscpuRatio(); // cpu使用率
		if(cpuRatio < 0){
			cpuRatio = 0;
		}
		
		long phyMemory = ToolOS.getOsPhysicalMemory(); // 物理内存，总的可使用的
		long phyFreeMemory = ToolOS.getOsPhysicalFreeMemory(); // 物理内存，剩余
		
		long jvmTotalMemory = ToolOS.getJvmTotalMemory(); // JVM内存，内存总量
		long jvmFreeMemory = ToolOS.getJvmFreeMemory(); // JVM内存，空闲内存量
		long jvmMaxMemory = ToolOS.getJvmMaxMemory(); // JVM内存，最大内存量
		long gcCount = ToolOS.getJvmGcCount(); // 获取JVM GC次数
		
		Resources resources = new Resources();
		resources.set(Resources.column_osname, osName);
		resources.set(Resources.column_ips, ip);
		resources.set(Resources.column_hostname, hostName);
		resources.set(Resources.column_cpunumber, cpuNumber);
		resources.set(Resources.column_cpuratio, cpuRatio);
		resources.set(Resources.column_phymemory, phyMemory);
		resources.set(Resources.column_phyfreememory, phyFreeMemory);
		resources.set(Resources.column_jvmtotalmemory, jvmTotalMemory);
		resources.set(Resources.column_jvmfreememory, jvmFreeMemory);
		resources.set(Resources.column_jvmmaxmemory, jvmMaxMemory);
		resources.set(Resources.column_gccount, gcCount);
		resources.set(Resources.column_createdate, ToolDateTime.getSqlTimestamp(null));
		resources.save();
	}
	
}
