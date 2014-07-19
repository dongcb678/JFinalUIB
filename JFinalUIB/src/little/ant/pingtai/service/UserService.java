package little.ant.pingtai.service;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import little.ant.pingtai.common.SplitPage;
import little.ant.pingtai.model.Department;
import little.ant.pingtai.model.User;
import little.ant.pingtai.model.UserInfo;
import little.ant.pingtai.thread.ThreadParamInit;
import little.ant.pingtai.tools.ToolDateTime;
import little.ant.pingtai.tools.ToolEhcacheFactory;
import little.ant.pingtai.tools.ToolSecurityPbkdf2;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;

public class UserService extends BaseService {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(UserService.class);
	
	/**
	 * 保存
	 * @param user
	 * @param passWord
	 * @param userInfo
	 */
	@Before(Tx.class)
	public void save(User user, String password, UserInfo userInfo){
		try {
			// 密码加密
			byte[] salt = ToolSecurityPbkdf2.generateSalt();// 密码盐
			byte[] encryptedPassword = ToolSecurityPbkdf2.getEncryptedPassword(password, salt);
			user.set("salt", salt);
			user.set("password", encryptedPassword);

			// 保存用户信息
			userInfo.save();
			
			// 保存用户
			user.set("userinfoids", userInfo.getStr("ids"));
			user.set("errorcount", 0);
			user.set("status", "1");
			user.save();

			// 缓存
			user = User.dao.findById(user.getStr("ids"));
			ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
			cacheFactory.add(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr("ids"), user);
			cacheFactory.add(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr("username"), user);
			cacheFactory.add(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr("email"), user);
			cacheFactory.add(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr("mobile"), user);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("保存用户密码加密操作异常");
		} catch (InvalidKeySpecException e) {
			throw new RuntimeException("保存用户密码加密操作异常");
		} catch (Exception e) {
			throw new RuntimeException("保存用户异常");
		}
	}

