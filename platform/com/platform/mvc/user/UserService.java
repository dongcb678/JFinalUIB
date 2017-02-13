package com.platform.mvc.user;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;

import com.jfinal.aop.Before;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.platform.annotation.Service;
import com.platform.dto.ZtreeNode;
import com.platform.mvc.base.BaseService;
import com.platform.mvc.dept.Department;
import com.platform.tools.security.ToolIDEA;
import com.platform.tools.security.ToolPbkdf2;

@Service(name = UserService.serviceName)
public class UserService extends BaseService {

	private static final Log log = Log.getLog(UserService.class);

	public static final String serviceName = "userService";

	/**
	 * 新增用户信息保存
	 * @param pkIds
	 * @param user
	 * @param password
	 * @param userInfo
	 */
	@Before(Tx.class)
	public void save(String pkIds, User user, String password, UserInfo userInfo) {
		try {
			// 密码加密
			byte[] salt = ToolPbkdf2.generateSalt();// 密码盐
			byte[] encryptedPassword = ToolPbkdf2.getEncryptedPassword(password, salt);
			user.set(User.column_salt, Base64.encodeBase64String(salt));
			user.set(User.column_password, Base64.encodeBase64String(encryptedPassword));

			// 初始化idea密钥
			String secretKey = Base64.encodeBase64String(ToolIDEA.initKey());
			user.setSecretkey(secretKey);
			
			// 保存用户
			user.set(User.column_errorcount, 0);
			user.set(User.column_status, "1");
			user.save(pkIds);

			// 保存用户扩展信息
			userInfo.save(pkIds);

			// 缓存
			User.cacheAdd(user.getPKValue());
		} catch (NoSuchAlgorithmException  e) {
			throw new RuntimeException("保存用户密码加密操作异常", e);
		} catch (InvalidKeySpecException e) {
			throw new RuntimeException("保存用户密码加密操作异常", e);
		}catch (Exception e) {
			throw new RuntimeException("保存用户异常", e);
		}
	}

	/**
	 * 更新用户信息
	 * @param user
	 * @param password
	 * @param userInfo
	 */
	@Before(Tx.class)
	public void update(User user, String password, UserInfo userInfo) {
		try {
			// 密码加密
			if (null != password && !password.trim().equals("")) {
				User oldUser = User.dao.findById(user.getPKValue());
				String saltStr = oldUser.getSalt();// 密码盐
				byte[] salt = Base64.decodeBase64(saltStr);
				byte[] encryptedPassword = ToolPbkdf2.getEncryptedPassword(password, salt);
				user.set(User.column_password, Base64.encodeBase64String(encryptedPassword));
			}

			// 更新用户
			user.update();

			// 更新用户扩展信息
			userInfo.update();

			// 缓存
			User.cacheAdd(user.getPKValue());
		} catch (Exception e) {
			throw new RuntimeException("更新用户异常", e);
		}
	}

	/**
	 * 删除用户信息
	 * @param ids
	 */
	@Before(Tx.class)
	public void delete(String ids) {
		String[] idsArr = splitByComma(ids);
		for (String userIds : idsArr) {
			// 缓存
			User.cacheRemove(userIds);
			
			// 删除
			User.dao.deleteById(userIds);
			UserInfo.dao.deleteById(userIds);
		}
	}

	/**
	 * 获取子节点数据
	 * @param cxt
	 * @param deptIds
	 * @return
	 */
	public List<ZtreeNode> childNodeData(String cxt, String deptIds) {
		// 查询部门数据
		List<Department> deptList = null;
		if (null != deptIds) {
			String sql = getSqlMy(Department.sqlId_childNode);
			deptList = Department.dao.find(sql, deptIds.replace("dept_", ""));
		} else {
			String sql = getSqlMy(Department.sqlId_rootNode);
			deptList = Department.dao.find(sql);
		}

		// 查询用户数据
		List<User> userList = null;
		if (null != deptIds) {
			String sql = getSqlMy(User.sqlId_treeUserNode);
			userList = User.dao.find(sql, deptIds.replace("dept_", ""));
		}

		List<ZtreeNode> nodeList = new ArrayList<ZtreeNode>();
		ZtreeNode node = null;

		// 封装用户数据
		if (null != userList) {
			for (User user : userList) {
				node = new ZtreeNode();
				node.setId("user_" + user.getPKValue());
				node.setName(user.getStr("names"));
				node.setIsParent(false);
				node.setIcon(cxt + "/jsfile/ztree/css/zTreeStyle/img/diy/5.png");
				nodeList.add(node);
			}
		}

		// 封装部门数据
		for (Department dept : deptList) {
			node = new ZtreeNode();
			node.setId("dept_" + dept.getPKValue());
			node.setName(dept.getStr("names"));
			
			if (null != deptIds) {
				node.setIsParent(true);
			} else {
				node.setIsParent(Boolean.parseBoolean(dept.getStr(Department.column_isparent)));
			}
			node.setIcon(cxt + "/jsfile/ztree/css/zTreeStyle/img/diy/" + dept.getStr(Department.column_images));
			nodeList.add(node);
		}

		return nodeList;
	}

	/**
	 * 验证密码是否正确
	 * @param userName
	 * @param passWord
	 * @return
	 */
	public boolean valiPassWord(String userName, String passWord) {
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("column", User.column_username);
			String sql = getSqlByBeetl(User.sqlId_column, param);
			User user = User.dao.findFirst(sql, userName);
			String saltStr = user.getSalt();// 密码盐
			byte[] salt = Base64.decodeBase64(saltStr);
			byte[] encryptedPassword = user.getBytes(User.column_password);
			boolean bool = ToolPbkdf2.authenticate(passWord, encryptedPassword, salt);
			if (bool) {
				return true;
			}
		} catch (Exception e) {
			if(log.isErrorEnabled()) log.error("验证密码是否正确异常，userName:" + userName + "，密码：" + passWord, e);
			return false;
		}
		return false;
	}
	
	/**
	 * 密码变更
	 * @param userName
	 * @param passOld
	 * @param passNew
	 */
	public void passChange(String userName, String passOld, String passNew){
		try {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("column", User.column_username);
			String sql = getSqlByBeetl(User.sqlId_column, param);
			User user = User.dao.findFirst(sql, userName);
			
			// 验证密码
			String saltStr = user.getSalt();			// 密码盐
			byte[] salt = Base64.decodeBase64(saltStr);
			String passStr = user.getPassword();		// 密码
			byte[] encryptedPassword = Base64.decodeBase64(passStr);
			boolean bool = false;
			try {
				bool = ToolPbkdf2.authenticate(passOld, encryptedPassword, salt);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				e.printStackTrace();
			}
			if (bool) {
				byte[] saltNew = ToolPbkdf2.generateSalt();// 密码盐
				byte[] encryptedPasswordNew = ToolPbkdf2.getEncryptedPassword(passNew, saltNew);
				user.set(User.column_salt, Base64.encodeBase64String(saltNew));
				user.set(User.column_password, Base64.encodeBase64String(encryptedPasswordNew));
				// 更新用户
				user.update();
				// 缓存
				User.cacheAdd(user.getPKValue());
			}
		} catch (Exception e) {
			if(log.isErrorEnabled()) log.error("更新用户密码异常，userName:" + userName + "，旧密码：" + passOld + "，新密码：" + passNew, e);
		}
	}
	
}
