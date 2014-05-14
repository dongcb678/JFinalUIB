package little.ant.pingtai.utils;

import java.lang.management.GarbageCollectorMXBean;
import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import org.apache.log4j.Logger;

import com.sun.management.OperatingSystemMXBean;

/**
 * 系统环境相关
 * 
 * @author 董华健 2012-9-7 下午2:09:41
 */
public class ToolOS {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(ToolOS.class);
	
	//系统bean
	public static final OperatingSystemMXBean osmxb;
	public static final List<GarbageCollectorMXBean> list;
	
	//K转换M
	private static final long K2M = 1024l * 1024l;

	static {
		osmxb = (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
		list = ManagementFactory.getGarbageCollectorMXBeans();
	}

	/**
	 * 获取本机IP
	 * 
	 * @return
	 */
	public static String getOsLocalHostIp() {
		InetAddress addr;
		String ip = null;
		try {
			addr = InetAddress.getLocalHost();
			ip = addr.getHostAddress().toString();// 获得本机IP
		} catch (UnknownHostException e) {
			ip = "未知";
		}
		return ip;
	}

	/**
	 * 获取本机名称
	 * 
	 * @return
	 */
	public static String getOsLocalHostName() {
		InetAddress addr;
		String name = null;
		try {
			addr = InetAddress.getLocalHost();
			name = addr.getHostName().toString();// 获得本机名称
		} catch (UnknownHostException e) {
			name = "未知";
		}
		return name;
	}

	/**
	 * 获取操作系统路径类型
	 * 
	 * @author 董华健 2012-9-7 下午2:17:34
	 * @return
	 */
	public static String getOsPathType() {
		String osPathType = System.getProperty("file.separator");
		if (osPathType.equals("\\")) {
			return "\\\\";
		}
		if (osPathType.equals("/")) {
			return "/";
		}
		return null;
	}

	/**
	 * 获取操作系统类型名称
	 * 
	 * @author 董华健 2012-9-7 下午2:17:42
	 * @return
	 */
	public static String getOsName() {
		return osmxb.getName();//System.getProperty("os.name");
	}

	/**
	 * 获取系统临时目录
	 * 
	 * @author 董华健 2012-9-7 下午2:17:51
	 * @return
	 */
	public static String getOsTempDir() {
		return System.getProperty("java.io.tmpdir");
	}
	
	/**
	 * 当前用户文件夹路径
	 * @return
	 */
	public static String getOsUserHome(){
		return System.getProperty("user.home");
	}

	/**
	 * 操作系统的体系结构 如:x86
	 * 
	 * @author 董华健 2012-9-7 下午2:17:59
	 * @return
	 */
	public static String getOsArch() {
		return osmxb.getArch();//System.getProperty("os.arch");
	}

	/**
	 * 获取java系统环境变量
	 * 
	 * @author 董华健 2012-9-7 下午2:18:07
	 * @param key
	 * @return
	 */
	public static String getOsSystemProperty(String key) {
		return System.getProperty(key);
	}

	/**
	 * 获取CPU数量
	 * 
	 * @author 董华健 2012-9-7 下午2:18:18
	 * @return
	 */
	public static int getOsCpuNumber() {
		return osmxb.getAvailableProcessors();//Runtime.getRuntime().availableProcessors();// 获取当前电脑CPU数量
	}

	/**
	 * 总的物理内存
	 * 
	 * @return
	 */
	public static long getOsTotalMemory() {
		long totalMemorySize = osmxb.getTotalPhysicalMemorySize() / K2M; // M
		return totalMemorySize;
	}

	/**
	 * 剩余的物理内存
	 * 
	 * @return
	 */
	public static long getOsFreePhysicalMemory() {
		long freePhysicalMemorySize = osmxb.getFreePhysicalMemorySize() / K2M; // M
		return freePhysicalMemorySize;
	}

	/**
	 * 获取java虚拟机中的内存总量 单位：M
	 * 
	 * @author 董华健 2012-10-9 上午11:24:02
	 * @return
	 */
	public static long getJvmTotalMemory() {
		return Runtime.getRuntime().totalMemory() / K2M;
	}

	/**
	 * 获取java虚拟机中的空闲内存量 单位：M
	 * 
	 * @author 董华健 2012-10-9 上午11:24:35
	 * @return
	 */
	public static long getJvmFreeMemory() {
		return Runtime.getRuntime().freeMemory() / K2M;
	}

	/**
	 * 获取java虚拟机试图使用的最大内存量 单位：M
	 * 
	 * @author 董华健 2012-10-9 上午11:24:50
	 * @return
	 */
	public static long getJvmMaxMemory() {
		return Runtime.getRuntime().maxMemory() / K2M;
	}
	
	/**
	 * 获取JVM GC次数
	 * @return
	 */
	public static long getJvmGcCount(){
		long count = 0;
		for (final GarbageCollectorMXBean garbageCollectorMXBean : list) {
			count += garbageCollectorMXBean.getCollectionCount();
		}
		return count;
	}

	/**
	 * 系统线程列表
	 * 
	 * @author 董华健 2012-10-9 上午11:26:39
	 * @return
	 */
	public static List<Thread> getJvmThreads() {
		int activeCount = Thread.activeCount();
		Thread[] threads = new Thread[activeCount];
		Thread.enumerate(threads);
		return java.util.Arrays.asList(threads);
	}
	
	public static void main(String[] args){
		System.out.println(getOsPathType());
	}

}
