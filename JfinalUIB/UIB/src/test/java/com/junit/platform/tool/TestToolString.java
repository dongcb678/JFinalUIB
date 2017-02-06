package com.junit.platform.tool;

import org.junit.Test;

import com.platform.tools.ToolString;

public class TestToolString { // extends TestBase {
	
	@Test
    public void regExp() {
		for (int i = 0; i < 10; i++) {
			long start = System.currentTimeMillis();
			
			boolean bool = ToolString.regExpVali("12qwAS_.-", ToolString.regExp_letter_6);
			
			long end = System.currentTimeMillis();
			
			System.out.println(bool + " : " + (end - start));
		}
    }

}
