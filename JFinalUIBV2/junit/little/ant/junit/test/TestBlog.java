package little.ant.junit.test;

import java.sql.SQLException;

import little.ant.junit.TestBase;
import little.ant.platform.service.SysLogService;

import org.junit.Test;

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
