package little.ant.pingtai.service;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import little.ant.pingtai.common.ContextBase;
import little.ant.pingtai.common.DictKeys;
import little.ant.pingtai.common.EhcacheFactory;
import little.ant.pingtai.common.ParamInit;
import little.ant.pingtai.model.User;
import little.ant.pingtai.run.JfinalConfig;
import little.ant.pingtai.tools.ToolDateTime;
import little.ant.pingtai.tools.ToolSecurityPbkdf2;

import org.apache.log4j.Logger;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class LoginService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(LoginService.class);
	
	/**
	 * 验证密码是否正确
	 * @param ids
	 * @param passWord
	 * @return
	 */
	public String valiPassWord(String ids, String passWord) {
		try {
			Record user =  Db.findById("pt_user", "ids", ids, " salt, password ");
			byte[] salt = user.getBytes("salt");// 密码盐
			byte[] encryptedPassword = user.getBytes("password");
			boolean bool = ToolSecurityPbkdf2.authenticate(passWord, encryptedPassword, salt);
			if (bool) {
				return "success";
			} else {
				return "error";
			}
		} catch (Exception e) {
			return "runError";
		}
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
		Object userObj = EhcacheFactory.getInstance().get(EhcacheFactory.cache_name_system, ParamInit.cacheStart_user + userName);
		if (null != userObj) {
			user = (User) userObj;
		} else {
			List<User> userList = User.dao.findByCache(EhcacheFactory.cache_name_system, ParamInit.cacheStart_user + userName, "select * from pt_user where username=?", userName);
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
		int errorCount = user.getLong("errorcount").intValue();
		int passErrorCount = (int) JfinalConfig.getParamMapValue(DictKeys.config_passErrorCount_key);
		if(errorCount >= passErrorCount){
			Date stopDate = user.getDate("stopDate");
			int hourSpace = ToolDateTime.getDateHourSpace(new Date(), stopDate);
			int passErrorHour = (int) JfinalConfig.getParamMapValue(DictKeys.config_passErrorHour_key);
			if(hourSpace < passErrorHour){
				return DictKeys.login_info_2;// 密码错误次数超限，几小时内不能登录
			}else{
				Db.update(" update pt_user u set u.stopdate=null, u.errorcount=0 where u.ids = ? ", user.getStr("ids"));
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
			ContextBase.setCurrentUser(request, response, user, autoLogin);// 设置登录账户
			return DictKeys.login_info_3;
		} else {
			// 密码验证失败
			Db.update(" update pt_user u set u.stopDate = ? , u.errorCount = ? where u.ids = ? ", new Date(), errorCount+1, user.getStr("ids"));
			return DictKeys.login_info_4;
		}
	}

}
