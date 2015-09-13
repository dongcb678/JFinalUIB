package com.junit;

import org.apache.log4j.Logger;
import org.junit.BeforeClass;

import com.platform.run.ConfigCore;

public class TestBase {

	private static Logger log = Logger.getLogger(TestBase.class);
	
    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
    	log.info("启动ConfigCore start ......");
    	new ConfigCore();
    	log.info("启动ConfigCore end ......");
    }

}
