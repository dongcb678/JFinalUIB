package little.ant.weixin.tools;

import little.ant.pingtai.tools.ToolHttp;
import little.ant.weixin.vo.menu.RecevieMenuCreate;
import little.ant.weixin.vo.menu.RecevieMenuDelete;
import little.ant.weixin.vo.menu.ResponseMenu;

import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;

/**
 * 菜单操作
 * @author 董华健
 *
 */
public class ToolMenu {
	
	private static Logger log = Logger.getLogger(ToolMenu.class);

	// 菜单创建（POST）
	public final static String menu_create_url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	
	// 菜单查询（GET）
	public final static String menu_get_url = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=ACCESS_TOKEN";
	
	// 菜单删除（GET）
	public final static String menu_delete_url = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";

	/**
	 * 创建菜单
	 * @param menu 菜单实例
	 * @param accessToken 凭证
	 * @return true成功 false失败
	 */
	public static boolean createMenu(ResponseMenu menu, String accessToken) {
		boolean result = false;
		String url = menu_create_url.replace("ACCESS_TOKEN", accessToken);
		
		// 将菜单对象转换成JSON字符串
		String jsonMenu = JSON.toJSONString(menu);
		
		// 发起POST请求创建菜单
		try {
			String returnJson = ToolHttp.post(true, url, jsonMenu, "application/json");
			RecevieMenuCreate menuCreate = JSON.parseObject(returnJson, RecevieMenuCreate.class);
			if (null != menuCreate) {
				String errorCode = menuCreate.getErrcode();
				if (null != errorCode && errorCode.equals("0")) {
					result = true;
				} else {
					result = false;
					String errorMsg = menuCreate.getErrmsg();
					log.error("创建菜单失败: " + errorMsg);
				}
			}
			return result;
		} catch (Exception e) {
			log.error("ToolMenu.createMenu创建菜单异常，accessToken：" + accessToken + " jsonMenu：" + jsonMenu);
			return result;
		}
	}

	/**
	 * 查询菜单
	 * @param accessToken 凭证
	 * @return
	 */
	public static String getMenu(String accessToken) {
		String requestUrl = menu_get_url.replace("ACCESS_TOKEN", accessToken);
		// 发起GET请求查询菜单
		try {
			String returnJson = ToolHttp.get(true, requestUrl);
			return returnJson;
		}catch (Exception e) {
			log.error("ToolMenu.getMenu查询菜单异常，accessToken：" + accessToken);
			return null;
		}
	}

	/**
	 * 删除菜单
	 * @param accessToken 凭证
	 * @return true成功 false失败
	 */
	public static boolean deleteMenu(String accessToken) {
		boolean result = false;
		String requestUrl = menu_delete_url.replace("ACCESS_TOKEN", accessToken);
		// 发起GET请求删除菜单
		try {
			String returnJson = ToolHttp.get(true, requestUrl);
			RecevieMenuDelete menuDelete = JSON.parseObject(returnJson, RecevieMenuDelete.class);
			if (null != menuDelete) {
				String errorCode = menuDelete.getErrcode();
				if (null != errorCode && errorCode.equals("0")) {
					result = true;
				} else {
					result = false;
					String errorMsg = menuDelete.getErrmsg();
					log.error("删除菜单失败：" + errorMsg);
				}
			}
			return result;
		}catch (Exception e) {
			log.error("ToolMenu.deleteMenu删除菜单异常，accessToken：" + accessToken);
			return result;
		}
	}
}
