package com.junit.platform.tool;

import java.sql.SQLException;

import org.junit.Test;

import com.junit.TestBase;
import com.platform.mvc.operator.Operator;
import com.platform.tools.ToolCache;

public class TestToolCache extends TestBase {
	
	@Test
    public void keywordVali() throws SQLException{
		Operator operator = Operator.dao.findById("01aa0c85c8b84ae8aca7f5484336b203");
		ToolCache.set(operator.getPKValue(), operator);
		
		Operator operator2 = ToolCache.get("111");
		System.out.println(operator2.getPKValue());
    }

}
