package little.ant.weixin.tools;

import java.util.List;

import little.ant.platform.tools.ToolHttp;
import little.ant.weixin.vo.user.RecevieGroup;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class ToolGroup {

	private static Logger log = Logger.getLogger(ToolGroup.class);
	
	/**
	 * 查询分组
	 * 
	 * @param accessToken 调用接口凭证
	 */
	@SuppressWarnings( { "unchecked" })
	public static List<RecevieGroup> getGroups(String accessToken) {
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/get?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 查询分组
		try {
			String jsonStr = ToolHttp.get(true, requestUrl);
			List<RecevieGroup> weixinGroupList = (List<RecevieGroup>) JSONArray.parseObject(jsonStr, RecevieGroup.class);
			return weixinGroupList;
		} catch (Exception e) {
			log.error("ToolGroup.getGroups查询分组异常，accessToken：" + accessToken);
			return null;
		}
	}

	/**
	 * 创建分组
	 * 
	 * @param accessToken 接口访问凭证
	 * @param groupName 分组名称
	 * @return
	 */
	public static RecevieGroup createGroup(String accessToken, String groupName) {
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/create?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		String jsonData = "{\"group\" : {\"name\" : \"%s\"}}";
		// 创建分组
		try {
			String jsonStr = ToolHttp.post(true, requestUrl, String.format(jsonData, groupName), "application/json");
			RecevieGroup weixinGroup = JSONObject.parseObject(jsonStr, RecevieGroup.class);
			return weixinGroup;
		} catch (Exception e) {
			log.error("ToolGroup.createGroup创建分组异常，accessToken：" + accessToken + " groupName：" + groupName);
			return null;
		}
	}

	/**
	 * 修改分组名
	 * 
	 * @param accessToken 接口访问凭证
	 * @param groupId 分组id
	 * @param groupName 修改后的分组名
	 * @return true | false
	 */
	public static boolean updateGroup(String accessToken, int groupId, String groupName) {
		boolean result = false;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/update?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		String jsonData = "{\"group\": {\"id\": %d, \"name\": \"%s\"}}";
		// 修改分组名
		try {
			String jsonStr = ToolHttp.post(true, requestUrl, String.format(jsonData, groupId, groupName), "application/json");
			RecevieGroup weixinGroup = JSONObject.parseObject(jsonStr, RecevieGroup.class);
			if (null != weixinGroup.getErrcode() && weixinGroup.getErrcode().equals("0")) {
				result = true;
			}
			return result;
		} catch (Exception e) {
			log.error("ToolGroup.updateGroup修改分组名异常，accessToken：" + accessToken + " groupId：" + groupId + " groupName：" + groupName);
			return result;
		}
	}

	/**
	 * 移动用户分组
	 * 
	 * @param accessToken 接口访问凭证
	 * @param openId 用户标识
	 * @param groupId 分组id
	 * @return true | false
	 */
	public static boolean updateMemberGroup(String accessToken, String openId, int groupId) {
		boolean result = false;
		// 拼接请求地址
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=ACCESS_TOKEN";
		requestUrl = requestUrl.replace("ACCESS_TOKEN", accessToken);
		// 需要提交的json数据
		String jsonData = "{\"openid\":\"%s\",\"to_groupid\":%d}";
		// 移动用户分组
		try {
			String jsonStr = ToolHttp.post(true, requestUrl, String.format(jsonData, openId, groupId), "application/json");
			RecevieGroup weixinGroup = JSONObject.parseObject(jsonStr, RecevieGroup.class);
			if (null != weixinGroup.getErrcode() && weixinGroup.getErrcode().equals("0")) {
				result = true;
			}
			return result;
		} catch (Exception e) {
			log.error("ToolGroup.updateGroup移动用户分组异常，accessToken：" + accessToken + " openId：" + openId + " groupId：" + groupId);
			return result;
		}
	}

	public static void main(String args[]) {
		// 获取接口访问凭证
		String accessToken = ToolWeiXin.getAccessToken().getAccess_token();
		
		/**
		 * 查询分组
		 */
		List<RecevieGroup> groupList = getGroups(accessToken);
		// 循环输出各分组信息
		for (RecevieGroup group : groupList) {
			System.out.println(String.format("ID：%d 名称：%s 用户数：%d", group.getId(), group.getName(), group.getCount()));
		}

		/**
		 * 创建分组
		 */
		RecevieGroup group = createGroup(accessToken, "公司员工");
		System.out.println(String.format("成功创建分组：%s id：%d", group.getName(), group.getId()));

		/**
		 * 修改分组名
		 */
		updateGroup(accessToken, 100, "同事");

		/**
		 * 移动用户分组
		 */
		updateMemberGroup(accessToken, "oEdzejiHCDqafJbz4WNJtWTMbDcE", 100);
	}
	
}
