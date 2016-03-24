package com.platform.thread;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;

import com.platform.mvc.resources.ResourcesService;
import com.platform.mvc.syslog.SysLogService;
import com.platform.tools.ToolDateTime;

/**
 * 数据清理定时器
 * @author 董华健
 */
public class DataClear extends Timer {

	private static Logger log = Logger.getLogger(DataClear.class);
	
	/**
	 * 定时任务对象
	 */
	private static final DataClear timer = new DataClear();
	
	/**
	 * 启动任务
	 */
	public static void start() {
		log.info("开始启动任务");

		// 获取固定时间，明天2点
		Date date = ToolDateTime.getDate(+1, 2, 0, 0, 0);
					
		// 固定时间执行任务，每天都是凌晨2点
		timer.scheduleAtFixedRate(new TimerTask() {
			@Override
			public void run() {
				log.info("任务执行开始");
				
				try {
					log.info("清理访问日志数据");
					SysLogService.service.timerDataClear();
				} catch (Exception e) {
					log.error("清理访问日志数据失败：" + e.getMessage());
					e.printStackTrace();
				}

				try {
					log.info("清理资源负载日志数据");
					ResourcesService.service.timerDataClear();
				} catch (Exception e) {
					log.error("清理资源负载日志数据失败：" + e.getMessage());
					e.printStackTrace();
				}
				
				log.info("任务执行结束");
			}
		}, date, 1000 * 60 * 60 * 24);// 启动项目后（明天2点）执行，以后每天都是凌晨2点
		
		log.info("启动任务完成");
	}
	
	/**
	 * 停止任务
	 */
	public static void stop(){
		log.info("任务退出开始");
		timer.cancel();
		log.info("任务退出成功");
	}
	
}
