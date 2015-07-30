package little.ant.platform.junit.platform;

import org.junit.Test;

import little.ant.platform.junit.TestBase;
import little.ant.platform.service.SysLogService;

public class TestSyslog extends TestBase {
	
	@Test
    public void deleteSysLog() {
		try {
			SysLogService.service.delete("0141c7cba45c4d8782ea11f7552d5e54,025f244f92a540479aa8df25f3902798");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
    }

}
