package little.ant.platform.callback;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;

import com.jfinal.plugin.activerecord.ICallback;

/**
 * @author 董华健
 * 
 * 	调用
 * 		TestCallback testCallback = new TestCallback();
 * 		testCallback.setParam1("123");
 * 		String value = (String) Db.execute(testCallback); 
 * 		
 */
public class TestCallback implements ICallback {
	
	private String param1;

	@Override
	public Object call(Connection conn) throws SQLException {
		CallableStatement proc = null;

		proc = conn.prepareCall("{ call xxx.xxx(?,?) }");
		
		proc.setString(1, param1);
		proc.registerOutParameter(2, OracleTypes.CURSOR);
		
		proc.execute();
		
		ResultSet rs = (ResultSet) proc.getObject(2);
		
		return 123;
	}

	public String getParam1() {
		return param1;
	}

	public void setParam1(String param1) {
		this.param1 = param1;
	}

}
