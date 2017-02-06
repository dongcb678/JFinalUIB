package com.junit.platform.tool;

import java.sql.SQLException;
import java.util.List;

import org.junit.Test;

import com.jfinal.plugin.ehcache.CacheKit;
import com.junit.TestBase;
import com.platform.mvc.operator.Operator;
import com.platform.mvc.user.User;
import com.platform.tools.ToolCache;

public class TestToolCache extends TestBase {
	
	@Test
    public void keywordVali() throws SQLException{
		Operator operator = Operator.dao.findById("01aa0c85c8b84ae8aca7f5484336b203");
		ToolCache.set(operator.getPKValue(), operator);
		
		Operator operator2 = ToolCache.get("111");
		System.out.println(operator2.getPKValue());
    }

	/**
	 * 需要注意ehcache中cache属性，默认是读写同一个对象地址，最好加入下列两个属性配置，隔离读写对象
	 * copyOnWrite="true" copyOnRead="true"
	 */
	@Test
    public void testCacheKit(){
		List<User> userList1 = User.dao.find("select * from pt_user");
		System.out.println(userList1.get(0).getEmail());
		CacheKit.put("system", "userList", userList1);
		
		List<User> userList2 = CacheKit.get("system", "userList");
		System.out.println(userList2.get(0).getEmail());
		userList2.get(0).setEmail("xxoo@163.com");

		List<User> userList3 = CacheKit.get("system", "userList");
		System.out.println(userList3.get(0).getEmail());
    }
	
	@Test
    public void testFindByCache(){
		List<User> userList1 = User.dao.findByCache("system", "userList", "select * from pt_user");
		System.out.println(userList1.get(0).getEmail());
		
		userList1.get(0).setEmail("xxoo@163.com");
		System.out.println(userList1.get(0).getEmail());
		
		List<User> userList2 = User.dao.findByCache("system", "userList", "select * from pt_user");
		System.out.println(userList2.get(0).getEmail());
    }

}
