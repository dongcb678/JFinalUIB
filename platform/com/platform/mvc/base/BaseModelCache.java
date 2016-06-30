package com.platform.mvc.base;

/**
 * Model基础类
 * 
 * @author 董华健
 * @param <M>
 * 
 * 抽取公共方法，声明缓存方法
 */
public abstract class BaseModelCache<M extends BaseModel<M>> extends BaseModel<M> {

	private static final long serialVersionUID = -6953127410111472386L;

	/**
	 * 添加或者更新缓存
	 */
	public abstract void cacheAdd(String ids);

	/**
	 * 删除缓存
	 */
	public abstract void cacheRemove(String ids);

	/**
	 * 获取缓存
	 * @param ids
	 * @return
	 */
	public abstract BaseModel<?> cacheGet(String ids);
	
}
