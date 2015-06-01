package little.ant.platform.plugin.cache;

import little.ant.platform.constant.ConstantCache;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 缓存到jfinal自带的ehcache
 * @author 董华健
 */
public class CacheByJfinal implements CacheBase {

	@Override
	public void put(Object key, Object value) {
		CacheKit.put(ConstantCache.cache_name_system, key, value);
	}

	@Override
	public <T> T get(Object key) {
		return CacheKit.get(ConstantCache.cache_name_system, key);
	}

	@Override
	public void remove(Object key) {
		CacheKit.remove(ConstantCache.cache_name_system, key);
	}

}
