package little.ant.junit.platform.tool;

import java.sql.SQLException;

import little.ant.junit.TestBase;
import little.ant.platform.tools.ToolSqlXml;

import org.junit.Test;

public class TestToolSqlXml extends TestBase {
	
	@Test
    public void keywordVali() throws SQLException{
		boolean bool = ToolSqlXml.keywordVali("username");
		System.out.println(bool);
    }

}
