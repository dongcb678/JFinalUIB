package com.junit.platform;

import org.junit.Test;

import com.junit.TestBase;
import com.platform.mvc.user.User;
import com.platform.mvc.user.UserService;

public class TestUser extends TestBase {
	
	@Test
    public void testfindById(){
		User user = User.dao.findById("03a44ba0aa4e4905bea726d4da976ba0");
        System.out.println("-------------------------" + user.getPKValue());
    }

	@Test
    public void testdelete(){
		UserService.service.delete("03a44ba0aa4e4905bea726d4da976ba0,03a44ba0aa4e4905bea726d4da976ba1");
    }

}
