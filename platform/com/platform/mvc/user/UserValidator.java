package com.platform.mvc.user;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.jfinal.log.Log;
import com.jfinal.upload.UploadFile;
import com.platform.mvc.base.BaseValidator;
import com.platform.mvc.upload.UploadService;
import com.platform.tools.ToolDateTime;
import com.platform.tools.ToolRandoms;
import com.platform.tools.ToolString;

@SuppressWarnings({"unused"})
public class UserValidator extends BaseValidator {

	private static final Log log = Log.getLog(UserValidator.class);

	private UserService userService;
	private UploadService uploadService;
	
	protected void validate(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/user/save")){
			// Upload主键和User主键共用
			String ids = ToolRandoms.getUuid(true);
			
			// 先调用getFile方法，否则无法获取参数
			List<UploadFile> files = controller.getFiles("files" + File.separator + "upload", 1 * 1024 * 1024, ToolString.encoding); // 1M
			if(files != null && files.size() != 0){
				uploadService.upload("webRoot", files.get(0), ids);
			}
			
			// 传递到控制器
			controller.setAttr("ids", ids);
			
			// 验证参数
			validateString("password", 6, 18, "passwordMsg", "密码不正确!");
			vali();
			
		}else if(actionKey.equals("/platform/user/update")){
			// 先调用getFile方法，否则无法获取参数
			List<UploadFile> files = controller.getFiles("files" + File.separator + "upload", 1 * 1024 * 1024, ToolString.encoding); // 1M

			// 先调用getFile方法，否则无法获取参数
			if(files != null && files.size() == 1){
				UploadFile file = files.get(0);
				controller.setAttr("file", file); // 传递到控制器
			}
			
			// 验证参数
			validateString("user.ids", 32, 32, "userIdsMsg", "用户主键不正确!");
			validateString("userInfo.ids", 32, 32, "userInfoIdsMsg", "用户信息主键不正确!");

			if(StrKit.notBlank(controller.getPara("password"))){
				validateString("password", 6, 18, "passwordMsg", "密码不正确!");
			}
			
			vali();
		}
	}
	
	protected void vali(){
		validateString("user.departmentids", 32, 32, "departmentMsg", "部门不正确!");
		validateString("user.stationids", 32, 32, "stationMsg", "岗位不正确!");

		validateString("user.idcard", 15, 18, "idcardMsg", "身份证号码不正确!");
		validateString("user.names", 2, 10, "namesMsg", "姓名不正确!");
		validateString("user.username", 5, 16, "usernameMsg", "登陆名不正确!");
		
		validateEmail("user.email", "emailMsg", "邮箱不正确!");
		validateLong("user.mobile", 10000000000L, 99999999999L, "mobileMsg", "手机号码不正确!");
		
		if(StrKit.notBlank(controller.getPara("userInfo.telephone"))){
			validateLong("userInfo.telephone", 1, 99999999999L, "telephoneMsg", "电话号码不正确!");
		}

		if(StrKit.notBlank(controller.getPara("userInfo.qq"))){
			validateLong("userInfo.qq", 1, 999999999999999L, "qqMsg", "QQ号码不正确!");
		}

		if(StrKit.notBlank(controller.getPara("userInfo.birthday"))){
			Date start = ToolDateTime.parse("1900-01-01", ToolDateTime.pattern_ymd);
			Date end = ToolDateTime.getDate();
			validateDate("userInfo.birthday", start, end, "birthdayMsg", "生日不正确!");
		}
	}
	
	protected void handleError(Controller controller) {
		String actionKey = getActionKey();
		if (actionKey.equals("/platform/user/save")){
			controller.keepModel(User.class);
			controller.keepModel(UserInfo.class);
			controller.render("/platform/user/add.html");
		
		}else if (actionKey.equals("/platform/user/update")){
			controller.keepModel(User.class);
			controller.keepModel(UserInfo.class);
			controller.render("/platform/user/update.html");
		}
	}
	
}
