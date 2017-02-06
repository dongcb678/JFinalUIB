package com.junit.platform.tool;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.junit.Test;

import com.junit.TestBase;
import com.platform.tools.ToolBeetl;

public class TestToolBeetl extends TestBase {
	
	@Test
    public void makeHtml() throws SQLException{
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("cxt", "123<>");
		
		ToolBeetl.makeHtml("/test.html", paramMap, "d:\\aa.html");
    }

}
