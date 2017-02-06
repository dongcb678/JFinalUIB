package com.junit.platform;

import org.junit.Test;

import com.junit.TestBase;
import com.platform.mvc.user.User;

public class TestModel extends TestBase {
	
	/**
	 * 测试model 3.0新增dao()方法是否能避免dao乱用引起的线程安全问题
	 */
	@Test
    public void dao(){
        System.out.println("-------------------------");
		User user = User.dao;
		user.set(User.column_ids, "e41d790ca25644dc96ad95c994b33130");
		user.set(User.column_username, "liudehua");
		user.update();
        System.out.println("-------------------------");
    }

}
