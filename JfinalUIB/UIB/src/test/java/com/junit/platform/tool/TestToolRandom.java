package com.junit.platform.tool;

import java.sql.SQLException;

import org.junit.Test;

import com.platform.tools.ToolRandoms;

public class TestToolRandom {//extends TestBase {
	
	@Test
    public void genIds() throws SQLException{
		for (int i = 0; i < 144; i++) {
			System.out.println(ToolRandoms.getUuid(true));
		}
    }

}
