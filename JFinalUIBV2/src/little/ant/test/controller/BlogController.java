package little.ant.test.controller;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;

import little.ant.platform.annotation.Controller;
import little.ant.platform.constant.ConstantInit;
import little.ant.platform.controller.BaseController;
import little.ant.platform.model.BaseModel;
import little.ant.platform.tools.ToolDateTime;
import little.ant.test.model.Blog;
import little.ant.test.service.BlogService;
import little.ant.test.validator.BlogValidator;

/**
 * XXX 管理	
 * 描述：
 * 
 * /jf/test/blog
 * /jf/test/blog/save
 * /jf/test/blog/edit
 * /jf/test/blog/update
 * /jf/test/blog/view
 * /jf/test/blog/delete
 * /common/blog/add.html
 * 
 */
@Controller(controllerKey = "/jf/test/blog")
public class BlogController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(BlogController.class);
	
	/**
	 * 列表
	 */
	public void index() {
		paging(ConstantInit.db_dataSource_main, splitPage, BaseModel.sqlId_splitPage_select, Blog.sqlId_splitPage_from);
		render("/test/blog/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(BlogValidator.class)
	public void save() {
		Blog blog = getModel(Blog.class);
		blog.set(Blog.column_createtime, ToolDateTime.getSqlTimestamp(null));
		blog.save();
		render("/test/blog/add.html");
	}
	
	/**
	 * 准备更新
	 */
	public void edit() {
		Blog blog = Blog.dao.findById(getPara());
		setAttr("blog", blog);
		render("/test/blog/update.html");
	}
	
	/**
	 * 更新
	 */
	@Before(BlogValidator.class)
	public void update() {
		getModel(Blog.class).update();
		redirect("/jf/test/blog");
	}

	/**
	 * 查看
	 */
	public void view() {
		Blog blog = Blog.dao.findById(getPara());
		setAttr("blog", blog);
		render("/test/blog/view.html");
	}
	
	/**
	 * 删除
	 */
	public void delete() {
		BlogService.service.delete("test_blog", getPara() == null ? ids : getPara());
		redirect("/jf/test/blog");
	}
	
}


