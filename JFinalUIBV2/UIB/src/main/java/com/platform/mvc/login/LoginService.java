package com.platform.mvc.login;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.Db;
import com.platform.constant.ConstantInit;
import com.platform.constant.ConstantLogin;
import com.platform.interceptor.AuthInterceptor;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.user.User;
import com.platform.mvc.user.UserInfo;
import com.platform.tools.ToolDateTime;
import com.platform.tools.security.ToolPbkdf2;

public class LoginService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LoginService.class);

	public static final LoginService service = Enhancer.enhance(LoginService.class);

	/**
	 * 验证账号是否存在
	 * @param userIds
	 * @param userName
	 * @return
	 * 描述：新增用户时userIds为空，修改用户时userIds传值
	 */
	public boolean valiUserName(String userIds, String userName){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("column", "ids");
		param.put("table", "pt_user");
		param.put("condition", User.column_username);
		String sql = getSqlByBeetl("platform.baseModel.select", param);
		List<User> list = User.dao.find(sql, userName);
		int size = list.size();
		if(size == 0){
			return true;
		}
		if(size == 1){
			User user = list.get(0);
			if(userIds != null && user.getStr(UserInfo.column_ids).equals(userIds)){
				return true;
			}
		}
		if(size > 1){
			return false;
		}
		return false;
	}

	/**
	 * 验证邮箱是否存在
	 * @param userInfoIds
	 * @param mailBox
	 * @return
	 * 描述：新增用户时userInfoIds为空，修改用户时userInfoIds传值
	 */
	public boolean valiMailBox(String userInfoIds, String mailBox){
		return valiByUserInfo(userInfoIds, UserInfo.column_email, mailBox);
	}

	/**
	 * 验证身份证是否存在
	 * @param userInfoIds
	 * @param idcard
	 * @return
	 * 描述：新增用户时userInfoIds为空，修改用户时userInfoIds传值
	 */
	public boolean valiIdcard(String userInfoIds, String idcard){
		return valiByUserInfo(userInfoIds, UserInfo.column_idcard, idcard);
	}

	/**
	 * 验证手机号是否存在
	 * @param userInfoIds
	 * @param mobile
	 * @return
	 * 描述：新增用户时userInfoIds为空，修改用户时userInfoIds传值
	 */
	public boolean valiMobile(String userInfoIds, String mobile){
		return valiByUserInfo(userInfoIds, UserInfo.column_mobile, mobile);
	}
	
	/**
	 * 验证UserInfo表中的某一列是否唯一可用
	 * @param userInfoIds
	 * @param condition
	 * @param value
	 * @return
	 */
	private boolean valiByUserInfo(String userInfoIds, String condition, String value){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("column", "ids");
		param.put("table", "pt_userinfo");
		param.put("condition", condition);
		String sql = getSqlByBeetl("platform.baseModel.select", param);
		List<UserInfo> list = UserInfo.dao.find(sql, value);
		int size = list.size();
		if(size == 0){
			return true;
		}
		if(size == 1){
			UserInfo userInfo = list.get(0);
			if(userInfoIds != null && userInfo.getStr(UserInfo.column_ids).equals(userInfoIds)){
				return true;
			}
		}
		if(size > 1){
			return false;
		}
		return false;
	}
	
	/**
	 * 用户登录后台验证
	 * @param request
	 * @param response
	 * @param userName	账号
	 * @param passWord	密码
	 * @param autoLogin	是否自动登录
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
			param.put("column", User.column_username);
			String sql = getSqlByBeetl(User.sqlId_column, param);
			List<User> userList = User.dao.find(sql, userName);
			if (userList.size() != 1) {
				return ConstantLogin.login_info_0;// 用户不存在
			}
			user = userList.get(0);
		}
		
		// 2.停用账户
		String status = user.getStr(User.column_status);
		if (status.equals("0")) {
			return ConstantLogin.login_info_1;
		}

		// 3.密码错误次数超限
		long errorCount = user.getNumber(User.column_errorcount).longValue();
		int passErrorCount = PropKit.getInt(ConstantInit.config_passErrorCount_key);
		if(errorCount >= passErrorCount){
			Date stopDate = user.getDate(User.column_stopdate);
			int hourSpace = ToolDateTime.getDateHourSpace(ToolDateTime.getDate(), stopDate);
			int passErrorHour = PropKit.getInt(ConstantInit.config_passErrorHour_key);
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
		byte[] salt = user.getBytes(User.column_salt);// 密码盐
		byte[] encryptedPassword = user.getBytes(User.column_password);
		boolean bool = false;
		try {
			bool = ToolPbkdf2.authenticate(passWord, encryptedPassword, salt);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		if (bool) {
			// 密码验证成功
			AuthInterceptor.setCurrentUser(request, response, user, autoLogin);// 设置登录账户
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
			param.put("column", User.column_username);
			String sql = getSqlByBeetl(User.sqlId_column, param);
			List<User> userList = User.dao.find(sql, userName);
			if (userList.size() != 1) {
				return ConstantLogin.login_info_0;// 用户不存在
			}
			user = userList.get(0);
		}
		
		// 2.停用账户
		String status = user.getStr(User.column_status);
		if (status.equals("0")) {
			return ConstantLogin.login_info_1;
		}

		// 3.密码错误次数超限
		long errorCount = user.getNumber(User.column_errorcount).longValue();
		int passErrorCount = PropKit.getInt(ConstantInit.config_passErrorCount_key);
		if(errorCount >= passErrorCount){
			Date stopDate = user.getDate(User.column_stopdate);
			int hourSpace = ToolDateTime.getDateHourSpace(ToolDateTime.getDate(), stopDate);
			int passErrorHour = PropKit.getInt(ConstantInit.config_passErrorHour_key);
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
		byte[] salt = user.getBytes(User.column_salt);// 密码盐
		byte[] encryptedPassword = user.getBytes(User.column_password);
		boolean bool = false;
		try {
			bool = ToolPbkdf2.authenticate(passWord, encryptedPassword, salt);
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
