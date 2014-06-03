package little.ant.pingtai.thread;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

import little.ant.pingtai.model.Syslog;
import little.ant.pingtai.tools.ToolUtils;

import org.apache.log4j.Logger;

/**
 * 操作日志处理
 */
public class ThreadSysLog {

	private static Logger log = Logger.getLogger(ThreadSysLog.class);

	/**
	 * 队列
	 */
	private static final BlockingQueue<Syslog> queue = new LinkedBlockingQueue<Syslog>(5000);
	
	/**
	 * 添加操作日志到缓存queue
	 * @param sysLog
	 */
	public static void add(Syslog sysLog){
		try {
			log.info("put操作日志到缓存queue start......");
			queue.put(sysLog);
			log.info("put操作日志到缓存queue end......");
		} catch (InterruptedException e) {
			log.error("put操作日志到缓存queue异常");
			throw new RuntimeException("ThreadSysLog -> add Exception");
		}
	}
	
	/**
	 * 启动入库线程
	 */
	public static void startSaveDBThread() {
		try {
			for (int i = 0; i < 10; i++) {
				Thread insertDbThread = new Thread(new Runnable() {
					public void run() {
						while (true) {
							log.info("保存操作日志到数据库start......");
							try {
								// 取队列数据
								Syslog sysLog = queue.take();
								
								// 日志入库
								sysLog.set("ids", ToolUtils.getUuidByJdk(true)).save();
							} catch (Exception e) {
								log.error("保存操作日志到数据库异常");
								e.printStackTrace();
								throw new RuntimeException("ThreadSysLog -> save Exception");
							}
							log.info("保存操作日志到数据库end......");
						}
					}
				});

				insertDbThread.setName("little-ant-Thread-SysLog-insertDB-" + 1);
				insertDbThread.start();
			}
		} catch (Exception e) {
			throw new RuntimeException("ThreadSysLog new Thread Exception");
		}
	}
	
}
