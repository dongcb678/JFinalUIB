package little.ant.platform.plugin.cache;

/**
 * 缓存接口
 * @author 董华健
 */
public interface CacheBase {
	
	/**
	 * 增加缓存
	 * @param key
	 * @param value
	 */
	public void put(Object key, Object value);

	/**
	 * 获取缓存
	 * @param key
	 * @return
	 */
	public <T> T get(Object key);
	
	/**
	 * 删除缓存
	 * @param key
	 */
	public void remove(Object key);
	
}
