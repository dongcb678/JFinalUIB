package com.junit.platform;

import org.junit.Test;

import com.jfinal.json.FastJson;
import com.jfinal.json.JFinalJson;
import com.jfinal.json.Jackson;
import com.jfinal.kit.JsonKit;
import com.junit.TestBase;
import com.platform.mvc.group.Group;

public class TestJson extends TestBase {
	
	@Test
    public void json(){
        System.out.println("-------------start------------");
        
        // 构造数据
        Group group = Group.dao.findById("8a40c0353fa828a6013fa898d4ac0028");
        group.put("testput", "putvalue");
        
        // 系统默认为JFinalJson
        String defaultJson = JsonKit.toJson(group);
        System.out.println(defaultJson);
		
        // JFinalJson
        String jfinalJson = JFinalJson.getJson().toJson(group);
        System.out.println(jfinalJson);
        
        // FastJson
        String fastJson = FastJson.getJson().toJson(group);
        System.out.println(fastJson);

        // Jackson
        String jacksonJson = Jackson.getJson().toJson(group);
        System.out.println(jacksonJson);
        
        System.out.println("-------------end------------");
    }

}
