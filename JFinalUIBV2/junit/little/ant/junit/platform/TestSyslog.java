package little.ant.junit.platform;

import java.sql.SQLException;

import little.ant.junit.TestBase;
import little.ant.platform.service.SysLogService;

import org.junit.Test;

public class TestSyslog extends TestBase {
	
	@Test
    public void deleteSysLog() throws SQLException{
		SysLogService.service.delete("pt_syslog", "04e0b6b2deef4d40961d7f462569f406,0f10d03afca64fefaea6428151d5a9f0");
    }

}
