package com.test.mvc.blog;

import org.apache.log4j.Logger;

import com.jfinal.aop.Before;
import com.platform.annotation.Controller;
import com.platform.mvc.base.BaseController;
import com.platform.mvc.base.BaseModel;

/**
 * XXX 管理	
 * 描述：
 * 
 * /test/blog
 * /test/blog/save
 * /test/blog/edit
 * /test/blog/update
 * /test/blog/view
 * /test/blog/delete
 * /common/blog/add.html
 * 
 */
@Controller("/test/blog")
public class BlogController extends BaseController {

	@SuppressWarnings("unused")
	private static Logger log = Logger.getLogger(BlogController.class);
	
	private BlogService blogService;
	
	/**
	 * 列表
	 */
	public void index() {
		paging(splitPage, BaseModel.sqlId_splitPageSelect, Blog.sqlId_splitPageFrom);
		render("/test/blog/list.html");
	}
	
	/**
	 * 保存
	 */
	@Before(BlogValidator.class)
	public void save() {
		getModel(Blog.class).save();
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
		redirect("/test/blog");
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
		blogService.baseDelete("test_blog", getPara() == null ? ids : getPara());
		redirect("/test/blog");
	}
	
}
