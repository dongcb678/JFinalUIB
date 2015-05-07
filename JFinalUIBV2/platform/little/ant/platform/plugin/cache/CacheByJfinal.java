package little.ant.platform.plugin.cache;

import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 缓存到jfinal自带的ehcache
 * @author 董华健
 */
public class CacheByJfinal implements CacheBase {

	@Override
	public void put(String cacheName, Object key, Object value) {
		CacheKit.put(cacheName, key, value);
	}

	@Override
	public <T> T get(String cacheName, Object key) {
		return CacheKit.get(cacheName, key);
	}

	@Override
	public void remove(String cacheName, Object key) {
		CacheKit.remove(cacheName, key);
	}

}
