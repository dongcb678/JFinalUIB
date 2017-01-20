package com.platform.config;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.token.ITokenCache;
import com.jfinal.token.Token;
import com.jfinal.token.TokenManager;
import com.platform.constant.ConstantCache;

/**
 * 自定义Token缓存到Ehcache实现类，JFinal默认缓存为用户当前session，也可以自定义为其他容器，实现ITokenCache接口即可
 */
public class FormTokenByEhcache implements ITokenCache {

	@Override
	public void put(Token token) {
		CacheKit.put(ConstantCache.cache_name_ehcache_system, token.getId(), token);
	}

	@Override
	public void remove(Token token) {
		CacheKit.remove(ConstantCache.cache_name_ehcache_system, token.getId());
	}

	@Override
	public boolean contains(Token token) {
		if(CacheKit.get(ConstantCache.cache_name_ehcache_system, token.getId()) != null){
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Token> getAll() {
		List<String> keys = CacheKit.getKeys(ConstantCache.cache_name_ehcache_system);
		List<Token> list = new ArrayList<Token>();
		for (String key : keys) {
			if(key.startsWith(TokenManager.tokenPrefix)){
				list.add((Token) CacheKit.get(ConstantCache.cache_name_ehcache_system, key));
			}
		}
		return list;
	}

}
