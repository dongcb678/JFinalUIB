package com.junit.platform.tool;

import java.sql.SQLException;

import org.junit.Test;

import com.platform.tools.ToolSqlXml;

public class TestToolSqlXml { // extends TestBase {
	
	@Test
    public void keywordVali() throws SQLException{
		boolean bool = ToolSqlXml.keywordVali("delete");
		System.out.println(bool);
    }

}
