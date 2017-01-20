package com.platform.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.jfinal.plugin.redis.Cache;
import com.jfinal.plugin.redis.Redis;
import com.jfinal.token.ITokenCache;
import com.jfinal.token.Token;
import com.jfinal.token.TokenManager;
import com.platform.constant.ConstantCache;

/**
 * 自定义Token缓存到Redis实现类，JFinal默认缓存为用户当前session，也可以自定义为其他容器，实现ITokenCache接口即可
 */
public class FormTokenByRedis implements ITokenCache {

	@Override
	public void put(Token token) {
		Cache cache = Redis.use(ConstantCache.cache_name_redis_system);
		cache.set(token.getId(), token);
	}

	@Override
	public void remove(Token token) {
		Cache cache = Redis.use(ConstantCache.cache_name_redis_system);
		cache.del(token.getId());
	}

	@Override
	public boolean contains(Token token) {
		Cache cache = Redis.use(ConstantCache.cache_name_redis_system);
		return cache.exists(token.getId());
	}

	@Override
	public List<Token> getAll() {
		Cache cache = Redis.use(ConstantCache.cache_name_redis_system);
		Set<String> keys = cache.keys(TokenManager.tokenPrefix + "*");
		List<Token> list = new ArrayList<Token>();
		for (String key : keys) {
			list.add((Token) cache.get(key));
		}
		return list;
	}

}
