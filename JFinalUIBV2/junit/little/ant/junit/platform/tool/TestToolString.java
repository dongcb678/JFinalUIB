package little.ant.junit.platform.tool;

import java.sql.SQLException;

import little.ant.junit.TestBase;
import little.ant.platform.tools.ToolString;

import org.junit.Test;

public class TestToolString extends TestBase {
	
	@Test
    public void regExp() throws SQLException{
		for (int i = 0; i < 10; i++) {
			long start = System.currentTimeMillis();
			
			boolean bool = ToolString.regExpVali("12qwAS'", ToolString.regExp_letter_5);
			
			long end = System.currentTimeMillis();
			
			System.out.println(bool + " : " + (end - start));
		}
    }

}
