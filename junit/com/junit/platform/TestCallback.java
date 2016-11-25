package com.junit.platform;

import org.junit.Test;

import com.jfinal.plugin.activerecord.Db;
import com.junit.TestBase;
import com.platform.callback.DateClearCallback;

public class TestCallback extends TestBase {
	
	@Test
    public void dateClearCallback(){
        System.out.println("-------------start------------");
        
		DateClearCallback callback = new DateClearCallback();
		
		callback.setCtype("pt_resources");
		Boolean boolRes = (Boolean) Db.execute(callback); 
		System.out.println("删除资源采集，调用执行结果：" + boolRes);

		callback.setCtype("pt_resources");
		Boolean boolLog = (Boolean) Db.execute(callback); 
		System.out.println("删除系统日志，调用执行结果：" + boolLog);
		
        System.out.println("-------------end------------");
    }

}
