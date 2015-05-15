package little.ant.junit.platform;

import little.ant.junit.TestBase;
import little.ant.platform.model.User;

import org.junit.Test;

public class TestUser extends TestBase {
	
	@Test
    public void testfindById(){
		User user = User.dao.findById("03a44ba0aa4e4905bea726d4da976ba5");
        System.out.println("-------------------------" + user.getPKValue());
    }

}
