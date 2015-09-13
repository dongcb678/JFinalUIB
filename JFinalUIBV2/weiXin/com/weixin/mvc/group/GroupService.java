package com.weixin.mvc.group;

import org.apache.log4j.Logger;

import com.jfinal.aop.Enhancer;
import com.platform.mvc.base.BaseService;
import com.weixin.bo.message.RecevieToken;
import com.weixin.bo.user.RecevieGroup;
import com.weixin.tools.ToolGroup;
import com.weixin.tools.ToolWeiXin;

public class GroupService extends BaseService {

	private static Logger log = Logger.getLogger(GroupService.class);

	public static final GroupService service = Enhancer.enhance(GroupService.class);
	
	/**
	 * 新建分组
	 * @param group
	 */
	public void save(Group group){
		RecevieToken accessToken = ToolWeiXin.getAccessToken();
		RecevieGroup recevieGroup = ToolGroup.createGroup(accessToken.getAccess_token(), group.getStr("name"));
		if(null != recevieGroup.getErrcode()){
			log.error("新建用户分组，微信接口返回异常");
			return;
		}
		group.set("id", recevieGroup.getId());
		group.set("name", recevieGroup.getName());
		group.save();
	}

	/**
	 * 更新分组
	 * @param group
	 */
	public void update(Group group){
		RecevieToken accessToken = ToolWeiXin.getAccessToken();
		boolean bool = ToolGroup.updateGroup(accessToken.getAccess_token(), group.getStr("id"), group.getStr("name"));
		if(bool){
			group.update();
		}else{
			log.error("更新用户分组，微信接口返回异常");
		}
	}

}
