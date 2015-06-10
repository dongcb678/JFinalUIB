package little.ant.platform.service;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import little.ant.platform.annotation.MyTxProxy;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.dto.SplitPage;
import little.ant.platform.dto.ZtreeNode;
import little.ant.platform.model.Department;
import little.ant.platform.model.User;
import little.ant.platform.model.UserInfo;
import little.ant.platform.tools.ToolSecurityPbkdf2;

import org.apache.log4j.Logger;

public class UserService extends BaseService {

	private static Logger log = Logger.getLogger(UserService.class);

	public static final UserService service = MyTxProxy.newProxy(UserService.class);
	
	/**
	 * 保存
	 * 
	 * @param user
	 * @param passWord
	 * @param userInfo
	 */
	public void save(User user, String password, UserInfo userInfo) {
		try {
			// 密码加密
			byte[] salt = ToolSecurityPbkdf2.generateSalt();// 密码盐
			byte[] encryptedPassword = ToolSecurityPbkdf2.getEncryptedPassword(password, salt);
			user.set(User.column_salt, salt);
			user.set(User.column_password, encryptedPassword);

			// 保存用户信息
			userInfo.save();

			// 保存用户
			user.set(User.column_userinfoids, userInfo.getPKValue());
			user.set(User.column_errorcount, 0);
			user.set(User.column_status, "1");
			user.save();

			// 缓存
			User.dao.cacheAdd(user.getPKValue());
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("保存用户密码加密操作异常", e);
		} catch (InvalidKeySpecException e) {
			throw new RuntimeException("保存用户密码加密操作异常", e);
		} catch (Exception e) {
			throw new RuntimeException("保存用户异常", e);
		}
	}

	/**
	 * 更新
	 * 
	 * @param user
	 * @param passWord
	 * @param userInfo
	 */
	public void update(User user, String password, UserInfo userInfo) {
		try {
			// 密码加密
			if (null != password && !password.trim().equals("")) {
				User oldUser = User.dao.findById(user.getPKValue());
				byte[] salt = oldUser.getBytes(User.column_salt);// 密码盐
				byte[] encryptedPassword = ToolSecurityPbkdf2.getEncryptedPassword(password, salt);
				user.set(User.column_password, encryptedPassword);
			}

			// 更新用户
			user.update();
			userInfo.update();

			// 缓存
			User.dao.cacheAdd(user.getPKValue());
		} catch (Exception e) {
			throw new RuntimeException("更新用户异常", e);
		}
	}

	/**
	 * 删除
	 * 
	 * @param ids
	 */
	public void delete(String ids) {
		String[] idsArr = splitByComma(ids);
		for (String userIds : idsArr) {
			User user = User.dao.findById(userIds);
			String userInfoIds = user.getStr(User.column_userinfoids);

			// 缓存
			User.dao.cacheRemove(userIds);

			// 删除
			User.dao.deleteById(userIds);
			UserInfo.dao.deleteById(userInfoIds);
		}
	}

	/**
	 * 设置用户所在的组
	 * 
	 * @param userIds
	 * @param groupIds
	 */
	public void setGroup(String userIds, String groupIds) {
		User user = User.dao.findById(userIds);
		user.set(User.column_groupids, groupIds).update();

		// 缓存
		User.dao.cacheAdd(userIds);
	}

	/**
	 * 获取子节点数据
	 * @param deptIds
	 * @return
	 */
	public List<ZtreeNode> childNodeData(String deptIds) {
		// 查询部门数据
		List<Department> deptList = null;
		if (null != deptIds) {
			String sql = getSql(Department.sqlId_childNode);
			deptList = Department.dao.find(sql, deptIds.replace("dept_", ""));
		} else {
			String sql = getSql(Department.sqlId_rootNode);
			deptList = Department.dao.find(sql);
		}

		// 查询用户数据
		List<User> userList = null;
		if (null != deptIds) {
			String sql = getSql(User.sqlId_treeUserNode);
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
				node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/5.png");
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
			node.setIcon("/jsFile/zTree/css/zTreeStyle/img/diy/" + dept.getStr(Department.column_images));
			nodeList.add(node);
		}

		return nodeList;
	}

	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage) {
		splitPageBySqlId(ConstantInit.db_dataSource_main, splitPage, User.sqlId_splitPage_select, User.sqlId_splitPage_from);
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
			byte[] salt = user.getBytes(User.column_salt);// 密码盐
			byte[] encryptedPassword = user.getBytes(User.column_password);
			boolean bool = ToolSecurityPbkdf2.authenticate(passWord, encryptedPassword, salt);
			if (bool) {
				return true;
			}
		} catch (Exception e) {
			log.error("验证密码是否正确异常，userName:" + userName + "，密码：" + passWord, e);
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
			byte[] salt = user.getBytes(User.column_salt);// 密码盐
			byte[] encryptedPassword = user.getBytes(User.column_password);
			boolean bool = false;
			try {
				bool = ToolSecurityPbkdf2.authenticate(passOld, encryptedPassword, salt);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (InvalidKeySpecException e) {
				e.printStackTrace();
			}
			if (bool) {
				byte[] saltNew = ToolSecurityPbkdf2.generateSalt();// 密码盐
				byte[] encryptedPasswordNew = ToolSecurityPbkdf2.getEncryptedPassword(passNew, saltNew);
				user.set(User.column_salt, saltNew);
				user.set(User.column_password, encryptedPasswordNew);
				// 更新用户
				user.update();
				// 缓存
				User.dao.cacheAdd(user.getPKValue());
			}
		} catch (Exception e) {
			log.error("更新用户密码异常，userName:" + userName + "，旧密码：" + passOld + "，新密码：" + passNew, e);
		}
	}
	
}
