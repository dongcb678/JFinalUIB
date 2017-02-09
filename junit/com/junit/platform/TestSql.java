package com.junit.platform;

import java.util.HashMap;

import org.junit.Test;

import com.jfinal.plugin.activerecord.Db;
import com.junit.TestBase;

public class TestSql extends TestBase {
	
	@Test
    public void getSql(){
        System.out.println("-------------start------------");
        
		String sql = Db.getSql("platform.user.findByUserName", new HashMap<String, Object>());
		System.out.println(sql);
		
        System.out.println("-------------end------------");
    }

}
