package com.platform.thread;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;

import com.jfinal.log.Log;
import com.platform.mvc.syslog.Syslog;

/**
 * 操作日志入库处理
 */
public class ThreadSysLog {

	private static final Log log = Log.getLog(ThreadSysLog.class);
	
//	private static final int queueSize = 5000; // 入库队列大小
	private static boolean threadRun = true; // 线程是否运行
	
	/**
	 * 队列
	 */
	//private static final BlockingQueue<Syslog> queue = new LinkedBlockingQueue<Syslog>(queueSize); 
	private static Queue<Syslog> queue = new ConcurrentLinkedQueue<Syslog>(); //	此队列按照 FIFO（先进先出）原则对元素进行排序
	
	/**
	 * 向队列中增加Syslog对象，基于LinkedBlockingQueue
	 * @param sysLog
	public static void add(Syslog sysLog){
		try {
			if(log.isInfoEnabled()) log.info("put操作日志到缓存queue start......");
			queue.put(sysLog);
			if(log.isInfoEnabled()) log.info("put操作日志到缓存queue end......");
		} catch (InterruptedException e) {
			if(log.isErrorEnabled()) log.error("put操作日志到缓存queue异常");
			throw new RuntimeException("ThreadSysLog -> add Exception");
		}
	}*/
	
	public static void setThreadRun(boolean threadRun) {
		ThreadSysLog.threadRun = threadRun;
	}

	/**
	 * 向队列中增加Syslog对象，基于ConcurrentLinkedQueue
	 * @param syslog
	 */
	public static void add(Syslog syslog){
//		if(null != syslog){	// 此队列不允许使用 null 元素
//			synchronized(queue) {
//				if(queue.size() == queueSize){
//					queue.poll(); // 获取并移除此队列的头，如果此队列为空，则返回 null
//					if(log.isErrorEnabled()) log.error("日志队列：超过" + queueSize);
//				}
				queue.offer(syslog); // 将指定元素插入此队列的尾部
//			}
//		}
	}
	
	/**
	 * 获取Syslog对象，基于ConcurrentLinkedQueue
	 * @return
	 */
	public static Syslog getSyslog(){
//		synchronized(queue) {
//			if(!queue.isEmpty()){
				return queue.poll(); // 获取并移除此队列的头，如果此队列为空，则返回 null
//			}
//			return null;
//		}
	}
	
	/**
	 * 启动入库线程
	 */
	public static void startSaveDBThread() {
		try {
			for (int i = 0; i < 10; i++) {
				Thread insertDbThread = new Thread(new Runnable() {
					public void run() {
						Syslog sysLog = null;
						while (threadRun) {
							try {
								// 取队列数据
								//Syslog sysLog = queue.take(); // 基于LinkedBlockingQueue
								sysLog = getSyslog();
								if(null == sysLog){
									Thread.sleep(200);
								} else {
									if(log.isInfoEnabled()) log.info("保存操作日志到数据库start......");
									sysLog.save();// 日志入库
									sysLog = null;
									if(log.isInfoEnabled()) log.info("保存操作日志到数据库end......");
								}
							} catch (Exception e) {
								if(null != sysLog){
									sysLog = null;
								}
								if(log.isErrorEnabled()) log.error("保存操作日志到数据库异常：" + e.getMessage());
								e.printStackTrace();
							}
						}
					}
				});

				insertDbThread.setName("little-ant-Thread-SysLog-insertDB-" + (i + 1));
				insertDbThread.start();
			}
		} catch (Exception e) {
			throw new RuntimeException("ThreadSysLog new Thread Exception");
		}
	}
	
}
