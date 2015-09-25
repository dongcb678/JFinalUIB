package com.platform.constant;

/**
 * 缓存
 */
public interface ConstantCache {

	/**
	 * 缓存类型ehcache
	 */
	public static final String cache_type_ehcache = "ehcache";
	
	/**
	 * 缓存类型redis
	 */
	public static final String cache_type_redis = "redis";
	
	/**
	 * URL缓存Key
	 */
	public static final String cache_name_ehcache_page = "SimplePageCachingFilter";
	
	/**
	 * 系统缓存，主要是权限和数据字典等
	 */
	public static final String cache_name_ehcache_system = "system";

	/**
	 * 系统缓存，主要是权限和数据字典等
	 */
	public static final String cache_name_redis_system = "system";

}
