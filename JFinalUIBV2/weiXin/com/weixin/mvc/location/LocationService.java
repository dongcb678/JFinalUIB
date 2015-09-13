package com.weixin.mvc.location;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.platform.mvc.base.BaseService;

public class LocationService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LocationService.class);

	public static final LocationService service = Enhancer.enhance(LocationService.class);
	
}
