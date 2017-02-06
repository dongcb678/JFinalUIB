package com.platform.tools;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.platform.config.ConfigCore;
import com.platform.constant.ConstantInit;
import com.platform.dto.Redis;

/**
 * Redis工具类
 * @author 董华健  dongcb678@163.com
 */
public abstract class ToolRedis {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolRedis.class);

	private static final Map<String, Redis> redisMap = new HashMap<String, Redis>();
	
	/**
	 * 获取所有redis配置对象
	 * @return
	 */
	public static Map<String, Redis> getRedisMap(){
		if(redisMap.isEmpty()){
			synchronized (ConfigCore.class) {
				if(redisMap.isEmpty()){
					parseRedisInfo();
				}
			}
		}
		return redisMap;
	}

	/**
	 * 获取指定redis对象
	 * @param name
	 * @return
	 */
	public static Redis getRedis(String name){
		if(redisMap.isEmpty()){
			parseRedisInfo();
		}
		return redisMap.get(name);
	}
	
	/**
	 * 分解Redis连接信息
	 * @return
	 */
	private static void parseRedisInfo(){
		String redis_start = "redis[";
		String redis_end = "]";
		String prefix = null;

		int count = PropKit.getInt(ConstantInit.config_redis_count);

		Redis redis = null;
		
		for (int i = 1; i <= count; i++) {
			prefix = redis_start + i + redis_end + ".";

			String name = PropKit.get(prefix + "name");
			String ip = PropKit.get(prefix + "ip");
			int port = PropKit.getInt(prefix + "port");
			String password = PropKit.get(prefix + "password");
			int timeout = PropKit.getInt(prefix + "timeout");
			
			redis = new Redis();
			
			redis.setName(name);
			redis.setIp(ip);
			redis.setPort(port);
			redis.setPassword(password);
			redis.setTimeout(timeout);
			
			redisMap.put(name, redis);
		}
	}
	
}
