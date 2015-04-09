package little.ant.weixin.service;

import little.ant.platform.common.DictKeys;
import little.ant.platform.common.SplitPage;
import little.ant.platform.model.Group;
import little.ant.platform.service.BaseService;
import little.ant.weixin.bo.message.RecevieToken;
import little.ant.weixin.bo.user.RecevieGroup;
import little.ant.weixin.tools.ToolGroup;
import little.ant.weixin.tools.ToolWeiXin;

import org.apache.log4j.Logger;

public class GroupService extends BaseService {

	private static Logger log = Logger.getLogger(GroupService.class);

	public static final GroupService service = new GroupService();
	
	/**
	 * 分页
	 * @param splitPage
	 */
	public void list(SplitPage splitPage){
		log.debug("微信用户分组管理：分页处理");
		String select = " select * ";
		splitPageBase(DictKeys.db_dataSource_main, splitPage, select, "weixin.group.splitPage");
	}
	
	/**
	 * 新建分组
	 * @param group
	 */
	public void save(Group group){
		RecevieToken accessToken = ToolWeiXin.getAccessToken();
		RecevieGroup recevieGroup = ToolGroup.createGroup(accessToken.getAccess_token(), group.getStr("name"));
		if(null != recevieGroup.getErrcode()){
			throw new RuntimeException("新建用户分组，微信接口返回异常");
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
			throw new RuntimeException("更新用户分组，微信接口返回异常");
		}
	}

}
