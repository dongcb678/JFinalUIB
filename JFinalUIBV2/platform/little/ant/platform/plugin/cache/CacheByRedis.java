package little.ant.platform.plugin.cache;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.tools.ToolSerialize;

/**
 * 缓存到Redis
 * @author 董华健
 */
public class CacheByRedis implements CacheBase {

	@Override
	public void put(Object key, Object value) {
		byte[] keyByte = ((String)key).getBytes();
		byte[] valueByte = ToolSerialize.serialize(value);
		RedisAPI.setByte(keyByte, valueByte);
	}

	@Override
	public <T> T get(Object key) {
		byte[] keyByte = ((String)key).getBytes();
		RedisAPI.getByte(keyByte);
		return null;
	}

	@Override
	public void remove(Object key) {
		byte[] keyByte = ((String)key).getBytes();
		RedisAPI.delByte(keyByte);
	}

}

class RedisAPI {
	
    private static JedisPool pool = null;
    
    /**
     * 构建redis连接池
     * @return
     */
    public static JedisPool getPool() {
        //控制一个pool可分配多少个jedis实例，通过pool.getResource()来获取；
        if (pool == null) {
            JedisPoolConfig config = new JedisPoolConfig();
            //如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
            config.setMaxTotal(500);
            
            //控制一个pool最多有多少个状态为idle(空闲的)的jedis实例。
            config.setMaxIdle(5);
            
            //表示当borrow(引入)一个jedis实例时，最大的等待时间，如果超过等待时间，则直接抛出JedisConnectionException；
            config.setMaxWaitMillis(1000 * 100);
            
            //在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
            config.setTestOnBorrow(true);
            
            String ip = (String) PropertiesPlugin.getParamMapValue(ConstantInit.config_redis_ip);
            Integer port = (Integer) PropertiesPlugin.getParamMapValue(ConstantInit.config_redis_port);
            pool = new JedisPool(config, ip, port);
        }
        return pool;
    }
    
    /**
     * 返还到连接池
     * @param pool
     * @param redis
     */
    public static void returnResource(JedisPool pool, Jedis redis) {
        if (redis != null) {
            pool.returnResourceObject(redis);
        }
    }

    /**
     * 设置数据
     * @param key
     * @param value
     * @return
     */
    public static String setByte(byte[] key, byte[] value){
        Jedis jedis = null;
        String ret = null;
        try {
            pool = getPool();
            jedis = pool.getResource();
            ret = jedis.set(key, value);
        } catch (Exception e) {
            //释放redis对象
            pool.returnResourceObject(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            returnResource(pool, jedis);
        }
        return ret;
    }

    /**
     * 获取数据
     * @param key
     * @return
     */
    public static Object getByte(byte[] key){
        Jedis jedis = null;
        try {
            pool = getPool();
            jedis = pool.getResource();
            byte[] value = jedis.get(key);
            return ToolSerialize.unserialize(value);
        } catch (Exception e) {
            //释放redis对象
            pool.returnResourceObject(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            returnResource(pool, jedis);
        }
        
        return null;
    }

    /**
     * 删除数据
     * @param key
     */
    public static void delByte(byte[] key){
        Jedis jedis = null;
        try {
            pool = getPool();
            jedis = pool.getResource();
            jedis.del(key);
        } catch (Exception e) {
            //释放redis对象
            pool.returnResourceObject(jedis);
            e.printStackTrace();
        } finally {
            //返还到连接池
            returnResource(pool, jedis);
        }
    }

}