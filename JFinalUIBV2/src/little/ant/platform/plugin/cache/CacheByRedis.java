package little.ant.platform.plugin.cache;

/**
 * 缓存到Redis
 * @author 董华健
 */
public class CacheByRedis implements CacheBase {

	@Override
	public void put(String cacheName, Object key, Object value) {
		
	}

	@Override
	public <T> T get(String cacheName, Object key) {
		return null;
	}

	@Override
	public void remove(String cacheName, Object key) {
		
	}

}
