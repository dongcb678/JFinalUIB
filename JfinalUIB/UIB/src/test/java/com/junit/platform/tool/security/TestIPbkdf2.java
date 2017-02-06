package com.junit.platform.tool.security;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

import org.junit.Test;

import com.platform.tools.security.ToolPbkdf2;

public class TestIPbkdf2 { // extends TestBase  {

	@Test
    public void test() throws NoSuchAlgorithmException, InvalidKeySpecException{
		String pass = "000000";
		byte[] salt = ToolPbkdf2.generateSalt();
//		String saltStr = Base64.encodeBase64String(salt);

		byte[] encryptedPassword = ToolPbkdf2.getEncryptedPassword(pass, salt);
//		String encryptedPasswordStr = Base64.encodeBase64String(encryptedPassword);

		boolean bool = ToolPbkdf2.authenticate(pass, encryptedPassword, salt);
		System.out.println(bool);
	}
	
}
