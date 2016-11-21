package com.junit;

import org.junit.BeforeClass;

import com.jfinal.log.Log;
import com.platform.config.ConfigCore;

public class TestBase {

	private static final Log log = Log.getLog(TestBase.class);
	
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
    	log.info("启动ConfigCore start ......");
    	ConfigCore.getSingleton();
    	log.info("启动ConfigCore end ......");
    }

}
