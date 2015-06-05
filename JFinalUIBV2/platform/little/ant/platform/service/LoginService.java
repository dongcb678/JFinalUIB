package little.ant.platform.service;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantLogin;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.model.BaseModel;
import little.ant.platform.model.User;
import little.ant.platform.model.UserInfo;
import little.ant.platform.plugin.PropertiesPlugin;
import little.ant.platform.tools.ToolContext;
import little.ant.platform.tools.ToolDateTime;
import little.ant.platform.tools.ToolSecurityPbkdf2;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;

public class LoginService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LoginService.class);

	public static final LoginService service = MyTxProxy.newProxy(LoginService.class);

	/**
	 * 验证账号是否存在
	 * @param mailbox
	 * @return
	 */
	public int valiUserName(String userName){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("table", "pt_user");
		param.put("column", User.colunm_username);
		String sql = getSqlByBeetl(BaseModel.sqlId_selectCount, param);
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
		param.put("column", UserInfo.colunm_email);
		String sql = getSqlByBeetl(BaseModel.sqlId_selectCount, param);
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
		param.put("column", UserInfo.colunm_idcard);
		String sql = getSqlByBeetl(BaseModel.sqlId_selectCount, param);
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
		param.put("column", UserInfo.colunm_mobile);
		String sql = getSqlByBeetl(BaseModel.sqlId_selectCount, param);
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
			param.put("column", User.colunm_username);
			String sql = getSqlByBeetl(User.sqlId_column, param);
			List<User> userList = User.dao.find(sql, userName);
			if (userList.size() != 1) {
				return ConstantLogin.login_info_0;// 用户不存在
			}
			user = userList.get(0);
		}
		
		// 2.停用账户
		String status = user.getStr(User.colunm_status);
		if (status.equals("0")) {
			return ConstantLogin.login_info_1;
		}

		// 3.密码错误次数超限
		int errorCount = user.getNumber(User.colunm_errorcount).intValue();
		int passErrorCount = ((Integer) PropertiesPlugin.getParamMapValue(ConstantInit.config_passErrorCount_key)).intValue();
		if(errorCount >= passErrorCount){
			Date stopDate = user.getDate(User.colunm_stopdate);
			int hourSpace = ToolDateTime.getDateHourSpace(ToolDateTime.getDate(), stopDate);
			int passErrorHour = ((Integer) PropertiesPlugin.getParamMapValue(ConstantInit.config_passErrorHour_key)).intValue();
			if(hourSpace < passErrorHour){
				return ConstantLogin.login_info_2;// 密码错误次数超限，几小时内不能登录
			}else{
				String sql = getSql(User.sqlId_start);
				Db.use(ConstantInit.db_dataSource_main).update(sql, user.getPKValue());
				// 更新缓存
				User.dao.cacheAdd(user.getPKValue());
			}
		}

		// 4.验证密码
		byte[] salt = user.getBytes(User.colunm_salt);// 密码盐
		byte[] encryptedPassword = user.getBytes(User.colunm_password);
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
			return ConstantLogin.login_info_3;
		} else {
			// 密码验证失败
			String sql = getSql(User.sqlId_stop);
			Db.use(ConstantInit.db_dataSource_main).update(sql, ToolDateTime.getSqlTimestamp(ToolDateTime.getDate()), errorCount+1, user.getPKValue());
			// 更新缓存
			User.dao.cacheAdd(user.getPKValue());
			return ConstantLogin.login_info_4;
		}
	}

	/**
	 * 用户登录后台验证
	 * @param request
	 * @param response
	 * @param userName
	 * @param passWord
	 * @return
	 */
	public int pass(HttpServletRequest request, HttpServletResponse response, String userName, String passWord) {
		// 1.取用户
		User user = null;
		Object userObj = User.dao.cacheGet(userName);
		if (null != userObj) {
			user = (User) userObj;
		} else {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("column", User.colunm_username);
			String sql = getSqlByBeetl(User.sqlId_column, param);
			List<User> userList = User.dao.find(sql, userName);
			if (userList.size() != 1) {
				return ConstantLogin.login_info_0;// 用户不存在
			}
			user = userList.get(0);
		}
		
		// 2.停用账户
		String status = user.getStr(User.colunm_status);
		if (status.equals("0")) {
			return ConstantLogin.login_info_1;
		}

		// 3.密码错误次数超限
		int errorCount = user.getNumber(User.colunm_errorcount).intValue();
		int passErrorCount = ((Integer) PropertiesPlugin.getParamMapValue(ConstantInit.config_passErrorCount_key)).intValue();
		if(errorCount >= passErrorCount){
			Date stopDate = user.getDate(User.colunm_stopdate);
			int hourSpace = ToolDateTime.getDateHourSpace(ToolDateTime.getDate(), stopDate);
			int passErrorHour = ((Integer) PropertiesPlugin.getParamMapValue(ConstantInit.config_passErrorHour_key)).intValue();
			if(hourSpace < passErrorHour){
				return ConstantLogin.login_info_2;// 密码错误次数超限，几小时内不能登录
			}else{
				String sql = getSql(User.sqlId_start);
				Db.use(ConstantInit.db_dataSource_main).update(sql, user.getPKValue());
				// 更新缓存
				User.dao.cacheAdd(user.getPKValue());
			}
		}

		// 4.验证密码
		byte[] salt = user.getBytes(User.colunm_salt);// 密码盐
		byte[] encryptedPassword = user.getBytes(User.colunm_password);
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
			return ConstantLogin.login_info_3;
		} else {
			// 密码验证失败
			String sql = getSql(User.sqlId_stop);
			Db.use(ConstantInit.db_dataSource_main).update(sql, ToolDateTime.getSqlTimestamp(ToolDateTime.getDate()), errorCount+1, user.getPKValue());
			// 更新缓存
			User.dao.cacheAdd(user.getPKValue());
			return ConstantLogin.login_info_4;
		}
	}

}
