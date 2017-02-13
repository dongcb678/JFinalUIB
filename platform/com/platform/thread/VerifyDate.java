package com.platform.thread;

import java.util.Date;

import com.jfinal.log.Log;
import com.platform.plugin.QuartzPlugin;
import com.platform.thread.job.DataClearJob;
import com.platform.thread.job.ResourcesJob;

/**
 * 时间校验检测
 * 
 * @author 董华健  dongcb678@163.com
 * 
 * 描述：
 * 		校验更新系统时间的操作，会影响timer定时器的执行
 * 		1.系统时间往前调整，不会影响timer的触发
 * 		2.系统时间往后调整，timer会挂起
 * 		
 * 		此线程用来检测时间是否往后调整，如果是，则重置timer的调度
 */
public class VerifyDate extends Thread {

	private static final Log log = Log.getLog(VerifyDate.class);
	
	private static final long interval = 1000 * 60 * 10; // 10 分钟
	
	private static Date date = new Date();

	private static final VerifyDate verifyDate = new VerifyDate();
	
	@Override
	public void run() {
		synchronized (date) {
			
			while (true) {
				try {
					Date newDate = new Date();
					long milliSeconds = newDate.getTime() - date.getTime();
					if(milliSeconds < - interval){
						QuartzPlugin quartzPlugin = new QuartzPlugin();
						
						// 停止调度任务
						QuartzPlugin.deleteJob("ResourcesJob");
						QuartzPlugin.deleteJob("DataClearJob");
						quartzPlugin.stop();
						
						// 启动调度任务
						quartzPlugin.start();
						QuartzPlugin.addJob("ResourcesJob", "0 0/2 * * * ?", ResourcesJob.class);
						QuartzPlugin.addJob("DataClearJob", "0 0 2 * * ?", DataClearJob.class);
						
						// 重置时间变量
						date = newDate;
					}
					
					sleep(interval);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			
		}
	}

	public static synchronized void startVerify(){
		if(log.isInfoEnabled()) log.info("启动任务开始");
		verifyDate.start();
		if(log.isInfoEnabled()) log.info("启动任务成功");
	}
	
	@SuppressWarnings("deprecation")
	public static synchronized void stopVerify(){
		if(log.isInfoEnabled()) log.info("任务退出开始");
		verifyDate.stop();
		if(log.isInfoEnabled()) log.info("任务退出成功");
	}
	
}
