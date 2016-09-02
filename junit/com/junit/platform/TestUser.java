package com.junit.platform;

import org.apache.commons.codec.binary.Base64;
import org.junit.Test;

import com.junit.TestBase;
import com.platform.mvc.user.User;
import com.platform.mvc.user.UserService;
import com.platform.plugin.ServicePlugin;
import com.platform.tools.security.ToolPbkdf2;

public class TestUser extends TestBase {
	
	@Test
    public void testfindById(){
		User user = User.dao.findById("03a44ba0aa4e4905bea726d4da976ba0");
        System.out.println("-------------------------" + user.getPKValue());
    }

	@Test
    public void testdelete(){
		UserService uService = (UserService) ServicePlugin.getService(UserService.serviceName);
		uService.delete("03a44ba0aa4e4905bea726d4da976ba0,03a44ba0aa4e4905bea726d4da976ba1");
    }

	/**
	 * 管理员密码密钥变更
	 * @throws Exception 
	 */
	@Test
	public void passChange() throws Exception{
		User user = User.dao.findById("03a44ba0aa4e4905bea726d4da976ba5"); // admins
		
		// 密码密钥更新
		byte[] salt = ToolPbkdf2.generateSalt();// 密码盐
		byte[] encryptedPassword = ToolPbkdf2.getEncryptedPassword("123456", salt);
		user.set(User.column_salt, Base64.encodeBase64String(salt));
		user.set(User.column_password, Base64.encodeBase64String(encryptedPassword));

		user.update();
		
		System.out.println("长度" + Base64.encodeBase64String(salt).length());
		System.out.println("长度" + Base64.encodeBase64String(encryptedPassword).length());
	}
	
}
