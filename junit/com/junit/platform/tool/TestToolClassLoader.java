package com.junit.platform.tool;

import org.junit.Test;

import com.jfinal.kit.PathKit;
import com.junit.TestBase;
import com.platform.mvc.user.User;
import com.platform.tools.ToolClassLoader;

public class TestToolClassLoader extends TestBase { 

	@Test
    public void load() throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		Class<?> cc = ToolClassLoader.loadClass(PathKit.getRootClassPath(), "com.platform.mvc.user.User");
		User user = (User) cc.newInstance();
    }

}
