package com.junit.platform.tool;

import java.sql.SQLException;

import org.junit.Test;

import com.junit.TestBase;
import com.platform.tools.ToolSqlXml;

public class TestToolSqlXml extends TestBase {
	
	@Test
    public void keywordVali() throws SQLException{
		boolean bool = ToolSqlXml.keywordVali("username");
		System.out.println(bool);
    }

}
