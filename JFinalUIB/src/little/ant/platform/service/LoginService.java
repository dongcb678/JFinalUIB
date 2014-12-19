package little.ant.platform.service;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import little.ant.platform.common.DictKeys;
import little.ant.platform.model.User;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.tools.ToolContext;
import little.ant.platform.tools.ToolDateTime;
import little.ant.platform.tools.ToolSecurityPbkdf2;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;

public class LoginService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LoginService.class);

	public static final LoginService service = new LoginService();

	/**
	 * 验证账号是否存在
	 * @param mailbox
	 * @return
	 */
	public int valiUserName(String userName){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("table", "pt_user");
		param.put("column", "username");
		String sql = getSql("platform.baseModel.selectCount", param);
		int count = Db.queryLong(sql, userName).intValue();
		return count;
	}

	/**
	 * 验证邮箱是否存在
	 * @param mailbox
	 * @return
	 */
	public int valiMailBox(String mailBox){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("table", "pt_userinfo");
		param.put("column", "email");
		String sql = getSql("platform.baseModel.selectCount", param);
		int count = Db.queryLong(sql, mailBox).intValue();
		return count;
	}

	/**
	 * 验证身份证是否存在
	 * @param mailbox
	 * @return
	 */
	public int valiIdcard(String idcard){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("table", "pt_userinfo");
		param.put("column", "idcard");
		String sql = getSql("platform.baseModel.selectCount", param);
		int count = Db.queryLong(sql, idcard).intValue();
		return count;
	}

	/**
	 * 验证手机号是否存在
	 * @param mailbox
	 * @return
	 */
	public int valiMobile(String mobile){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("table", "pt_userinfo");
		param.put("column", "mobile");
		String sql = getSql("platform.baseModel.selectCount", param);
		int count = Db.queryLong(sql, mobile).intValue();
		return count;
	}
	
	/**
	 * 用户登录后台验证
	 * @param request
	 * @param response
	 * @param userName
	 * @param passWord
	 * @param autoLogin
	 * @return
	 */
	public int login(HttpServletRequest request, HttpServletResponse response, String userName, String passWord, boolean autoLogin) {
		// 1.取用户
		User user = null;
		Object userObj = User.dao.cacheGet(userName);
		if (null != userObj) {
			user = (User) userObj;
		} else {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("column", "username");
			String sql = getSql("platform.user.column", param);
			List<User> userList = User.dao.find(sql, userName);
			if (userList.size() != 1) {
				return DictKeys.login_info_0;// 用户不存在
			}
			user = userList.get(0);
		}
		
		// 2.停用账户
		String status = user.getStr("status");
		if (status.equals("0")) {
			return DictKeys.login_info_1;
		}

		// 3.密码错误次数超限
		int errorCount = user.getNumber("errorcount").intValue();
		int passErrorCount = ((Integer) PropertiesPlugin.getParamMapValue(DictKeys.config_passErrorCount_key)).intValue();
		if(errorCount >= passErrorCount){
			Date stopDate = user.getDate("stopDate");
			int hourSpace = ToolDateTime.getDateHourSpace(ToolDateTime.getDate(), stopDate);
			int passErrorHour = ((Integer) PropertiesPlugin.getParamMapValue(DictKeys.config_passErrorHour_key)).intValue();
			if(hourSpace < passErrorHour){
				return DictKeys.login_info_2;// 密码错误次数超限，几小时内不能登录
			}else{
				String sql = getSql("platform.user.start");
				Db.use(DictKeys.db_dataSource_main).update(sql, user.getStr("ids"));
				// 更新缓存
				User.dao.cacheAdd(user.getStr("ids"));
			}
		}

		// 4.验证密码
		byte[] salt = user.getBytes("salt");// 密码盐
		byte[] encryptedPassword = user.getBytes("password");
		boolean bool = false;
		try {
			bool = ToolSecurityPbkdf2.authenticate(passWord, encryptedPassword, salt);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		if (bool) {
			// 密码验证成功
			ToolContext.setCurrentUser(request, response, user, autoLogin);// 设置登录账户
			return DictKeys.login_info_3;
		} else {
			// 密码验证失败
			String sql = getSql("platform.user.stop");
			Db.use(DictKeys.db_dataSource_main).update(sql, ToolDateTime.getSqlTimestamp(ToolDateTime.getDate()), errorCount+1, user.getStr("ids"));
			// 更新缓存
			User.dao.cacheAdd(user.getStr("ids"));
			return DictKeys.login_info_4;
		}
	}

}
