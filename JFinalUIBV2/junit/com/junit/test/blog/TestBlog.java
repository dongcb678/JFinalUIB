package com.junit.test.blog;

import java.sql.SQLException;

import org.junit.Test;

import com.junit.TestBase;
import com.platform.mvc.syslog.SysLogService;

/**
 * 博客单元测试类
 * @author 董华健  dongcb678@163.com
 */
public class TestBlog extends TestBase {
	
	@Test
    public void delete() throws SQLException{
		SysLogService.service.delete("test_blog", "ids001,ids002");
    }

}
