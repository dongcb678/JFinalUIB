package little.ant.junit.platform;

import little.ant.junit.TestBase;
import little.ant.platform.model.User;
import little.ant.platform.service.UserService;

import org.junit.Test;

public class TestUser extends TestBase {
	
	@Test
    public void testfindById(){
		User user = User.dao.findById("03a44ba0aa4e4905bea726d4da976ba0");
        System.out.println("-------------------------" + user.getPKValue());
    }

	@Test
    public void testdelete(){
		UserService.service.delete("03a44ba0aa4e4905bea726d4da976ba0,03a44ba0aa4e4905bea726d4da976ba1");
    }

}
