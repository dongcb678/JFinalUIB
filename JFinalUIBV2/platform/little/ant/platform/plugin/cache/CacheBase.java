package little.ant.platform.plugin.cache;

/**
 * 缓存接口
 * @author 董华健
 */
public interface CacheBase {
	
	/**
	 * 增加缓存
	 * @param cacheName
	 * @param key
	 * @param value
	 */
	public void put(String cacheName, Object key, Object value);

	/**
	 * 获取缓存
	 * @param cacheName
	 * @param key
	 * @return
	 */
	public <T> T get(String cacheName, Object key);
	
	/**
	 * 删除缓存
	 * @param cacheName
	 * @param key
	 */
	public void remove(String cacheName, Object key);
	
}
