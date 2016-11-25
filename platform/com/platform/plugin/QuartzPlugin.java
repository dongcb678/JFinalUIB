package com.platform.plugin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.quartz.CronScheduleBuilder;
import org.quartz.Job;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;
import org.quartz.impl.StdSchedulerFactory;

import com.jfinal.log.Log;
import com.jfinal.plugin.IPlugin;

public class QuartzPlugin implements IPlugin {

	private static final Log log = Log.getLog(QuartzPlugin.class);

	private static Scheduler scheduler = null;
	
	private static List<String> triggerKeyList = new ArrayList<String>();
	
	private static long delayTimes = 5000; // 延迟xx毫秒执行，0表示不延迟
	
	/**
	 * 添加调度任务
	 * @param triggerKey 全局唯一调度任务id
	 * @param cron 调度任务表达式
	 * @param classs 调度处理类
	 * @param param 调度任务参数
	 */
	public static void addJob(String triggerKey, String cron, Class<? extends Job> classs, Map<String, String> param){
		for (String key : triggerKeyList) {
			if(triggerKey.equals(key)){
				throw new RuntimeException("不能条件重复调度任务triggerKey = " + triggerKey);
			}
		}
		triggerKeyList.add(triggerKey);
		
		JobDetail jobDetail = JobBuilder.newJob(classs).withIdentity(triggerKey, Scheduler.DEFAULT_GROUP).build();
		
		if(param != null && !param.isEmpty()){
			jobDetail.getJobDataMap().putAll(param);
		}
		
		/**
		 * withSchedule
		 * 1.SimpleScheduleBuilder.repeatHourlyForever(24) // 轮询时间，24小时
		 * 2.SimpleScheduleBuilder.repeatSecondlyForever(60) // 轮询时间，60秒
		 * 3.CronScheduleBuilder.cronSchedule(cron) // 轮询时间，表达式
		 */
		
		Trigger trigger = TriggerBuilder.newTrigger().withIdentity(triggerKey, Scheduler.DEFAULT_GROUP)
				.withSchedule(CronScheduleBuilder.cronSchedule(cron)) 
				.startAt(new Date(System.currentTimeMillis() + delayTimes))
				.build();
		
		try {
			scheduler.scheduleJob(jobDetail, trigger);
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}
	

	/**
	 * 添加调度任务
	 * @param triggerKey
	 * @param cron
	 * @param classs
	 */
	public static void addJob(String triggerKey, String cron, Class<? extends Job> classs){
		addJob(triggerKey, cron, classs, null);
	}
	
	/**
	 * 删除调度任务
	 * @param triggerKey
	 */
	public static void deleteJob(String triggerKey){
		try {
			scheduler.pauseTrigger(TriggerKey.triggerKey(triggerKey, Scheduler.DEFAULT_GROUP));
			scheduler.deleteJob(JobKey.jobKey(triggerKey, Scheduler.DEFAULT_GROUP));
			scheduler.unscheduleJob(TriggerKey.triggerKey(triggerKey, Scheduler.DEFAULT_GROUP));
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public boolean start() {
		if(scheduler == null){
			StdSchedulerFactory factory = new StdSchedulerFactory();
			
			Properties props = new Properties();
			props.put(StdSchedulerFactory.PROP_THREAD_POOL_CLASS, "org.quartz.simpl.SimpleThreadPool");
			props.put("org.quartz.threadPool.threadCount", "10");

			try {
				factory.initialize(props);
				scheduler = factory.getScheduler();
				scheduler.start();
			} catch (SchedulerException e) {
				log.error("初始化任务调度出错", e);
			}
		}
		return true;
	}

	@Override
	public boolean stop() {
		try {
			for (String triggerKey : triggerKeyList) {
				deleteJob(triggerKey);
			}
			
			if (scheduler != null && !scheduler.isShutdown()) {
				scheduler.shutdown();
			}
		} catch (SchedulerException e) {
			log.error("关闭任务调度出错", e);
		}
		return true;
	}

}
