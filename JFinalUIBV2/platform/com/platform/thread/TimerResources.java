package com.platform.thread;

import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;

import com.platform.mvc.resources.Resources;
import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolOS;

/**
 * 定时记录系统资源负载情况
 * @author 董华健
 */
public class TimerResources extends Timer {

	private static Logger log = Logger.getLogger(TimerResources.class);
	
	/**
	 * 定时任务对象
	 */
	private static TimerResources timer = null;
	
	/**
	 * 启动任务
	 */
	public static void start() {
		if(null != timer){
			log.info("启动失败，任务已经启动");
			return;
		}
		
		log.info("开始启动任务");
		
		timer = new TimerResources();
		
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				
				try {
					log.info("定时记录系统资源负载开始");
					timer.resources();
					log.info("定时记录系统资源负载结束");
				} catch (Exception e) {
					log.error("定时记录系统资源负载失败：" + e.getMessage());
					e.printStackTrace();
				}
				
			}
		}, 1000, 1000 * 60 * 2);// 启动项目一秒后执行，然后每次间隔2分钟
		
		log.info("启动任务完成");
	}
	
	/**
	 * 停止任务
	 */
	public static void stop(){
		if(null != timer){
			log.info("任务退出开始");
			timer.cancel();
			log.info("任务退出成功");
		}else{
			log.info("任务退出失败，任务为空");
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
