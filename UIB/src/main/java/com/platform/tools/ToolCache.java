package com.platform.tools;

import com.jfinal.kit.PropKit;
import com.jfinal.log.Log;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.platform.constant.ConstantCache;
import com.platform.constant.ConstantInit;

/**
 * 缓存工具类
 * @author 董华健  dongcb678@163.com
 */
public abstract class ToolCache {

	@SuppressWarnings("unused")
	private static final Log log = Log.getLog(ToolCache.class);

	/**
	 * 缓存类型
	 */
	private static String cacheType;
	
	/**
	 * 获取缓存类型
	 * @return
	 */
	public static String getCacheType(){
		if(cacheType == null){
			cacheType = PropKit.get(ConstantInit.config_cache_type);
		}
		return cacheType;
	}
	
	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public static <T> T get(Object key) {
		if(getCacheType().equals(ConstantCache.cache_type_ehcache)){
			return CacheKit.get(ConstantCache.cache_name_ehcache_system, key);
		
		}else if(getCacheType().equals(ConstantCache.cache_type_redis)){
			Cache cache = Redis.use(ConstantCache.cache_name_redis_system);
			return cache.get(key);
		}
		return null;
	}
	
	/**
	 * 设置缓存
	 * @param key
	 * @param value
	 */
	public static void set(Object key, Object value) {
		if(getCacheType().equals(ConstantCache.cache_type_ehcache)){
			CacheKit.put(ConstantCache.cache_name_ehcache_system, key, value);
			
		} else if(getCacheType().equals(ConstantCache.cache_type_redis)){
			Cache cache = Redis.use(ConstantCache.cache_name_redis_system);
			cache.set(key, value);
		}
	}
	
	/**
	 * 删除缓存
	 * @param key
	 */
	public static void remove(Object key){
		if(getCacheType().equals(ConstantCache.cache_type_ehcache)){
			CacheKit.remove(ConstantCache.cache_name_ehcache_system, key);
			
		} else if(getCacheType().equals(ConstantCache.cache_type_redis)){
			Cache cache = Redis.use(ConstantCache.cache_name_redis_system);
			cache.del(key);
		}
	}
	
}