	/**
	 * 更新
	 * @param user
	 * @param passWord
	 * @param userInfo
	 */
	@Before(Tx.class)
	public void update(User user, String password, UserInfo userInfo){
		try {
			// 密码加密
			if (null != password && !password.trim().equals("")) {
				User oldUser = User.dao.findById(user.getStr("ids"));
				byte[] salt = oldUser.getBytes("salt");// 密码盐
				byte[] encryptedPassword = ToolSecurityPbkdf2.getEncryptedPassword(password, salt);
				user.set("password", encryptedPassword);
			} 

			// 更新用户
			user.update();
			userInfo.update();

			// 缓存
			user = User.dao.findById(user.getStr("ids"));
			ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
			cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr("ids"), user);
			cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr("username"), user);
			cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr("email"), user);
			cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr("mobile"), user);
		} catch (Exception e) {
			throw new RuntimeException("更新用户异常");
		}
	}

	/**
	 * 删除
	 * @param userIds
	 */
	@Before(Tx.class)
	public void delete(String userIds){
		User user = User.dao.findById(userIds);
		String userInfoIds = user.getStr("userinfoids");
		UserInfo userInfo = UserInfo.dao.findById(userInfoIds);

		// 缓存
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.delete(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr("ids"));
		cacheFactory.delete(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr("username"));
		cacheFactory.delete(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr("email"));
		cacheFactory.delete(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr("mobile"));
		
		// 删除
		user.delete();
		UserInfo.dao.deleteById(userInfoIds);
	}

	/**
	 * 设置用户所在的组
	 * @param userIds
	 * @param groupIds
	 */
	public void setGroup(String userIds, String groupIds){
		User user = User.dao.findById(userIds);
		String userInfoIds = user.getStr("userinfoids");
		UserInfo userInfo = UserInfo.dao.findById(userInfoIds);
		
		user.set("groupids", groupIds).update();
		
		// 缓存
		user = User.dao.findById(user.getStr("ids"));
		ToolEhcacheFactory cacheFactory = ToolEhcacheFactory.getInstance();
		cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr("ids"), user);
		cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + user.getStr("username"), user);
		cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr("email"), user);
		cacheFactory.update(ToolEhcacheFactory.cache_name_system, ThreadParamInit.cacheStart_user + userInfo.getStr("mobile"), user);
	}

	/**
	 * 获取子节点数据
	 * @param String deptIds
	 * @return
	 * @throws Exception
	 */
	public String childNodeData(String deptIds){
		// 查询部门数据
		List<Department> deptList = null;
		if (null != deptIds) {
			String sql = " select ids, names, isParent, images from pt_department where parentDepartmentIds = ? order by orderIds asc ";
			deptList = Department.dao.find(sql, deptIds.replace("dept_", ""));
		} else {
			String sql = " select ids, names, isParent, images from pt_department where parentDepartmentIds is null order by orderIds asc ";
			deptList = Department.dao.find(sql);
		}

		// 查询用户数据
		List<User> userList = null;
		if (null != deptIds) {
			String sql = " select ids, userName as names from pt_user where departmentIds = ? order by userName asc ";
			userList = User.dao.find(sql, deptIds.replace("dept_", ""));
		}

		StringBuilder sb = new StringBuilder();
		sb.append("[");

		// 封装用户数据
		if (null != userList) {
			int userSize = userList.size() - 1;
			for (User user : userList) {
				sb.append(" { ");
				sb.append(" id : '").append("user_").append(user.getStr("ids")).append("', ");
				sb.append(" name : '").append(user.getStr("names")).append("', ");
				sb.append(" isParent : false, ");
				sb.append(" font : {'font-weight':'bold'}, ");
				sb.append(" icon : '/jsFile/zTree/css/zTreeStyle/img/diy/5.png' ");
				sb.append(" }");
				if (userList.indexOf(user) < userSize) {
					sb.append(", ");
				}
			}
		}

		int size = deptList.size() - 1;
		if (null != userList && userList.size() != 0 && size >= 0) {
			sb.append(", ");
		}

		// 封装部门数据
		for (Department dept : deptList) {
			sb.append(" { ");
			sb.append(" id : '").append("dept_").append(dept.getPrimaryKeyValue()).append("', ");
			sb.append(" name : '").append(dept.get("names")).append("', ");

			if (null != deptIds) {
				sb.append(" isParent : true, ");
			} else {
				sb.append(" isParent : ").append(dept.getStr("isparent")).append(", ");
			}

			sb.append(" font : {'font-weight':'bold'}, ");
			sb.append(" icon : '/jsFile/zTree/css/zTreeStyle/img/diy/").append(dept.getStr("images")).append("' ");
			sb.append(" }");
			if (deptList.indexOf(dept) < size) {
				sb.append(", ");
			}
		}

		sb.append("]");

		return sb.toString();
	}
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		String select = " select u.ids, u.username, ui.names, ui.email, ui.mobile, ui.birthday, d.names as deptnames ";
		splitPageBase(splitPage, select);
	}
	
	protected void makeFilter(Map<String, String> queryParam, StringBuilder formSqlSb, List<Object> paramValue) {
		formSqlSb.append(" from pt_user u  ");
		formSqlSb.append(" left join pt_userinfo ui on u.userinfoids = ui.ids ");
		formSqlSb.append(" left join pt_department d on u.departmentids = d.ids ");
		formSqlSb.append(" where 1=1 ");
		
		if(null == queryParam){
			return;
		}
		
		String userClass = queryParam.get("userClass");//用户分类
		String userName = queryParam.get("userName");//用户名
		String names = queryParam.get("names");//姓名
		String sex = queryParam.get("sex");//性别
		String email = queryParam.get("email");//邮箱
		String mobile = queryParam.get("mobile");//手机
		String telephone = queryParam.get("telephone");//电话
		String idCard = queryParam.get("idCard");//省份证
		String qq = queryParam.get("qq");//QQ
		String birthday = queryParam.get("birthday");//生日
		
		if(null!=userClass && !userClass.equals("")){
			formSqlSb.append(" and u.userClass=? ");
			paramValue.add(userClass.trim());
		}
		if(null!=userName && !userName.equals("")){
			formSqlSb.append(" and u.userName like ? ");
			paramValue.add("%" + userName.trim() + "%");
		}
		if(null!=names && !names.equals("")){
			formSqlSb.append(" and ui.names like ? ");
			paramValue.add("%" + names.trim() + "%");
		}
		if(null!=sex && !sex.equals("")){
			formSqlSb.append(" and ui.sex like ? ");
			paramValue.add("%" + sex.trim() + "%");
		}
		if(null!=email && !email.equals("")){
			formSqlSb.append(" and ui.email ? ");
			paramValue.add("%" + email.trim() + "%");
		}
		if(null!=mobile && !mobile.equals("")){
			formSqlSb.append(" and ui.mobile ? ");
			paramValue.add("%" + mobile.trim() + "%");
		}
		if(null!=telephone && !telephone.equals("")){
			formSqlSb.append(" and ui.telephone ? ");
			paramValue.add("%" + telephone.trim() + "%");
		}
		if(null!=idCard && !idCard.equals("")){
			formSqlSb.append(" and ui.idCard like ? ");
			paramValue.add("%" + idCard.trim() + "%");
		}
		if(null!=qq && !qq.equals("")){
			formSqlSb.append(" and ui.qq like ? ");
			paramValue.add("%" + qq.trim() + "%");
		}
		if(null!=birthday && !birthday.equals("")){
			try {
				formSqlSb.append(" and ui.birthday=? ");
				Date date = DateFormat.getDateTimeInstance().parse(birthday);
				paramValue.add(ToolDateTime.getSqlTimestamp(date));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}

}
